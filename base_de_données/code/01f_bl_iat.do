* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
*
* Project: Breakthrough (BT)
* 
* Purpose: Baseline IAT Deid Raw -> Cleaned
*
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

cap log close
clear all

set matsize 2400
*set scheme indo

set more off
set maxvar 15000

global baseline_iat_cleaned "$main_loc/Main Analysis and Paper/Analysis data/baseline_iat_cleaned.dta"
global baseline_iat_raw "$main_loc/Main Analysis and Paper/Analysis data/baseline_iat_raw.dta"

use "$baseline_iat_raw", clear


drop if inlist(subject,2114132,2418017,4406024)    // These IDs did not do baseline survey
drop if inlist(subject,2205078,2512046,3205020,3311033,4222039)   // 
replace subject=2514055 if subject==2515055    // 
replace response="2514055" if subject==2514055 & trialcode=="uniqueid"


** Other ID errors

// the length of subject is too long

replace response = "4507021" if subject == 457021 & date_encoded == 31 & time_encoded == 1188 & trialcode=="uniqueid"
replace subject = 4507021 if subject == 457021 & date_encoded == 31 & time_encoded == 1188

replace response = "4507073" if subject == 457073 & date_encoded == 31 & time_encoded == 987 & trialcode=="uniqueid"
replace subject = 4507073 if subject == 457073 & date_encoded == 31 & time_encoded == 987

replace response = "4507055" if subject == 457055 & date_encoded == 31 & time_encoded == 1050 & trialcode=="uniqueid"
replace subject = 4507055 if subject == 457055 & date_encoded == 31 & time_encoded == 1050

// type in the trial code

replace response="4215011" if trialcode=="uniqueid" & subject==4215011    



sort subject time_encoded blocknum trialnum            // generate a corrected id based on id entered in on the last page
gen idcheck=real(response) if trialcode=="uniqueid"    // the id entered on the last page is called "idcheck"
count if subject!=idcheck & !mi(idcheck)
gen subject_id2=subject if idcheck==subject      // subject matches idcheck
replace subject_id2=idcheck if length(string(subject))!=7 & length(string(idcheck))==7 & mi(subject_id2)   // there is a conflict but idcheck is the correct length
replace subject_id2=subject if length(string(subject))==7 & length(string(idcheck))!=7 & !mi(idcheck) & mi(subject_id2)   // there is a conflict but subject is the correct length
replace subject_id2=-888 if length(string(subject))!=7 & length(string(idcheck))!=7 & trialcode=="uniqueid"   // both ids are not 7 digits
drop if subject_id2==-888 & subject==1    // drop the example tests where subject==1
list subject idcheck if subject_id2==-888         // see that subject=1 when both ids are incorrect




count if subject!=idcheck & !mi(idcheck) & mi(subject_id2)  // in these cases, they are both correct lengths but don't match
gen id_conflict2=subject!=idcheck & !mi(idcheck) & mi(subject_id2) 
replace subject_id2=idcheck if id_conflict2==1     // idcheck is assumed to be correct in such cases
replace id_conflict2=1 if subject_id2<0

bys subject time_encoded: egen check=sd(subject)     // sorting by subject and time groups each set of tests
assert check==0
bys subject time_encoded: egen subject_id=min(subject_id2)
bys subject time_encoded: egen id_conflict=max(id_conflict2)
drop if mi(subject_id) & subject==1       // drop the tests where subject==1 and the test is incomplete
drop subject_id2 id_conflict2 subject_id2 idcheck check

bys subject time_encoded: egen num_trial=count(subject) if mi(subject_id)
assert num_trial<=204 if !mi(num_trial)       // these surveys are also incomplete so missing subject_id
gen incomplete=mi(subject_id)
bys subject: egen restarted=max(incomplete)   // mark which surveys have been restared 

drop if incomplete           // drop the incomplete surveys
drop num_trial incomplete

sort subject_id date_encoded time_encoded blocknum trialnum trialcode  
bys subject_id: egen num_trial=count(subject_id)   // now we try to mark duplicate tests
gen duplicate=num_trial==408 
egen tempgroup=group(subject_id date_encoded time_encoded)       // soring by time assigns higher group number to second tries 
bys subject_id: egen second_try=max(tempgroup)     
replace duplicate=2 if second_try==tempgroup & duplicate==1
label define duplicate 0 "No duplicate" 1 "First try" 2 "Second try"
label values duplicate duplicate
drop tempgroup second_try
egen iat_tag=tag(subject_id duplicate)


* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
*	
*		Generating D measure
*
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

** improved D based on :
* http://faculty.washington.edu/agg/pdf/GB&N.JPSP.2003.pdf
* http://faculty.washington.edu/agg/pdf/Lane%20et%20al.UUIAT4.2007.pdf



sort subject_id date_encoded time_encoded blocknum trialnum trialcode  

gen latency_temp=latency if inlist(blocknum,4,6,8,10)  // use latency from block 4, 6, 8, 10

