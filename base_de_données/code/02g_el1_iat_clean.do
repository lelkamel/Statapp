* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
* Project: 		Breakthrough (BT)
*
* Purpose:		Endline 1 IAT Deid Raw -> Cleaned
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

	cd "$main_loc"

	global endline1_iat_cleaned "Main Analysis and Paper/Analysis data/endline1_iat_cleaned.dta"
	global endline1_iat_raw1 "Main Analysis and Paper/Analysis data/endline1_iat_raw1.dta"
	global endline1_iat_raw2 "Main Analysis and Paper/Analysis data/endline1_iat_raw2.dta"

* ===================================================================== *
* -----------------    Date cleaning EL_IAT1          ----------------- *
* ===================================================================== *

	use "$endline1_iat_raw1", clear

// Data cleaning was done on similar lines as the btriaseline cleaning do-file

	replace response="2110013" if response=="211oo13"
	replace response="1101011" if response=="11010111"

	drop if date_encoded==112 // the IAT date is before the survey start date

	
	sort subject time_encoded blocknum trialnum            // generate a corrected id based on id entered in on the last page
	gen idcheck=real(response) if trialcode=="uniqueid"    // the id entered on the last page is called "idcheck"
	count if subject!=idcheck & !mi(idcheck)
	gen subject_id2=subject if idcheck==subject      // subject matches idcheck
	replace subject_id2=idcheck if length(string(subject))!=7 & length(string(idcheck))==7 & mi(subject_id2)   // there is a conflict but idcheck is the correct length
	replace subject_id2=subject if length(string(subject))==7 & length(string(idcheck))!=7 & !mi(idcheck) & mi(subject_id2)   // there is a conflict but subject is the correct length
	replace subject_id2=-888 if length(string(subject))!=7 & length(string(idcheck))!=7 & trialcode=="uniqueid"   // both ids are not 7 digits

	count if subject!=idcheck & !mi(idcheck) & mi(subject_id2)  // in these cases, they are both correct lengths but don't match
	gen id_conflict2=subject!=idcheck & !mi(idcheck) & mi(subject_id2) 
	replace subject_id2=idcheck if id_conflict2==1     // idcheck is assumed to be correct in such cases
  

	bys subject time_encoded: egen check=sd(subject)     // sorting by subject and time groups each set of tests
	assert check==0
	bys subject time_encoded: egen subject_id=min(subject_id2)
	bys subject time_encoded: egen id_conflict=max(id_conflict2)

	gen incomplete=mi(subject_id)
	bys subject: egen restarted=max(incomplete)   // mark which surveys have been restared 


	drop if subject_id<0 
	drop if subject_id==9999999
	drop if subject_id==7777777
	drop if subject_id==1234567
	drop if subject_id==4567432

	drop if subject_id==1414039 // child was not surveyed
	drop if subject_id==2109104 // child was not surveyed
	drop if subject_id==2110063 // child was not surveyed
	drop if subject_id==3410154 // child was not surveyed
	drop if subject_id==4303032 // child was not surveyed
	drop if subject_id==4501020 // child was not surveyed

	drop if subject_id==1209092 // child refused consent for survey
	drop if subject_id==3310125 // child is mentally unwell
	drop if subject_id==4214060 // child is mentally unwell
	drop if subject_id==3305052 // wrong child ID


	***some anolmalies***
	replace subject_id=1309020 if subject_id==1109020
	replace subject_id=1314037 if subject_id==1314000
	replace subject_id=2305023 if subject_id==2023305
	replace subject_id=2406053 if subject_id==2106053
	replace subject_id=2110079 if subject_id==2110069
	replace subject_id=2411008 if subject_id==2114008
	replace subject_id=2608060 if subject_id==2208060
	replace subject_id=1304010 if subject_id==2304010
	replace subject_id=2703091 if subject_id==2307091
	replace subject_id=2505114 if subject_id==2503114
	replace subject_id=3421010 if subject_id==3221010
	replace subject_id=3421032 if subject_id==3221032
	replace subject_id=3404091 if subject_id==3304091
	replace subject_id=3512027 if subject_id==3412027
	replace subject_id=3512040 if subject_id==3412040
	replace subject_id=3414015 if subject_id==4314015


	/**some entries or trials are repeated: this could be because 
	   we changed laptops between survey activities (the laptops
	   were not functioning properly)
	   It could be the case that Ananta or I copy pasted the same trials 
	   from two laptops
	**/

	duplicates drop 
	
	drop if incomplete
	drop subject_id2 id_conflict2 subject_id2 idcheck check
	
	sort subject_id date_encoded time_encoded blocknum trialnum trialcode  
	bys subject_id: egen num_trial=count(subject_id)   // now we try to mark duplicate tests
	gen duplicate=num_trial!=204

	egen date_time=group(date_encoded time_encoded)
	bys subject_id (date_encoded time_encoded): gen tempgroup=sum( date_time!= date_time[_n-1])

	bys subject_id: egen number_try=max(tempgroup)     
	
	label define number_try 0 "No duplicate" 1 "One try" 2 "Two tries" 3 "Three tries" 4 "Four tries" 5 "Five tries"
	label values number_try number_try

	label define duplicate 0 "No" 1 "Yes" 
	label values duplicate duplicate

	egen iat_tag=tag(subject_id tempgroup) // Tag each trial by each subject 

	drop date_time 


