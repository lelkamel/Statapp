*********************************************************************************
*	 Project: Breakthrough (BT)
*
*	 Purpose: to merge and clean endline school datasets
*********************************************************************************


********************************************************************
*					Merge endline school datasets
********************************************************************
	
	// baseline school data
	use "$baseline_sch", clear
	
	rename School_ID school_id
	drop if school_id==2704
	sort school_id
	
	tempfile bl_sch
	save `bl_sch', replace
	

	* * * * 
	
	// scert - attendance and test scores at school level
	use "$endline_school_scert_final"

	keep school_id att_average eng_average mat_average sc_average ss_average hindi_average overall_average
	rename * scert_*
	rename scert_school_id school_id

	sort school_id
	tempfile scert
	save `scert', replace

	
	use `bl_sch', clear
	merge 1:1 school_id using `scert'


*    Result                           # of obs.
*    -----------------------------------------
*    not matched                            76
*        from master                        76  (_merge==1)
*        from using                          0  (_merge==2)
*
*    matched                               237  (_merge==3)
*    -----------------------------------------


	rename _merge scert_merge
	lab var scert_merge
	recode scert_merge (3=1) (1=0)

	label define scert 1 "Yes" 0 "No"
	label values scert_merge scert

	sort school_id
	tempfile school_sample
	save `school_sample', replace
	
	* * * * 
	
	use "$endline_school_board_cleaned"

	keep School_ID Recode_merge appear qual nqual comp absent per hin eng mat sct sos pun san dra agr phe hos
	rename * board_*
	rename board_School_ID school_id
	rename board_Recode_merge board_merge

	drop if board_merge==0
	drop board_merge

	sort school_id
	tempfile board
	save `board', replace

	clear
	use `school_sample'
	merge 1:1 school_id using `board'


*Result                           # of obs.
*    -----------------------------------------
*    not matched                             8
*        from master                         7  (_merge==1)
*        from using                          1  (_merge==2) //School ID 2711 (not surveyed in baseline)
*
*    matched                               306  (_merge==3)
*    -----------------------------------------


	rename _merge board_merge
	lab var board_merge
	recode board_merge (3=1) (1=0) (2=1)

	label define board 1 "Yes" 0 "No"
	label values board_merge board

	sort school_id
	tempfile school_sample
	save `school_sample', replace

********************************************************************
*					Cleaning merged school data
********************************************************************

	replace Coed=0 if school_id==2711
	replace Girls=1 if school_id==2711
	replace Boys=0 if school_id==2711

	replace q7_distr_name="SONIPAT" if school_id==2711
	replace treat=1 if school_id==2711
	replace scert_merge=0 if school_id==2711

	gen rural=1 if urban==0
	replace rural=0 if urban==1
	replace rural=1 if school_id==2711

	encode q7_distr_name, gen(district)
	codebook district
	recode district (1=4) (2=1) (4=2)

	label define district1 1 "Panipat" 2 "Sonipat" 3 "Rohtak" 4 "Jhajjar"
	label values district district1

	tabulate district, gen(district_)			

	replace q11_male_teachr=0 if mi(q11_male_teachr) & Girls==1 // a lot of single sex schools do not have teachers of the opposite sex
	replace q11_female_teachr=0 if mi(q11_female_teachr) & Boys==1

	foreach x in q15_6th_male q15_7th_male q15_8th_male q15_9th_male q15_10th_male {
		replace `x'=0 if mi(`x') & Girls==1
	}

	foreach x in q15_6th_female q15_7th_female q15_8th_female q15_9th_female q15_10th_female {
		replace `x'=0 if mi(`x') & Boys==1
	}


	local missing fulltime_teacher q11_male_teachr q11_female_teachr q15_6th_tot q15_7th_tot q15_8th_tot q15_9th_tot q15_10th_tot ///
				  q15_6th_male q15_7th_male q15_8th_male q15_9th_male q15_10th_male ///
				  q15_6th_female q15_7th_female q15_8th_female q15_9th_female q15_10th_female ///


	foreach y in `missing' {
			cap confirm variable `y'_flag
			if !_rc{
				replace `y'=. if `y'_flag
				drop `y'_flag
			}
			qui count if mi(`y')
			if r(N)!=0{
				gen `y'_flag=mi(`y')
				bys district treat: egen x = mean (`y') // imputed on district-treatment status
				qui replace `y'=x if `y'_flag==1
				drop x				
			}	
		}		
		
	drop id record_id q6_blck_name q7_distr_name
	sort school_id

	lab var treat "Treated"
