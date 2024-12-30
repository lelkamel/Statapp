/************************************************
Project: Breakthrough (BT)
Purpose: Master do file to run do-files pertaining to 
* 1. all phases (baseline, endline 1, endline 2)
* 2. samples (students, schools, parents, IAT, census). 
************************************************/

version 14
set more off


* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * * PART 1:  SET DIRECTORY (EDIT HERE) * * * * * * * 
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

global main_loc "C:/Users/jtg3519/Documents" //insert path where "Main Analysis and Paper" is stored
global do "$main_loc/Main Analysis and Paper/do_files"
adopath + "${do}/_ado"
	
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* * * * * * * * * * * * PART 2: SET DATA PATHS * * * * * * * * * * *  
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

	
**********************
***** 2.2  DATASETS
**********************

global deid "$main_loc/Main Analysis and Paper/Analysis data"

********* BASELINE
global baseline_student_raw "$deid/baseline_student_raw"
global baseline_student_final "$deid/baseline_student_final"

global baseline_parent_raw "$deid/baseline_parent_raw"
global baseline_parent_final "$deid/baseline_parent_final"

global baseline_iat_raw "$deid/baseline_iat_raw"
global baseline_iat_cleaned "$deid/baseline_iat_cleaned"

global baseline "$deid/baseline_all_final" 
global baseline_sch "$deid/baseline_school_cleaned"

global baseline_cen "$deid/baseline_census_cleaned"

********* ENDLINE 1
global endline1_student_raw "$deid/endline1_student_raw"

global endline1_iat_raw1 "$deid/endline1_iat_raw1"
global endline1_iat_raw2 "$deid/endline1_iat_raw2"
global endline1_iat_cleaned "$deid/endline1_iat_cleaned"

global endline "$deid/endline1_student_final"

* school data
global endline_school_scert_raw "$deid/endline_school_scert_raw"
global endline_school_scert_final "$deid/endline_school_scert_final"
global endline_school_board_cleaned "$deid/endline_school_board_cleaned"

global endline_sch "$deid/endline1_school_final"


********* ENDLINE 2
global endline2_student_raw "$deid/endline2_student_raw"
global endline2_student_final "$deid/endline2_student_final"

********* Final data for analysis  
global finaldata "$deid/bt_analysis_final"

* output : tables and figures
global mainpaper "Main Analysis and Paper/Paper"
global tables "Main Analysis and Paper/Tables/paper_tables"
//global othtables "Main Analysis and Paper/Tables/other_internal_tables/EL2"
global figures "Main Analysis and Paper/Figures"
global slides "Main Analysis and Paper/Tables/beamer_tables"

* ad-hoc analysis
global ad_hoc "$main_loc/Main Analysis and Paper/ad-hoc analysis"

** installing user-written commands	 
	foreach package in outreg2 egenmore unique estout coefplot corrtex putexcel { 
     capture which `package'
	  if _rc==111 {
		ssc install `package' 
		 }
	}


* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* * * * * * * * * * * * PART 3: DATA CLEANING AND MERGING * * * * * * * * * * *  
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


********************************************
***** 3.1 Baseline data cleaning
********************************************

***  Baseline student data cleaning
use "$baseline_student_raw", clear
do "$do/01a_bl_s_gen_vars" // generates new variables
do "$do/01b_bl_s_clean_oth" // cleans other-specify values

rename * S*
rename Schild_id child_id

save "$baseline_student_final", replace

***  Baseline parent data cleaning
use "$baseline_parent_raw", clear
do "$do/01c_bl_p_gen_vars" // generates new variables
do "$do/01d_bl_p_clean_oth.do" // cleans other-specify values

tempfile parent
save `parent', replace

** Drop data for the households we did not successfully survey (since filled in values may get confusing)

// includes households that only did section A, parent was not available, parent did not give consent, parent was disabled or surveyed the wrong parent

keep if survey_success==0
keep round_id district panipat sonipat rohtak jhajjar team_id school_id surveyor_id actual_surveyor child_id AB_merge phase wrong_parent_redo wrong_parent_surveyed survey_attempted survey_success total
tempfile attempted
save `attempted', replace

use `parent', clear
keep if survey_success==1
append using `attempted'

drop assigned_parent    // prone to errors as entered by enumerator (student data has correct version)

rename * P*
rename Pchild_id child_id
save "$baseline_parent_final", replace



* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
*		Merge Student + Parent Data
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

use "$baseline_student_final", clear
merge 1:1 child_id using "$baseline_parent_final", gen(parent_merge)

replace parent_merge=1 if Psurvey_success==0     // if parent was not successfully surveyed, parent_merge==1
label var parent_merge "Merge status with parent data"
label define parent_merge 1 "Only student interviewed" 2 "Only parent interviewed" 3 "Interviewed both"
label values parent_merge parent_merge