gen latency_temp2=latency_temp if latency_temp<300  // exclude subject if more than 10% of trials latency smaller than 300 msec
bys subject_id date_encoded time_encoded: egen count_total=count(latency_temp)
bys subject_id date_encoded time_encoded: egen count_fast=count(latency_temp2)
gen ratio_fast=count_fast/count_total
gen dropiat=ratio_fast>0.1          
count if dropiat & iat_tag

replace latency_temp=. if latency_temp>10000   // exclude latency greater than 10,000 msec
drop latency_temp2 count_total count_fast 


gen prac_lat=latency_temp if inlist(blocknum,4,8)    // compute inclusive standard deviation
gen test_lat=latency_temp if inlist(blocknum,6,10)
bys subject_id date_encoded time_encoded: egen sd_prac=sd(prac_lat)
bys subject_id date_encoded time_encoded: egen sd_test=sd(test_lat)

foreach x of numlist 4 6 8 10{             // compute mean latency by block
	gen lat`x'=latency_temp if blocknum==`x'
	bys subject_id date_encoded time_encoded: egen temp_lat`x'=mean(lat`x')
	bys subject_id date_encoded time_encoded: egen mean_lat`x'=min(temp_lat`x')
	drop lat`x' temp_lat`x'
}

gen first_compat=blocknum==6 & blockcode=="compatibletest"     // marking those who first had boy & good words on the same category
bys subject_id date_encoded time_encoded: egen boy_good_first=max(first_compat)
drop first_compat
label define boy_good_first 0 "Boy & Bad words first" 1 "Boy & Good words first" 
label values boy_good_first boy_good_first


gen latency_temp2=latency_temp if correct==1

foreach x of numlist 4 6 8 10{             // compute mean latency by block
	gen lat`x'=latency_temp2 if blocknum==`x'
	bys subject_id date_encoded time_encoded: egen temp_lat`x'=mean(lat`x')
	bys subject_id date_encoded time_encoded: egen mean2_lat`x'=min(temp_lat`x')
	drop lat`x' temp_lat`x'
	replace latency_temp2=mean2_lat`x'+600 if mi(latency_temp2) & blocknum==`x'
}
drop mean2_lat*

foreach x of numlist 4 6 8 10{             // compute mean latency by block
	gen lat`x'=latency_temp2 if blocknum==`x'
	bys subject_id date_encoded time_encoded: egen temp_lat`x'=mean(lat`x')
	bys subject_id date_encoded time_encoded: egen mean2_lat`x'=min(temp_lat`x')
	drop lat`x' temp_lat`x'
}


keep if iat_tag       // compute D_measure for each student
gen effect_prac=(mean_lat8-mean_lat4)/sd_prac if boy_good_first           // higher numbers indicate implicit preference for boys
replace effect_prac=(mean_lat4-mean_lat8)/sd_prac if !boy_good_first
gen effect_test=(mean_lat10-mean_lat6)/sd_test if boy_good_first
replace effect_test=(mean_lat6-mean_lat10)/sd_test if !boy_good_first
gen D_measure=(effect_prac+effect_test)/2

gen D_measure_fast=D_measure
replace D_measure=. if dropiat==1
label var D_measure "D measure"
label var D_measure_fast "D measure (including fast respondents)"



gen effect_prac2=(mean2_lat8-mean2_lat4)/sd_prac if boy_good_first           // higher numbers indicate implicit preference for boys
replace effect_prac2=(mean2_lat4-mean2_lat8)/sd_prac if !boy_good_first
gen effect_test2=(mean2_lat10-mean2_lat6)/sd_test if boy_good_first
replace effect_test2=(mean2_lat6-mean2_lat10)/sd_test if !boy_good_first
gen D_measure_alt=(effect_prac2+effect_test2)/2

gen D_measure_alt_fast=D_measure_alt
replace D_measure_alt=. if dropiat==1
label var D_measure_alt "D measure (imputing incorrect answers)"
label var D_measure_alt_fast "D measure (including fast respondents and imputing incorrect answers)"


drop if duplicate==1   // drop first attempts
assert id_conflict==0  // no remaining cases to check over

rename subject_id child_id
keep date_encoded time_encoded child_id restarted duplicate boy_good_first D_measure D_measure_fast dropiat ratio_fast D_measure_alt D_measure_alt_fast

label var child_id "Child ID"
label var restarted "IAT appears to have been restarted"
label var duplicate "IAT appears to be the second attempt"
label var ratio_fast "Proportion of fast responses"
label var dropiat "Fast respondents"
label var boy_good_first "Boy-Good pairing was given first"

drop date_encoded time_encoded
	
rename * iat_*
rename iat_child_id child_id
rename iat_D_measure D_measure
rename iat_D_measure_fast D_measure_fast
rename iat_D_measure_alt D_measure_alt
rename iat_D_measure_alt_fast D_measure_alt_fast

save "$baseline_iat_cleaned", replace