* ===================================================================== *
* -----------------     	Generating D measure      ----------------- *
* ===================================================================== *


** improved D based on :
* http://faculty.washington.edu/agg/pdf/GB&N.JPSP.2003.pdf
* http://faculty.washington.edu/agg/pdf/Lane%20et%20al.UUIAT4.2007.pdf

// Generating D measure is done on similar lines as the baseline do-file




	sort subject_id date_encoded time_encoded blocknum trialnum trialcode  

	gen latency_temp=latency if inlist(blocknum,4,6,8,10)  // use latency from block 4, 6, 8, 10

	gen latency_temp2=latency_temp if latency_temp<300  // exclude subject if more than 10% of trials latency smaller than 300 msec
	bys subject_id tempgroup: egen count_total=count(latency_temp)
	bys subject_id tempgroup: egen count_fast=count(latency_temp2)
	gen ratio_fast=count_fast/count_total
	gen dropiat=ratio_fast>0.1          
	count if dropiat & iat_tag 

	replace latency_temp=. if latency_temp>10000   // exclude latency greater than 10,000 msec
	drop latency_temp2 count_total count_fast 


	gen prac_lat=latency_temp if inlist(blocknum,4,8)    // compute inclusive standard deviation
	gen test_lat=latency_temp if inlist(blocknum,6,10)
	bys subject_id tempgroup: egen sd_prac=sd(prac_lat)
	bys subject_id tempgroup: egen sd_test=sd(test_lat)

	foreach x of numlist 4 6 8 10{             // compute mean latency by block
		gen lat`x'=latency_temp if blocknum==`x'
		bys subject_id tempgroup: egen temp_lat`x'=mean(lat`x')
		bys subject_id tempgroup: egen mean_lat`x'=min(temp_lat`x') //EDIT: this changes nothing, but I don't understand why you wouldn't just generate mean_lat using mean(lat`x'). Taking the min within the group changes nothing as all values of temp_lat within that group are the same.
		drop lat`x' temp_lat`x'
	}

	gen first_compat=blocknum==6 & blockcode=="compatibletest"     // marking those who first had boy & good words on the same category
	bys subject_id tempgroup: egen boy_good_first=max(first_compat)
	drop first_compat
	label define boy_good_first 0 "Boy & Bad words first" 1 "Boy & Good words first" 
	label values boy_good_first boy_good_first


	gen latency_temp2=latency_temp if correct==1

	foreach x of numlist 4 6 8 10{             // compute mean latency by block
		gen lat`x'=latency_temp2 if blocknum==`x'
		bys subject_id tempgroup: egen temp_lat`x'=mean(lat`x')
		bys subject_id tempgroup: egen mean2_lat`x'=min(temp_lat`x') //EDIT: same as the previous one
		drop lat`x' temp_lat`x'
		replace latency_temp2=mean2_lat`x'+600 if mi(latency_temp2) & blocknum==`x'
	}
	
	drop mean2_lat*

	foreach x of numlist 4 6 8 10{             // compute mean latency by block
		gen lat`x'=latency_temp2 if blocknum==`x'
		bys subject_id tempgroup: egen temp_lat`x'=mean(lat`x')
		bys subject_id tempgroup: egen mean2_lat`x'=min(temp_lat`x') //EDIT: same redundancy 
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


	drop if tempgroup==1 & number_try==2	
	drop if (tempgroup==1 | tempgroup==2) & number_try==3	
	drop if (tempgroup==1 | tempgroup==2 | tempgroup==3) & number_try==4	
	drop if (tempgroup==1 | tempgroup==2 | tempgroup==3 | tempgroup==4) & number_try==5


	*assert id_conflict==0  // no remaining cases to check over

	rename subject_id child_id
	lab var number_try "Number of tries"
	lab var duplicate "Duplicate"

	keep date_encoded time_encoded child_id restarted duplicate number_try boy_good_first D_measure D_measure_fast dropiat ratio_fast D_measure_alt D_measure_alt_fast

	gen iat_numb=1

	sort child_id
	tempfile iatdata1
	save `iatdata1', replace

* ===================================================================== *
* -----------------     	  Date cleaning EL1_IAT2  ----------------- *
* ===================================================================== *

	use "$endline1_iat_raw2", clear

	drop if date_encoded == 112

	sort subject time_encoded blocknum trialnum            // generate a corrected id based on id entered in on the last page
	gen idcheck=real(response) if trialcode=="uniqueid"    // the id entered on the last page is called "idcheck"
	count if subject!=idcheck & !mi(idcheck)
	gen subject_id2=subject if idcheck==subject      // subject matches idcheck
	replace subject_id2=idcheck if length(string(subject))!=7 & length(string(idcheck))==7 & mi(subject_id2)   // there is a conflict but idcheck is the correct length
	replace subject_id2=subject if length(string(subject))==7 & length(string(idcheck))!=7 & !mi(idcheck) & mi(subject_id2)   // there is a conflict but subject is the correct length
	replace subject_id2=-888 if length(string(subject))!=7 & length(string(idcheck))!=7 & trialcode=="uniqueid"   // both ids are not 7 digits
	replace subject_id2=subject if response=="9999999"
	
	count if subject!=idcheck & !mi(idcheck) & mi(subject_id2)  // in these cases, they are both correct lengths but don't match
	gen id_conflict2=subject!=idcheck & !mi(idcheck) & mi(subject_id2) 
	*replace subject_id2=idcheck if id_conflict2==1     // idcheck is assumed to be correct in such cases


	replace subject_id2=subject if subject==1109066 & trialcode=="uniqueid"
	drop if subject==1110092
	replace subject_id2=subject if subject==1112051 & trialcode=="uniqueid"
	replace subject_id2=1202011 if subject==1202021 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==1209009 & trialcode=="uniqueid"
	replace subject_id2=1216060 if subject==1215010 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==1215056 & trialcode=="uniqueid"
	replace subject_id2=1304071 if subject==1304073 & trialcode=="uniqueid"
	replace subject_id2=1402065 if subject==1402086 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==1408076 & trialcode=="uniqueid"
	replace subject_id2=1104182 if subject==1411182 & trialcode=="uniqueid"
	replace subject_id2=1503039 if subject==1503141 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==1504143 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==2121061 & trialcode=="uniqueid"
	replace subject_id2=2123007 if subject==2123005 & trialcode=="uniqueid"
	replace subject_id2=2202052 if subject==2204052 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==2213107 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==2310070 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==2405058 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==2413046 & trialcode=="uniqueid"
	replace subject_id2=4216040 if subject==2416040 & trialcode=="uniqueid"
	replace subject_id2=4219051 if subject==2419051 & trialcode=="uniqueid"
	replace subject_id2=2402053 if subject==2492053 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==2608010 & trialcode=="uniqueid"
	replace subject_id2=2416018 if subject==2614018 & trialcode=="uniqueid"
	replace subject_id2=2707031 if subject==2707026 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==2313005 & trialcode=="uniqueid"
	replace subject_id2=3102067 if subject==3102070 & trialcode=="uniqueid"
	replace subject_id2=3202070 if subject==3302070 & trialcode=="uniqueid"
	replace subject_id2=4218016 if subject==4218019 & trialcode=="uniqueid"
	replace subject_id2=4215006 if subject==4222006 & trialcode=="uniqueid"
	replace subject_id2=4503001 if subject==4305001 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==3109029 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==3203054 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==3410011 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==3412013 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==3508061 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==3510049 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==4206010 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==4210035 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==4213065 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==4219012 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==4221005 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==4304013 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==4405021 & trialcode=="uniqueid"
	replace subject_id2=subject if subject==4505036 & trialcode=="uniqueid"



	drop if subject_id2==1 | subject_id2==32
	drop if subject_id2==1234567
	drop if subject_id2==2704038 //school ID 2704 not surveyed

	***some anolmalies***
	replace subject_id2=3105075 if subject_id2==3105057
	replace subject_id2=3406065 if subject_id2==3406054

	**survey not done
	drop if subject_id2==1106169
	drop if subject_id2==1406030
	drop if subject_id2==2103023
	drop if subject_id2==2204098
	drop if subject_id2==2608050
	drop if subject_id2==2615005
	drop if subject_id2==3106015



	bys subject time_encoded: egen check=sd(subject)     // sorting by subject and time groups each set of tests
	assert check==0
	bys subject time_encoded: egen subject_id=min(subject_id2)
	bys subject time_encoded: egen id_conflict=max(id_conflict2)

	gen incomplete=mi(subject_id)
	bys subject: egen restarted=max(incomplete)   // mark which surveys have been restarted 

	duplicates drop 

	drop if incomplete
	drop subject_id2 id_conflict2 subject_id2 idcheck check
	


	sort subject_id date_encoded time_encoded blocknum trialnum trialcode  
	bys subject_id: egen num_trial=count(subject_id)   // now we try to mark duplicate tests
	gen duplicate=num_trial!=204

	egen date_time=group(date_encoded time_encoded)
	bys subject_id (date_encoded time_encoded): gen tempgroup=sum( date_time!= date_time[_n-1])

	bys subject_id: egen number_try=max(tempgroup)     
	
	label define number_try 0 "No duplicate" 1 "One try" 2 "Two tries" 3 "Three tries" 4 "Four tries" 5 "Five tries"
	label values number_try number_try

	label define duplicate 0 "No" 1 "Yes" 
	label values duplicate duplicate

	egen iat_tag=tag(subject_id tempgroup) // Tag each trial by each subject 

	drop date_time 


* ===================================================================== *
* -----------------     	Generating D measure      ----------------- *
* ===================================================================== *


** improved D based on :
* http://faculty.washington.edu/agg/pdf/GB&N.JPSP.2003.pdf
* http://faculty.washington.edu/agg/pdf/Lane%20et%20al.UUIAT4.2007.pdf

// Generating D measure is done on similar lines as the baseline do-file




	sort subject_id date_encoded time_encoded blocknum trialnum trialcode  

	gen latency_temp=latency if inlist(blocknum,4,6,8,10)  // use latency from block 4, 6, 8, 10

	gen latency_temp2=latency_temp if latency_temp<300  // exclude subject if more than 10% of trials latency smaller than 300 msec
	bys subject_id tempgroup: egen count_total=count(latency_temp)
	bys subject_id tempgroup: egen count_fast=count(latency_temp2)
	gen ratio_fast=count_fast/count_total
	gen dropiat=ratio_fast>0.1          
	count if dropiat & iat_tag

	replace latency_temp=. if latency_temp>10000   // exclude latency greater than 10,000 msec
	drop latency_temp2 count_total count_fast 


	gen prac_lat=latency_temp if inlist(blocknum,4,8)    // compute inclusive standard deviation
	gen test_lat=latency_temp if inlist(blocknum,6,10)
	bys subject_id tempgroup: egen sd_prac=sd(prac_lat)
	bys subject_id tempgroup: egen sd_test=sd(test_lat)

	foreach x of numlist 4 6 8 10{             // compute mean latency by block
		gen lat`x'=latency_temp if blocknum==`x'
		bys subject_id tempgroup: egen temp_lat`x'=mean(lat`x')
		bys subject_id tempgroup: egen mean_lat`x'=min(temp_lat`x')
		drop lat`x' temp_lat`x'
	}

	gen first_compat=blocknum==6 & blockcode=="compatibletest"     // marking those who first had boy & professional tasks on the same category
	bys subject_id tempgroup: egen boy_prof_first=max(first_compat)
	drop first_compat
	label define boy_prof_first 0 "Boy & domestic work first" 1 "Boy & professional work first" 
	label values boy_prof_first boy_prof_first


	gen latency_temp2=latency_temp if correct==1

	foreach x of numlist 4 6 8 10{             // compute mean latency by block
		gen lat`x'=latency_temp2 if blocknum==`x'
		bys subject_id tempgroup: egen temp_lat`x'=mean(lat`x')
		bys subject_id tempgroup: egen mean2_lat`x'=min(temp_lat`x')
		drop lat`x' temp_lat`x'
		replace latency_temp2=mean2_lat`x'+600 if mi(latency_temp2) & blocknum==`x'
	}
	
	drop mean2_lat*

	foreach x of numlist 4 6 8 10{             // compute mean latency by block
		gen lat`x'=latency_temp2 if blocknum==`x'
		bys subject_id tempgroup: egen temp_lat`x'=mean(lat`x')
		bys subject_id tempgroup: egen mean2_lat`x'=min(temp_lat`x')
		drop lat`x' temp_lat`x'
	}


	keep if iat_tag       // compute D_measure for each student
	gen effect_prac=(mean_lat8-mean_lat4)/sd_prac if boy_prof_first           // higher numbers indicate implicit preference for boys
	replace effect_prac=(mean_lat4-mean_lat8)/sd_prac if !boy_prof_first
	gen effect_test=(mean_lat10-mean_lat6)/sd_test if boy_prof_first
	replace effect_test=(mean_lat6-mean_lat10)/sd_test if !boy_prof_first
	gen D_measure=(effect_prac+effect_test)/2

	gen D_measure_fast=D_measure
	replace D_measure=. if dropiat==1
	label var D_measure "D measure"
	label var D_measure_fast "D measure (including fast respondents)"



	gen effect_prac2=(mean2_lat8-mean2_lat4)/sd_prac if boy_prof_first           // higher numbers indicate implicit preference for boys
	replace effect_prac2=(mean2_lat4-mean2_lat8)/sd_prac if !boy_prof_first
	gen effect_test2=(mean2_lat10-mean2_lat6)/sd_test if boy_prof_first
	replace effect_test2=(mean2_lat6-mean2_lat10)/sd_test if !boy_prof_first
	gen D_measure_alt=(effect_prac2+effect_test2)/2

	gen D_measure_alt_fast=D_measure_alt
	replace D_measure_alt=. if dropiat==1
	label var D_measure_alt "D measure (imputing incorrect answers)"
	label var D_measure_alt_fast "D measure (including fast respondents and imputing incorrect answers)"


	drop if tempgroup==1 & number_try==2
	drop if (tempgroup==1 | tempgroup==2) & number_try==3
	drop if (tempgroup==1 | tempgroup==2 | tempgroup==3) & number_try==4
	drop if (tempgroup==1 | tempgroup==2 | tempgroup==3 | tempgroup==4) & number_try==5

	*assert id_conflict==0  // no remaining cases to check over

	rename subject_id child_id
	lab var number_try "Number of tries"
	lab var duplicate "Duplicate"

	keep date_encoded time_encoded child_id restarted duplicate number_try boy_prof_first D_measure D_measure_fast dropiat ratio_fast D_measure_alt D_measure_alt_fast

	gen iat_numb=2


	sort child_id
	tempfile iatdata2
	save `iatdata2', replace



	append using `iatdata1'

	label var date_encoded "IAT date (encoded)"
	label var time_encoded "IAT time (encoded)"
	label var child_id "Child ID"
	label var restarted "IAT appears to have been restarted"
	label var duplicate "IAT appears to be the second attempt"
	label var ratio_fast "Proportion of fast responses"
	label var dropiat "Fast respondents"
	label var boy_good_first "Boy-Good/Professional task pairing was given first"
	label var boy_prof_first "Boy-Professional task pairing was given first"
	label var iat_numb "IAT executed at endline"
	label var D_measure "D measure of the IAT"

	label define iat 1 "Good vs Bad" 2 "Occupation"
	label values iat_numb iat