replace Psurvey_success=0 if mi(Psurvey_success)
replace Psurvey_attempted=0 if mi(Psurvey_attempted)


* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
*		Baseline IAT Clean and Merge
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
preserve
do "$do/01f_bl_iat"
restore

merge 1:1 child_id using "$baseline_iat_cleaned", gen(iat_merge)
recode iat_merge (1=0) (3=1)
label define iat_merge 0 "Did not do IAT" 1 "Did IAT"
label values iat_merge iat_merge
label var iat_merge "Student did IAT"

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
*		Merge school-level treatment and strata
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

preserve
use "$baseline_sch", clear
rename School_ID Sschool_id 
tempfile sch
save `sch', replace
restore

merge m:1 Sschool_id using `sch', keepusing(treat stratum) 
drop _m

***** dropping erronous child and school IDs

drop if child_id == 3205037 // this child was blind at baseline

drop if Sschool_id==2704 // wrong school surveyed during baseline


** The following loop makes the value label names consistent with the variable names

foreach x of varlist _all{          // all variables
	local labname: value label `x'
	if "`labname'"!=""{             // if the variable has a label
		if "`x'"!="`labname'"{      // and label name is not consistent with variable name
			cap label list `labname'   // check if label has errors
			if !_rc{                   // if there is no error, change label name
				label copy `labname' `x', replace     
				label values `x' `x'
			}
			else label values `x' .    // if error, detach label from the variable
		}
	}
}

**  drop unused labels
quietly: labelbook, problems
la drop `r(notused)'  

***** change code for caste
do "$do/01e_bl_caste.do" // runs code to clean and consolidate the baseline caste variables

label data "Merged baseline student, parent, and IAT data"

save "$baseline", replace


* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

********************************************
***** 3.2 Endline 1 data cleaning
********************************************

use "$endline1_student_raw", clear 

do "$do/02a_el1_s_label" // label variables
do "$do/02b_el1_s_clean" // cleaning and recoding missing and skip values 
do "$do/02c_el1_s_clean_oth" // cleans other-specify values
do "$do/02d_el1_s_gen_vars" // generating variables


tempfile el1
save `el1', replace

* ===================================================================== *
* -----------------     	  IAT data		 		  ----------------- *
* ===================================================================== *
	
	do "$do/02g_el1_iat_clean"

	use "$endline1_iat_cleaned", clear

	rename * iat_*
	rename iat_child_id child_id
	rename iat_D_measure D_measure
	rename iat_D_measure_fast D_measure_fast
	rename iat_D_measure_alt D_measure_alt
	rename iat_D_measure_alt_fast D_measure_alt_fast
	rename iat_iat_numb iat_numb

	sort child_id
	tempfile iat
	save `iat', replace


* ===================================================================== *
* -----------------     	  Endline student data    ----------------- *
* ===================================================================== *

	use `el1', clear


	merge 1:1 child_id using `iat', gen(iat_merge)

/*
Result                           # of obs.
    -----------------------------------------
    not matched                         8,312
        from master                     8,312  (iat_merge==1)
        from using                          0  (iat_merge==2)

    matched                             6,461  (iat_merge==3)
    -----------------------------------------
*/

	recode iat_merge (1=0) (3=1)
	lab var iat_merge "Student did IAT at endline"
	lab define iat_merge 0 "Did not do IAT" 1 "Did IAT"
	lab values iat_merge iat_merge



	label data "Merged endline student and IAT data"
	
	save "$endline", replace
	
* ===================================================================== *
* -----------------   	  Endline school data    ----------------- *
* ===================================================================== *

* SCERT - attendance and test scores
use "$endline_school_scert_raw", clear
do "$do/02e_el1_sch_scert_clean.do"
save "$endline_school_scert_final", replace

* merge endline SCERT and board exam datasts with baseline school datasets, 
* 		and clean to generate final endline school dataset
do "$do/02f_el1_sch_merge.do"

save "$endline_sch", replace

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

********************************************
***** 3.2 Endline 2 data cleaning
********************************************
use "$endline2_student_raw", clear

do "$do/03a_el2_s_clean_oth" // cleans other-specify values
do "$do/03b_el2_s_gen_vars" // generating variables

save "$endline2_student_final", replace


* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* * * * * * * * *  PART 4: FINAL INDEX GENERATION AND ANALYSIS * * * * * * * * * 
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

do "$do/04a_merge_indices.do" // combines all datasets and generates main variables and indices

do "$do/04b_tables.do" // generates main and appendix tables, slide tables

do "$do/04c_figures.do" // figures