* ===================================================================== *
* ----------------- Duplicates in the appended dataset ---------------- *
* ===================================================================== *


	**dropped because wrong IAT was administered (checked from tracking sheets)
	drop if child_id==1205010 & iat_numb==2
	drop if child_id==1211031 & iat_numb==1
	drop if child_id==1214038 & iat_numb==1
	drop if child_id==1304080 & iat_numb==1
	drop if child_id==1406052 & iat_numb==1
	drop if child_id==2106025 & iat_numb==2
	drop if child_id==2305017 & iat_numb==1
	drop if child_id==2410014 & iat_numb==1
	drop if child_id==2511048 & iat_numb==1
	drop if child_id==2707031 & iat_numb==2
	drop if child_id==3406088 & iat_numb==1
	drop if child_id==3507114 & iat_numb==2
	drop if child_id==4201002 & iat_numb==1
	drop if child_id==4205008 & iat_numb==1
	drop if child_id==4406056 & iat_numb==1
	drop if child_id==4508050 & iat_numb==1


	**dropped because student did not do IAT during baseline
	drop if child_id==1209009
	drop if child_id==2216052
	drop if child_id==2407053
	drop if child_id==2413015
	drop if child_id==2609056
	drop if child_id==3104054
	drop if child_id==3301031


	sort child_id



	local date = c(current_date)
	
	***
	drop date_encoded time_encoded 
	save "${endline1_iat_cleaned}", replace
