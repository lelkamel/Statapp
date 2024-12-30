********************************************************************************
*
*	 Project: Breakthrough (J-PAL South Asia)
*
*	 Purpose: Recoding variables to generate variables for the indices
********************************************************************************

	
/* OUTLINE
1. Importing the cleaned endline 2 student dataset
2. Recoding variables
3. Saving the resulting dataset
*/	

* ============================================================================ *
* -----------------     	  Setting directory		  ------------------------ *
* ============================================================================ *


* ======================================================================== *
* --- 1. Importing the cleaned endline 2 student dataset              ---- *
* ======================================================================== *
	

* ======================================================================== *
* ---        2. Variables for Summary Statistics             ---- *
* ======================================================================== *

** 1. District 

	forval x = 1/4 {
		local dist: label district `x'
		local var = lower("`dist'")
		gen `var' = district == `x'
		label var `var' "`dist'"
}
	order panipat sonipat rohtak jhajjar, after(district)

** 2. Age category
	
	gen age_cat = student_age_y
	replace age_cat = 15 if age_cat < 16 & !mi(age_cat)
	replace age_cat = 19 if age_cat > 18 & !mi(age_cat)
	label define age_cat 15 "< Age 16" 16 "Age 16" 17 "Age 17" 18 "Age 18" 19 "> Age 18"
	label values age_cat age_cat
	label var age_cat "Child's age (top and bottom coded)"
	
	order age_cat, after(student_age_y)
	
	
* ======================================================================== *
* ---          				 3. Primary Outcomes               ---- *
* ======================================================================== *


		** changing 5-point likert scale question to dummies
		#delimit ;
		local prim wives_less_edu boy_more_oppo
			  woman_role_home men_better_suited
			  similar_right elect_woman man_final_deci woman_viol control_daughters
			  boy_study_marry girl_study_marry shy_boy shy_girl  girl_laugh boy_laugh
			  cont_have_job;
		#delimit cr
		
		desc `prim'
		su `prim'
		
	foreach x in `prim' {
	
		local varlab: variable label `x'
		gen `x'_y = inlist(`x',1,2) if !mi(`x')
		replace `x'_y = `x' if mi(`x')
		label var `x'_y "Agree: `varlab'"
		label values `x'_y yesno
		order `x'_y, after(`x')
		
		gen `x'_n = inlist(`x',4,5) if !mi(`x')
		replace `x'_n = `x' if mi(`x')
		label var `x'_n "Disagree: `varlab'"
		label values `x'_n yesno
		order `x'_n, after(`x'_y)		

		}


		****************************************************************
		*           		  Attitudes Index  				    	   *
		****************************************************************
	
	**** VIGNETTES ****
	
	 ** 1.1 Education Vignette
 
	gen agree_deci_2_y = inlist(agree_deci_2,1,2) if !mi(agree_deci_2)
	
	label values agree_deci_2_y yesno
	order agree_deci_2_y, after(agree_deci_2)

	gen agree_deci_2_n = inlist(agree_deci_2,4,5) if !mi(agree_deci_2)
	
	label values agree_deci_2_n yesno
	order agree_deci_2_n, after(agree_deci_2_y)

	foreach x in town_studies better_student {
		
		foreach num in 1 2 3 {
		
			gen `x'_`num' = `x' == `num' if !mi(`x')
			local varlab`num': label (`x') `num'
			label var `x'_`num' "`varlab`num''"
			}
		order `x'_?, after(`x')	
		label values `x'_? yesno

	}
	
	label var town_studies_3 "Borrow money and send both"
	label var better_student_3 "Borrow money and send both"
	
	foreach x of varlist town_studies_1 town_studies_2 town_studies_3 {
		local varlab: variable label `x'
		local varlab = subinstr("`varlab'","\hspace{3 mm} ","",1)
		label var `x' "Who would you send to school: `varlab'"
		label values `x' yesno
	}

	foreach x of varlist better_student_1 better_student_2 better_student_3{
		local varlab: variable label `x'
		local varlab=subinstr("`varlab'","\hspace{3 mm} ","",1)	
		label var `x' "If Neelam was a better student, send: `varlab'"
		label values `x' yesno
	}
	
	gen town_studies_y = inlist(town_studies,2,3) if !mi(town_studies)
	replace town_studies_y = town_studies if mi(town_studies)
	label define eduvignette 1 "Neelam/Both children" 0 "Naveen"
	label values town_studies_y eduvignette
	order town_studies_y, after(town_studies_3)
	
	gen send_neelam = inlist(town_studies,2,3) if !mi(town_studies)

	replace send_neelam = 0 if town_studies == .d  // don't know is 0 as per Vrinda's do-file - clarify 
	
	gen send_neelam_better = inlist(better_student,2,3) if !mi(better_student)
	
	replace send_neelam_better = 0 if better_student == .d  // don't know is 0 as per Vrinda's do-file - clarify
	
	replace send_neelam_better = 1 if town_studies == 2

	order send_neelam, after(town_studies_y) 
	order send_neelam_better, after(better_student_3)
	label values send_neelam send_neelam_better yesno

	foreach x of varlist alone_not_safe marry_18 imp_boy_high_edu {
		local varlab: variable label `x'
		local varlab = trim(subinstr("`varlab'",word("`varlab'",1),"",1))
		gen `x'_y = inlist(`x',1,2) if !mi(`x')
		label var `x'_y "`varlab'"
		label values `x'_y yesno
		order `x'_y, after(`x')
		
		gen `x'_n = inlist(`x',4,5) if !mi(`x')
		label var `x'_n "Disagree: `varlab'"
		label values `x'_n yesno
		order `x'_n, after(`x'_y)	
		
	}

	label var agree_deci_2_y "Agrees with sending Naveen(boy) to school"
	label var agree_deci_2_n "Disagrees with sending only Naveen (boy) to school"
	label var send_neelam "Send Neelam or both children to school"
	label var send_neelam_better "Send Neelam or both to school if Neelam is a better student"
	label var imp_boy_high_edu "It is more important to send boys for higher education"
	label var alone_not_safe_y "Agrees staying alone in the town is not safe for Neelam"
	label var marry_18_y "Agrees Neelam needs to be married off as she is 18 years old"
	label var imp_boy_high_edu_y "Agrees it is more important to send boys for higher education"
	lab var town_studies_y "If you were the head of the family - who would you have sent for further studies?"
	
	 ** 1.2 Work Vignette
	
	foreach x in marriage_more_imp follow_parent_wish teacher_suitable {
	
	local varlab: variable label `x'
	
	gen `x'_y = inlist(`x',1,2) if !mi(`x')
	replace `x'_y = `x' if mi(`x')
	label var `x'_y "Agree: `varlab'"
	label values `x'_y yesno
	order `x'_y, after(`x')
		
	gen `x'_n = inlist(`x',4,5) if !mi(`x')
	replace `x'_n = `x' if mi(`x')
	label var `x'_n "Disagree: `varlab'"
	label values `x'_n yesno
	order `x'_n, after(`x'_y)		
	
	
}
	gen agree_deci_1_y = inlist(agree_deci_1,1,2) if !mi(agree_deci_1)
	
	label values agree_deci_1_y yesno
	order agree_deci_1_y, after(agree_deci_1)

	gen agree_deci_1_n = inlist(agree_deci_1,4,5) if !mi(agree_deci_1)
	
	label values agree_deci_1_n yesno
	order agree_deci_1_n, after(agree_deci_1_y)
	
	lab var agree_deci_1_y "Agrees with Pooja getting married off"
	lab var agree_deci_1_n "Disagrees with Pooja getting married off"

	********
	
	* higher education for better spouse
	gen study_marry= 1 if girl_study_marry_y==boy_study_marry_y & !mi(girl_study_marry_y) & !mi(boy_study_marry_y)
	replace study_marry= 0 if girl_study_marry_y!=boy_study_marry_y & !mi(girl_study_marry_y) & !mi(boy_study_marry_y)

	replace study_marry = .r if inlist(girl_study_marry_y, .r) |  inlist(boy_study_marry_y, .r)
	replace study_marry = .d if inlist(girl_study_marry_y, .d) |  inlist(boy_study_marry_y, .d)	 
	replace study_marry = .s if inlist(girl_study_marry_y, .s) |  inlist(boy_study_marry_y, .s)
	
	label var study_marry "Has gender equal views on getting higher education for better marriage prospects"
	order study_marry, after(girl_study_marry_n)
	
	
	* shy demeanor for suitable bride/groom AND girl/boy laughing
	
	foreach var in shy_girl_y shy_boy_y {
		local l: variable label `var'
		egen `var'_mean = mean(`var') if !mi(shy_boy_y) & !mi(shy_girl_y), by(school_id gender_updated)
			replace `var'_mean = .s if student_available==0 // student not available for survey
		la var `var'_mean "`l' (school-gender mean)"
		}
		
	foreach var in girl_laugh_y boy_laugh_y {
		local l: variable label `var'
		egen `var'_mean = mean(`var') if !mi(girl_laugh_y) & !mi(boy_laugh_y), by(school_id gender_updated)
			replace `var'_mean = .s if student_available==0 // student not available for survey
		la var `var'_mean "`l' (school-gender mean)"
		}
		
	gen shy = 1 if shy_girl_y_mean<=shy_boy_y_mean & (!mi(shy_girl_y_mean) & !mi(shy_boy_y_mean))
	replace shy = 0 if shy_girl_y_mean>shy_boy_y_mean & (!mi(shy_girl_y_mean) & !mi(shy_boy_y_mean))
		replace shy = .s if inlist(shy_girl_y_mean, .s) |  inlist(shy_boy_y_mean, .s)


	gen laugh = 1 if girl_laugh_y_mean<=boy_laugh_y_mean & (!mi(girl_laugh_y_mean) & !mi(boy_laugh_y_mean))
	replace laugh = 0 if girl_laugh_y_mean>boy_laugh_y_mean & (!mi(girl_laugh_y_mean) & !mi(boy_laugh_y_mean))
		replace laugh = .s if inlist(girl_laugh_y_mean, .s) |  inlist(boy_laugh_y_mean, .s)

	la var shy "Shy girl suitable <= Shy boy suitable"
	la var laugh "Laughing: girl cover mouth <= boy cover mouth"
	order shy_boy_y_mean shy_girl_y_mean shy, after(shy_girl_n)
	order boy_laugh_y_mean girl_laugh_y_mean laugh, after(boy_laugh_n)
	la val shy laugh yesno
	
	** What age would you like sibling/friend to get married
	
	gen girl_marriage_age_19=1 if girl_marriage_age_numb>19 & !mi(girl_marriage_age_numb)
	replace girl_marriage_age_19=0 if girl_marriage_age_numb<=19 & !mi(girl_marriage_age_numb)
	replace girl_marriage_age_19=girl_marriage_age if mi(girl_marriage_age)
	replace girl_marriage_age_19=.i if inlist(girl_marriage_age, 2, 3, 4, 5) // non-numeric options
	

	label var girl_marriage_age_19 "Sister/cousins/female friends should be married after age 19"
	label values girl_marriage_age_19 yesno
	
	gen marriage_age_diff=boy_marriage_age_numb-girl_marriage_age_numb if !mi(boy_marriage_age_numb) & !mi(girl_marriage_age_numb)
	summ marriage_age_diff if treat==0, detail
	local control_median= `r(p50)'
	gen marriage_age_diff_m=0 if marriage_age_diff>`control_median' & !mi(marriage_age_diff)
	replace marriage_age_diff_m=1 if marriage_age_diff<=`control_median' & !mi(marriage_age_diff)
	label var marriage_age_diff "Difference between boys and girls age to marry"
	label var marriage_age_diff_m "Difference between boys and girls age to marry is lesser than control median"
	la val marriage_age_diff_m yesno
	
	* carrying through type of missing

	replace marriage_age_diff_m = .d if inlist(boy_marriage_age, .d) | inlist(girl_marriage_age, .d)
	replace marriage_age_diff_m = .r if inlist(boy_marriage_age, .r) | inlist(girl_marriage_age, .r )
	replace marriage_age_diff_m = .i if inlist(girl_marriage_age,2, 3, 4, 5)  | inlist(boy_marriage_age, 2, 3, 4, 5) // non-numeric value for either
	replace marriage_age_diff_m = .s if (inlist(girl_marriage_age,.s)  | inlist(boy_marriage_age, .s)) & mi(marriage_age_diff_m)

	order girl_marriage_age_19 marriage_age_diff marriage_age_diff_m, after(boy_marriage_age_numb)
	
	** fertility attitudes	
	gen fertility = 0 if two_boys==1 & inlist(two_girls, 2, 3) // stop after having boys, but not after having girls
	replace fertility = 1 if !mi(two_boys) & !mi(two_girls) & fertility!=0
	replace fertility = .d if inlist(two_girls, .d) | inlist(two_boys, .d)
	replace fertility = .r if inlist(two_girls, .r) | inlist(two_boys, .r)
	replace fertility = .s if inlist(two_girls, .s) | inlist(two_boys, .s)

	lab var fertility "Student agrees to more children after two girls, but not after two boys"
	order fertility, after(two_girls)
	
	/* Attitudes index variables:
	
	Education: wives_less_edu_n boy_more_oppo_n town_studies_y
	Employment: woman_role_home_n men_better_suited_n marriage_more_imp_n teacher_suitable_n 
		allow_work
	Female gender roles: similar_right_y elect_woman_y man_final_deci_n woman_viol_n 
		control_daughters_n study_marry shy laugh girl_marriage_age_19 marriage_age_diff_m
	Fertility: fertility	
	
	*/
	
		****************************************************************
		*           		  Aspirations Index  				   	   *
		****************************************************************

	* marks expected in 12th exams
	gen twelfth_score_expected_order = twelfth_score_expected
	recode twelfth_score_expected_order (8=1)(7=2)(1=3)(2=4)(3=5)(4=6)(5=7)(6=8)
		label var twelfth_score_expected_order "Marks expected in 12th board exams, in order"
		
	local g 1
	local b 2
	
	foreach x in g b {
		summ twelfth_score_expected_order if treat==0 & gender_updated==``x'', detail
		local control_median= `r(p50)'
		gen twelfth_score_expected_m_`x'=1 if twelfth_score_expected_order>`control_median' & !mi(twelfth_score_expected_order)  & gender_updated==``x''
		replace twelfth_score_expected_m_`x'=0 if twelfth_score_expected_order<=`control_median' & !mi(twelfth_score_expected_order)  & gender_updated==``x''
		replace twelfth_score_expected_m_`x' = twelfth_score_expected_order if mi(twelfth_score_expected_order)
		la val twelfth_score_expected_m_`x' yesno
		
		label var twelfth_score_expected_m_`x' "Expected 12th marks > control-gender median"
		
		}
		
		
		gen twelfth_score_expected_m = twelfth_score_expected_m_g if gender_updated==1
		replace twelfth_score_expected_m = twelfth_score_expected_m_b if gender_updated==2
			replace twelfth_score_expected_m= .s if student_available==0
		la var  twelfth_score_expected_m "Expected 12th marks > control-gender median"
			la val twelfth_score_expected_m yesno
		order twelfth_score_expected_order twelfth_score_expected_m_g twelfth_score_expected_m_b twelfth_score_expected_m, after(twelfth_score_expected)
		
	* highest level of education // 
	gen highest_educ_order = highest_educ
	recode highest_educ_order (8=1)(1=2)(7=3)(2=4)(3=5)(4=6)(5=7)(6=8)
	label var highest_educ_order "Highest level of education you would like to complete, in order"
	

	foreach x in g b {
	
		summ highest_educ_order if treat==0 & gender_updated==``x'', detail
		local control_median= `r(p50)'
		gen highest_educ_m_`x'=1 if highest_educ_order>`control_median' & !mi(highest_educ_order) & gender_updated==``x''
		replace highest_educ_m_`x'=0 if highest_educ_order<=`control_median' & !mi(highest_educ_order) & gender_updated==``x''
		replace highest_educ_m_`x' = highest_educ_order if mi(highest_educ_order)
		la val highest_educ_m_`x' yesno
		
		label var highest_educ_m_`x' "Highest level of education you would like to complete > control-gender median"
		}
		gen highest_educ_m = highest_educ_m_g if gender_updated==1
		replace highest_educ_m = highest_educ_m_b if gender_updated==2
			replace highest_educ_m = .s if student_available==0
		la var  highest_educ_m "Highest level of education you would like to complete > control-gender median"
			la val highest_educ_m yesno
	
	order highest_educ_order highest_educ_m_g highest_educ_m_b highest_educ_m, after(highest_educ)


	* occupation when 25 // Q : what if expect to study? leave missing or change to 0. occupa - "Others" - separate from other professions
	gen occupa_25_y = 1 if inrange(occupa_25, 1, 10) | expect_25==2 // occupation mentioned, or wants to study at 25
	replace occupa_25_y = 0 if inlist(occupa_25, 11, .d) | expect_25==5 // no source of income or don't know mentioned, or want to neither study nor work
	replace occupa_25_y = occupa_25 if mi(occupa_25) & occupa_25!=.d & mi(occupa_25_y) // don't know is being used in answer above
	replace occupa_25_y = expect_25 if mi(expect_25) & occupa_25==.s  // occupation question got skipped
	la val occupa_25_y yesno
	la var occupa_25_y "Reported desired occupation at age 25"
	order occupa_25_y, after(occupa_25)
	
	* what course you want to pursue for higher studies // Q: if dk/rf , changed to 0; others needs cleaning. if no college - 0. 
	gen college_course_want_y = 1 if inrange(college_course_want, 1, 21) 
	replace college_course_want_y = 0 if inlist(college_course_want,.d) 
		replace college_course_want_y = college_course_want if mi(college_course_want) & college_course_want!=.d  // don't know being used for answer above
		replace college_course_want_y = plan_college if mi(plan_college) & college_course_want==.s // desired course skipped
	replace college_course_want_y = 1 if inrange(course_pursue, 1, 21) // currently in college
		replace college_course_want_y = .r if course_pursue==.r
	la val college_course_want_y yesno
	la var college_course_want_y "Mentioned a course she would like to pursue in higher studies"
	
	* Q: STEM course = 0 if course - dk/rf, no college
	gen college_course_want_stem = 1 if inlist(college_course_want, 1, 3, 7)
	replace college_course_want_stem = 0 if inlist(college_course_want,2, 4, 5, 6,8,9,10,.d) | inrange(college_course_want,11, 21) 
		replace college_course_want_stem = college_course_want if mi(college_course_want) & college_course_want!=.d  // don't know being used for answer above
		replace college_course_want_stem = plan_college if mi(plan_college) & college_course_want==.s // desired course skipped
	replace college_course_want_stem = 1 if inlist(course_pursue, 1, 3, 7) // based on current course selection for college students. 
	replace college_course_want_stem = 0 if inlist(course_pursue, 2, 4, 5, 6, 8, 9, 10, .d) | inrange(course_pursue,11, 21) // are BComm, chartered account, ITI, considered STEM or non-STEM
		replace college_course_want_stem = .r if course_pursue==.r
	la val college_course_want_stem yesno
	la var college_course_want_stem "Mentioned that she would like to pursue a STEM course in higher studies"
	
	order college_course_want_y college_course_want_stem, after(college_course_want)
	
	* continue education after marriage
	
	//change dropped out to 0
	replace cont_educ = 0 if mi(cont_educ) & student_current_status==2 // dropped out
	
	
	/* Aspiration index variables:	
	twelfth_score_expected_m  discuss_educ cont_educ highest_educ_m occupa_25_y plan_college
	college_course_want_y college_course_want_stem cont_have_job_y
	
		*/
		
		****************************************************************
		*           		  Behavior Index  				   	   	    *
		****************************************************************

	la var decision_past_twelfth "if studying past grade 12/vocational course"
	la var decision_work "if will work after studies"
	la var decision_kindofwork "type of work after studies"
	
	* who makes decisions
	local decision decision_past_twelfth decision_work decision_kindofwork 

	foreach x in `decision' {
		local varlab: variable label `x'
		gen `x'_y=inlist(`x',1) if !mi(`x')
			replace `x'_y = `x' if mi(`x')
		label var `x'_y "Child decides `varlab'"
		label values `x'_y yesno
		order `x'_y, after(`x')
		}
		
	** Attendance

	gen attendance = 0 if inrange(absent_days,1,7)
	replace attendance = 1 if inlist(absent_days,0)
	replace attendance = 1 if inlist(absent_sch,2)
		replace attendance = absent_days if mi(absent_days)
		replace attendance = absent_sch if mi(absent_sch) & absent_days==.s // no. of days skipped	
	label var attendance "Attended school every day last week"
	order attendance, after(absent_days)
	
	
	label values attendance yesno
	
	* attend community events without guardian
	gen alone_events = 1 if inlist(alone_atten_events,1)
	replace alone_events = 0 if inlist(atten_events,0) | inlist(alone_atten_events,0)
		replace alone_events = alone_atten_events if mi(alone_atten_events)
		replace alone_events = atten_events if mi(atten_events) & alone_atten_events==.s
	la val alone_events yesno
	label var alone_events "Attended community events alone or with friends, no guardian"
	order alone_events, after(alone_atten_events)

	* #### RECHECK WITH RACHITA #### *
	* go to school alone in past week 
	gen alone_school_y = 1 if alone_where_1==1
	replace alone_school_y = 1 if alone_school==1
	replace alone_school_y = 0 if alone_school==0	
		replace alone_school_y = alone_school if mi(alone_school)	
	la val alone_school_y yesno
	la var alone_school_y "In past week, went to school/college alone or with friends"
	order alone_school_y, after(alone_school)
	
	************
	
	* cook/clean/wash dishes
	gen cook_clean_b=inlist(cook_clean,1, 2, 3) if  gender_updated==2 & !mi(cook_clean)
		replace cook_clean_b = cook_clean if mi(cook_clean) & gender_updated==2
		replace cook_clean_b = .s if gender_updated==1
		replace cook_clean_b = .s if student_available==0
	lab var cook_clean_b "Boys cook/clean/wash clothes"
	
	gen cook_clean_g=inlist(cook_clean,4) if gender_updated==1 & !mi(cook_clean)
		replace cook_clean_g = cook_clean if mi(cook_clean) & gender_updated==1
		replace cook_clean_g = .s if gender_updated==2	
		replace cook_clean_g = .s if student_available==0
	lab var cook_clean_g "Girls do not cook/clean/wash clothes"
	
	gen cook_clean_comm = cook_clean_g if gender_updated==1
	replace cook_clean_comm = cook_clean_b if gender_updated==2
		replace cook_clean_comm = .s if student_available==0
	la var cook_clean_comm "In the past one week, boy/girl did/did not cook/clean/wash dishes" 
	
	la val cook_clean_g cook_clean_b cook_clean_comm yesno
	order cook_clean_g cook_clean_b cook_clean_comm, after(cook_clean)
	
	* absent due to hhld work
	gen absent_sch_hhwork_g=inlist(absent_sch_reason_hhwork,0) if !mi(absent_sch_reason_hhwork) & gender_updated==1
		replace absent_sch_hhwork_g=absent_sch_reason_hhwork if mi(absent_sch_reason_hhwork) & gender_updated==1
		replace absent_sch_hhwork_g=.s if gender_updated==2
		replace absent_sch_hhwork_g= .s if student_available==0
	lab var absent_sch_hhwork_g "Girl has not missed school due to household responsibilities in the last one month"

	gen absent_sch_hhwork_b=inlist(absent_sch_reason_hhwork,1) if !mi(absent_sch_reason_hhwork) & gender_updated==2
			replace absent_sch_hhwork_b=absent_sch_reason_hhwork if mi(absent_sch_reason_hhwork) & gender_updated==2
			replace absent_sch_hhwork_b= .s if gender_updated==1
			replace absent_sch_hhwork_b= .s if student_available==0
	lab var absent_sch_hhwork_b "Boy has missed school due to household responsibilities in the last one month"
	
	gen absent_sch_hhwork_comm = absent_sch_hhwork_g if gender_updated==1
	replace absent_sch_hhwork_comm = absent_sch_hhwork_b if gender_updated==2
		replace absent_sch_hhwork_comm= .s if student_available==0
	la var absent_sch_hhwork_comm "In the past month, boy/girl did/did not miss school due to household based responsibilities" 
	
	la val absent_sch_hhwork_g absent_sch_hhwork_b absent_sch_hhwork_comm yesno
	order absent_sch_hhwork_g absent_sch_hhwork_b absent_sch_hhwork_comm, after(absent_sch_reason_hhwork)
	
	
	************
	
	** pooled behavior index **
	
	* talking to children of opposite gender
	egen talk_opp_gender= rowtotal(comf_opp_gender_girl comf_opp_gender_boy)
		replace talk_opp_gender = .d if comf_opp_gender_girl==.d | comf_opp_gender_boy==.d
		replace talk_opp_gender = .r if comf_opp_gender_girl==.r | comf_opp_gender_boy==.r
		replace talk_opp_gender = .s if student_available==0		
	
	lab var talk_opp_gender "Comfortable talking to students of the opposite gender who are not related to you"
	note talk_opp_gender: "Are you comfortable talking to students of the opposite gender who are not related to you inside and outside the school"
	
	label define talk_opp_gender 1 "Very comfortable" 2 "Moderately comfortable" 3 "Moderately uncomfortable" 4 "Very uncomfortable"
	label values talk_opp_gender talk_opp_gender
	
	gen talk_opp_gender_comf=inlist(talk_opp_gender,1,2) if !mi(talk_opp_gender)
		replace talk_opp_gender_comf = talk_opp_gender if mi(talk_opp_gender)
	label var talk_opp_gender_comf "Child is comfortable talking to students of the opposite sex"
	label values talk_opp_gender_comf yesno
	
		*Girls
		gen talk_opp_gender_g=talk_opp_gender_comf if gender_updated==1
			replace talk_opp_gender_g = .s if gender_updated==2
			lab var talk_opp_gender_g "Student is comfortable talking to students of the opposite sex"

		*Boys
		gen talk_opp_gender_b=talk_opp_gender_comf if gender_updated==2
			replace talk_opp_gender_b = .s if gender_updated==1
			lab var talk_opp_gender_b "Student is comfortable talking to students of the opposite sex"

		*Common
		gen talk_opp_gender_comm=talk_opp_gender_comf
		label var talk_opp_gender_comm "Child is comfortable talking to students of the opposite sex"
			drop talk_opp_gender_comf
			
		la val  talk_opp_gender_g talk_opp_gender_b talk_opp_gender_comm yesno
		order talk_opp_gender talk_opp_gender_g talk_opp_gender_b talk_opp_gender_comm, after(comf_opp_gender_boy)
	
	* Child sits next to students of the opposite gender in class
	
	* generating gender-treatment status-district mean
	foreach type in girl boy {
		egen sit_opp_gender_`type'_mean = mean(sit_opp_gender_`type'), by(gender_updated treat district)
		la var sit_opp_gender_`type'_mean "Sit next to `type's in classroom (gender-treatment-district mean)" 
		}
		
	gen sit_opp_gender_g = sit_opp_gender_boy_mean if gender_updated==1
 	replace sit_opp_gender_g =  sit_opp_gender_boy if gender_updated==1 & (school_coed==1 | college_coed==1)
		replace sit_opp_gender_g = .s if gender_updated==2
		replace sit_opp_gender_g = .s if sit_opp_gender_g==. // valid skips for  not in same school and not enrolled in school  
	la var 	sit_opp_gender_g " Sits next to boys in classroom"
	
	gen sit_opp_gender_b = sit_opp_gender_girl_mean if gender_updated==2
 	replace sit_opp_gender_b =  sit_opp_gender_girl if gender_updated==2 & (school_coed==1 | college_coed==1)
		replace sit_opp_gender_b = .s if gender_updated==1
		replace sit_opp_gender_b = .s if sit_opp_gender_b==. // valid skips for  not in same school and not enrolled in school 
	la var 	sit_opp_gender_b " Sits next to girls in classroom"

	gen sit_opp_gender_comm = sit_opp_gender_g if gender_updated==1
	replace sit_opp_gender_comm = sit_opp_gender_b if gender_updated==2
		replace sit_opp_gender_comm = .s if student_available==0
	la var sit_opp_gender_comm "Sits next to student of opposite gender in classroom"
	
	order sit_opp_gender_girl_mean sit_opp_gender_boy_mean sit_opp_gender_g sit_opp_gender_b sit_opp_gender_comm, after(sit_opp_gender_boy)
	
		* has opposite gender friends

	gen friend_opp_gender_g = 1 if boy_friends>0 & !mi(boy_friends) & gender_updated==1
	replace friend_opp_gender_g = 0 if boy_friends==0 & gender_updated==1
		replace friend_opp_gender_g = boy_friends if mi(boy_friends) & gender_updated==1
		replace friend_opp_gender_g = .s if gender_updated==2
		replace friend_opp_gender_g = .s if student_available==0
	la var friend_opp_gender_g "At least one friend that is a boy"
	
	gen friend_opp_gender_b = 1 if girl_friends>0 & !mi(girl_friends) & gender_updated==2
	replace friend_opp_gender_b = 0 if girl_friends==0 & gender_updated==2
		replace friend_opp_gender_b = girl_friends if mi(girl_friends) & gender_updated==2
		replace friend_opp_gender_b = .s if gender_updated==1
		replace friend_opp_gender_b = .s if student_available==0
	la var friend_opp_gender_b "At least one friend that is a girl"
		
	gen friend_opp_gender_comm = friend_opp_gender_g if gender_updated==1
	replace friend_opp_gender_comm = friend_opp_gender_b if gender_updated==2
		replace friend_opp_gender_comm = .s if student_available==0
	la var friend_opp_gender_comm "At least one friend of the opposite gender"
	
	la val friend_opp_gender_g friend_opp_gender_b friend_opp_gender_comm yesno
	order friend_opp_gender_g friend_opp_gender_b friend_opp_gender_comm, after(boy_friends)
	
	* plays with opposite gender
	
	gen play_opp_gender_g = play_opp_gender_boy 
	la var 	play_opp_gender_g "Plays with boys"
	
	gen play_opp_gender_b = play_opp_gender_girl 
	la var 	play_opp_gender_b "Plays with girls"
	
	gen play_opp_gender_comm = play_opp_gender_g if gender_updated==1
	replace play_opp_gender_comm = play_opp_gender_b if gender_updated==2	
		replace play_opp_gender_comm = .s if student_available==0
	la var play_opp_gender_comm "Plays with the opposite gender"
	
	la val play_opp_gender_g play_opp_gender_b play_opp_gender_comm yesno
	order play_opp_gender_g play_opp_gender_b play_opp_gender_comm, after(play_opp_gender_boy)
	
	* talk with opposite gender in past one week
	
	gen talk_week_opp_gender_g = talk_opp_gender_boys 
	la var 	talk_week_opp_gender_g "Talked with a boy in past week"
	
	gen talk_week_opp_gender_b = talk_opp_gender_girls 
	la var talk_week_opp_gender_b "Talked with a girl in past week"
	
	gen talk_week_opp_gender_comm = talk_week_opp_gender_g if gender_updated==1
	replace talk_week_opp_gender_comm = talk_week_opp_gender_b if gender_updated==2
		replace talk_week_opp_gender_comm = .s if student_available==0
	la var talk_week_opp_gender_comm "Talked with a child of opposite gender in past week"
	
	la val talk_week_opp_gender_g talk_week_opp_gender_b talk_week_opp_gender_comm yesno
	order talk_week_opp_gender_g talk_week_opp_gender_b talk_week_opp_gender_comm, after(talk_opp_gender_boys)
	
	* supportive of girls' ambitions
	
	local g 1
	local b 2
	
	local varlist discourage_college discourage_work
	foreach x in `varlist' {
	
		foreach gen in g b {
		
		gen `x'_`gen'= 1 if inlist(`x',3) & !mi(`x') & gender_updated==``gen''  
		replace `x'_`gen'= 0 if inlist(`x',1) & !mi(`x') & gender_updated==``gen''  
		replace `x'_`gen'= .s if inlist(`x',2) & !mi(`x') & gender_updated==``gen''  // no sister
			replace `x'_`gen' = `x' if mi(`x')
			
			if "`gen'"=="g" {
				replace `x'_`gen' = .s if gender_updated==2
				}
			else if "`gen'"=="b" {
				replace `x'_`gen' = .s if gender_updated==1
				}
				
		local varlab: variable label `x'
		label var `x'_`gen' "Disagree: `varlab'"

			}
			
		gen `x'_comm = `x'_g if gender_updated==1
		replace `x'_comm = `x'_b if gender_updated==2
			replace `x'_comm=.s if student_available==0
		la var `x'_comm "Disagree: `varlab'"
		
		la val `x'_g `x'_b `x'_comm yesno
		order `x'_g `x'_b `x'_comm, after(`x')
		
		}
		
	/* Behavior index variables:
	
	girl's decision making: future_work decision_past_twelfth_y decision_work_y decision_kindofwork_y attendance
	girl's mobility: alone_friend  alone_market alone_events alone_past_week alone_school_y
	
	interaction with opposite sex: talk_opp_gender_comm sit_opp_gender_comm friend_opp_gender_comm play_opp_gender_comm talk_week_opp_gender_comm
	participation in HH chores: cook_clean_comm absent_sch_hhwork_comm
	supporting female relativ ambitions: discourage_college_comm discourage_work_comm
	
	girl's index: DEC and MOB and talk_opp_gender_g sit_opp_gender_g friend_opp_gender_g play_opp_gender_g talk_week_opp_gender_g cook_clean_g absent_sch_hhwork_g discourage_college_g discourage_work_g
	boy's index: talk_opp_gender_b sit_opp_gender_b friend_opp_gender_b play_opp_gender_b talk_week_opp_gender_b cook_clean_b absent_sch_hhwork_b discourage_college_b discourage_work_b
	*/
	
	
		****************************************************************
		*           		    Scholarship 			  	   	  	   *
		****************************************************************
		replace scholar_apply = 1 if inlist(deo_form_type, 1, 2) // based on actual form recipt
		replace scholar_apply = 0 if scholar_apply==0
		* variable scholar_apply
		
		* strict scholarship - submitted form B (parent part included), conditional on receiving form B
		replace form_type = deo_form_type if !mi(deo_form_type) // 2 cases where there is a mismatch
		gen scholar_apply_strict = scholar_apply==1 if form_type==2 
			la var scholar_apply_strict "Student submitted scholarship form with parental section"
			
		****************************************************************
		*           		   Petition			  	   	  	   *
		****************************************************************

		* variables petition_support
		
* ======================================================================== *
* ---          				 4. Secondary Outcomes               ---- *
* ======================================================================== *


		** changing 5-point likert scale question to dummies
		#delimit ;
		local esteem satisfy good_qly able_do_most
		;
		#delimit cr
		
	foreach x in `esteem'   {
	
		local varlab: variable label `x'
		gen `x'_y = inlist(`x',1,2) if !mi(`x')
			replace `x'_y = `x' if mi(`x') // skipped if phone survey
		label var `x'_y "Agree: `varlab'"
		label values `x'_y yesno
		order `x'_y, after(`x')
		
		gen `x'_n = inlist(`x',4,5) if !mi(`x')
			replace `x'_n = `x' if mi(`x') // skipped if phone survey
		label var `x'_n "Disagree: `varlab'"
		label values `x'_n yesno
		order `x'_n, after(`x'_y)		

		}

		****************************************************************
		*           		 	 Self Esteem		  			   	   *
		****************************************************************
		
		* self esteem indicators: satisfy_y good_qly_y able_do_most_y

		****************************************************************
		*           		 	Social Norms		  			   	   *
		****************************************************************
	
	local social allow_work community_allow_work allow_college community_allow_college
	
	gen community_work_s=inlist(allow_work,1) & inlist(community_allow_work,0) & inlist(oppose_allow_work,0) ///
			if !mi(allow_work) & !mi(community_allow_work) & !mi(oppose_allow_work)
	replace community_work_s=1 if allow_work==1 & community_allow_work==1
	replace community_work_s=0 if allow_work==0 & community_allow_work==0
	 
	
	gen community_college_s=inlist(allow_college,1) & inlist(community_allow_college,0) & inlist(oppose_allow_college,0) ///
			if !mi(allow_college) & !mi(community_allow_college) & !mi(oppose_allow_college)
	replace community_college_s=1 if allow_college==1 & community_allow_college==1
	replace community_college_s=0 if allow_college==0 & community_allow_college==0
	

	lab var community_work_s "Student agrees women should be allowed to work and thinks community will not oppose them"
	lab var community_college_s "Student agrees women should be allowed to study in college and thinks community will not oppose them"
	
	* social norms questions: allow_work community_allow_work community_work allow_college community_allow_college_s community_college_s
	
		****************************************************************
		*          	Girls' Educational Attainment		  		   	   *
		****************************************************************
		
	*Q. Which school are you enrolled in: only 1 if currently enrolled in school/college. 
	* what if completed school and not enrolled in college? what is "open school" note in footnote?
	
	gen school_enrol_y = 1 if school_same==1 // still stuyding in same school
	replace school_enrol_y = 1 if student_enrolled==1 // if not in same school, still enrolled in some school
	replace school_enrol_y = 1 if inlist(student_current_status, 1, 4, 3) // open school, completed school
	replace school_enrol_y = 0 if inlist(student_current_status, 2, 5) // if dropped out (even if pursuing diploma)
	
		replace school_enrol_y = student_current_status if inlist(student_current_status, .d, .r, .s) & mi(school_enrol_y)

	la var school_enrol_y "Currently enrolled in school or college"
	
***

* STEM enrollment
	gen stem_stream_y = 1 if inlist(student_stream, 1, 2, 4)  // science or with math
	replace stem_stream_y = 0 if inlist(student_stream, 3, 5) // without math

	replace stem_stream_y = 1 if inlist(course_pursue, 1, 3, 7) // STEM college streams if currenrtly in college
	replace stem_stream_y = 0 if inlist(course_pursue, 2, 4, 5, 6, 8, 9, 10) // STEM college streams if currenrtly in college
	
	replace  stem_stream_y = 0 if mi(stem_stream_y)  // missing due to repeating a class or dropped out
	
	* change to missing
	replace stem_stream_y = school_enrol_y if mi(school_enrol_y) // skipped for attrition sample
	replace stem_stream_y = .d if (school_enrol_y==.d | student_class==.d | student_stream==.d | course_pursue==.d) & inlist(stem_stream_y, .s)
	replace stem_stream_y = .r if (school_enrol_y==.r | student_class==.r | student_stream==.r | course_pursue==.r) & inlist(stem_stream_y, .r, .s)

	* QUESTION: check others	
	la var stem_stream_y "Enrolled in STEM stream"
	
	egen enrol_eng_comp_voc_y = rowmax(enrolled_computer enrolled_english enrolled_vocational)
	la var enrol_eng_comp_voc_y "In the past one year, enrolled in an English speaking, computer training, or vocational class"
		replace enrol_eng_comp_voc_y = .r if mi(enrol_eng_comp_voc_y) // missing only if refused to asnwers all 3 Qs
		
	gen take_tuition_y = inlist(take_tuition, 1) if !mi(take_tuition) // only if currenlty taking tuitions?
		replace take_tuition_y = take_tuition if mi(take_tuition)
	la var take_tuition_y "Takes after-school/college tuitions" 
	
	la val school_enrol_y stem_stream_y enrol_eng_comp_voc_y take_tuition_y yesno 
	
	* girl's educational achievement index: school_enrol_y stem_stream_y enrol_eng_comp_voc_y take_tuition_y 

		****************************************************************
		*          Marriage and Fertility Aspirations	  		   	   *
		****************************************************************
	
		local g 1
	    local b 2
		
		* At what age do you want to marry
		gen tot_marry_age = marry_age_expected_numb if marry_age_expected==1 // child entered an age in survey
		replace tot_marry_age = 17.5 if marry_age_expected==3 // 17-18 yrs old after completing school
		replace tot_marry_age = 21.5 if marry_age_expected==4 // 21-22 yrs old after completing college
			replace tot_marry_age = marry_age_expected if mi(marry_age_expected)
			replace tot_marry_age = .i if inlist(marry_age_expected,2,5,6)
		replace tot_marry_age = marry_age if marry_age_expected==.s // if currently married, actual age of marriage
			replace tot_marry_age = marry_age if inlist(marry_age, .d, .r)
			
		la var tot_marry_age "Expected or actual age of marriage"
		
		foreach x in g b {
			summ tot_marry_age if treat==0 & gender_updated==``x'', detail // using control-gender median
			local control_median= `r(p50)'
			gen tot_marry_age_m_`x'=1 if tot_marry_age>`control_median' & !mi(tot_marry_age)  & gender_updated==``x''
			replace tot_marry_age_m_`x'=0 if tot_marry_age<=`control_median' & !mi(tot_marry_age)  & gender_updated==``x''
				replace tot_marry_age_m_`x'=  tot_marry_age if mi(tot_marry_age)
			la val tot_marry_age_m_`x' yesno
			
			label var  tot_marry_age_m_`x'  "Expected or actual age of marriage > control-gender median"
			
			}
		replace tot_marry_age_m_g = .s if gender_updated==2 // if boy
		replace tot_marry_age_m_b = .s if gender_updated==1 // if girl
		
		gen tot_marry_age_m = tot_marry_age_m_g if gender_updated==1
		replace tot_marry_age_m = tot_marry_age_m_b if gender_updated==2
			replace tot_marry_age_m = .s if student_available==0
		label var  tot_marry_age_m "Expected or actual age of marriage > control-gender median"
			la val tot_marry_age_m yesno
		order tot_marry_age tot_marry_age_m_g tot_marry_age_m_b tot_marry_age_m, after(marry_age_expected_numb)
		

		* At what age do you want to have your first child?
	
	foreach x in g b {
		summ age_first_child_numb if treat==0 & gender_updated==``x'', detail
		local control_median= `r(p50)'
		gen first_child_age_m_`x'=1 if age_first_child_numb>`control_median' & !mi(age_first_child_numb)  & gender_updated==``x''
		replace first_child_age_m_`x'=0 if age_first_child_numb<=`control_median' & !mi(age_first_child_numb)  & gender_updated==``x''
			replace first_child_age_m_`x' = age_first_child_numb if mi(age_first_child_numb)
			replace first_child_age_m_`x' = age_first_child if mi(age_first_child) 
		la val first_child_age_m_`x' yesno
		
		label var  first_child_age_m_`x'  "Age at which want first child > control-gender median"
		
		}
		
		replace first_child_age_m_g = .s if gender_updated==2
		replace first_child_age_m_b = .s if gender_updated==1
			
		gen first_child_age_m = first_child_age_m_g if gender_updated==1
		replace first_child_age_m = first_child_age_m_b if gender_updated==2
			replace first_child_age_m = .s if student_available==2
		label var  first_child_age_m "Age at which want first child > control-gender median"
			la val first_child_age_m yesno 
		order first_child_age_m_g first_child_age_m_b first_child_age_m, after(age_first_child_numb)

	
		* desired number of boys vs number of girls
		gen girl_boy_pref =  num_boys<=num_girls if !mi(num_boys) & !mi(num_girls)
			replace girl_boy_pref = .s if mi(child_want)
		la var girl_boy_pref "Number of girls desired >= number of boys desired"
		la val girl_boy_pref yesno
		order girl_boy_pref, after(total_children)
		
		
		/* Suppose your spouse and you are going to have N children, 
		how many of them would you want to be boys? */		
		gen boy_count_frac = boy_count/random3
			replace boy_count_frac = want_boys if mi(want_boys)
		la var boy_count_frac "Desired no. of boys as fraction of children"
		
		summ boy_count_frac if treat==0, d
		local control_median= `r(p50)'
		gen boy_count_m = 1 if boy_count_frac<`control_median' & !mi(boy_count_frac) 
		replace boy_count_m = 0 if boy_count_frac>=`control_median' & !mi(boy_count_frac) 
			replace boy_count_m = boy_count_frac if mi(boy_count_frac)
			replace boy_count_m = .s if survey_type==2 // question not asked for phone surveys
			
		la var boy_count_m "Fraction of boys < control median"
		la val boy_count_m yesno
		order boy_count_frac boy_count_m, after(boy_count) 
		
		/* If instead of X boys and N-X girls, you could either have X-1 boys and N-X+1 girls OR X+1
			boys and N-X-1 girls, which would you prefer? */					
		gen prefer_children_y = prefer_children
		recode prefer_children_y (2=0)
		la var prefer_children_y "Prefer additional girl to boy"
		la val prefer_children_y yesno	
		order prefer_children_y, after(prefer_children)
		

		/* marriage and fertility index variables: 
		tot_marry_age_m first_child_age_m girl_boy_pref boy_count_m prefer_children_y
		*/
		
		****************************************************************
		*     		     Sexual harassment/assault				   	   *
		****************************************************************
		
		
		***** Boys’ engagement in sexual harassment/assault (list randomization)
		su main_lr_true_with
			local mean_with = `r(mean)'
		su main_lr_true_wo
			local mean_wo = `r(mean)'
		gen lr_harass_b = (`mean_with' - `mean_wo') if !mi(main_lr_true_with) | !mi(main_lr_true_wo)
			replace lr_harass_b = .r if main_lr_true_with==.r | main_lr_true_wo==.r
			replace lr_harass_b = .i if main_lr_true_with==.i | main_lr_true_wo==.i
			replace lr_harass_b = .s if gender_updated==1 | survey_type==2 // girl or phone survey
		la var lr_harass_b "List Randomization: Mean sensitive set - mean non sensitive set" 
		order lr_harass_b, after(main_lr_true_wo)

		* by treatment status
		local treat 1
		local ctrl 0
		
		foreach type in treat ctrl {
	
		su main_lr_true_with if treat==``type''
			local mean_with = `r(mean)'
		su main_lr_true_wo if treat==``type''
			local mean_wo = `r(mean)'
		gen lr_harass_b_`type' = (`mean_with' - `mean_wo') if ( !mi(main_lr_true_with) | !mi(main_lr_true_wo)) & treat==``type''
			replace lr_harass_b_`type' = .r if (main_lr_true_with==.r | main_lr_true_wo==.r)  & treat==``type''
			replace lr_harass_b_`type' = .i if (main_lr_true_with==.i | main_lr_true_wo==.i)  & treat==``type''
			replace lr_harass_b_`type' = .s if gender_updated==1 | survey_type==2 
		la var lr_harass_b_`type' "List Randomization: Mean sensitive set - mean non sensitive set (`type')" 
		}
		
		** groups by school 
		gen lr_harass_b_sch = .
		levelsof school_id

		foreach s in `r(levels)' {
			su main_lr_true_with if school_id==`s'
				if `r(N)'>0 local mean_with = `r(mean)'
				else if `r(N)'==0 local mean_with = .
			su main_lr_true_wo if school_id==`s'
				if `r(N)'>0 local mean_wo = `r(mean)'
				else if `r(N)'==0 local mean_wo = .
			replace lr_harass_b_sch = (`mean_with' - `mean_wo') if ( !mi(main_lr_true_with) | !mi(main_lr_true_wo)) & school_id==`s'
			}
			
		la var lr_harass_b_sch "Boys sexual harassment (school-level)" 	
		
		order lr_harass_b_treat lr_harass_b_ctrl lr_harass_b_sch, after(lr_harass_b)
		// note: higher value means more negative outcomes. 
		

		***** Girls’ experience of sexual harassment/assault
		
		/* In the past one year, have you ever been slapped, hit, 
		or otherwise physically hurt by a boy in a way you did not want? */
		gen harass_slapped_y_g=been_slapped_opp_gender_boy
		la var harass_slapped_y_g "In past year, was physically hurt by boy"
		la val harass_slapped_y_g yesno
		order harass_slapped_y_g, after(been_slapped_opp_gender_boy)
		
		* how frequently... (teased/groped in/outside school)
		la var teased_opp_gender_boy_school "How frequently teased by boys in school/college" 
		la var teased_opp_gender_boy_village "How frequently teased by boys in village/town" 
		la var touched_opp_gender_boy_school "How frequently groped by boys in school/college"  
		la var touched_opp_gender_boy_village "How frequently groped by boys in village/town"  

		foreach var of varlist teased_opp_gender_boy_school teased_opp_gender_boy_village touched_opp_gender_boy_school touched_opp_gender_boy_village {
			
			gen `var'_y = 0 if inlist(`var', 4) // never
			replace `var'_y = 1 if inlist(`var', 1, 2, 3) // always, sometimes, often
				replace `var'_y = `var' if mi(`var')
				
			local label: variable label `var'
			local newl = subinstr("`label'", "How frequently", "Often", .)
			la var `var'_y "`newl'"
			
			la val `var'_y yesno
			order `var'_y, after(`var')
			}
		
		/* Sexual harassment variables:
		Boys: lr_harass_b lr_harass_b_treat lr_harass_b_ctrl lr_harass_b_sch
		Girls: harass_slapped_y_g teased_opp_gen_boy_scl_y teased_opp_gen_boy_vil_y touched_opp_gen_boy_scl_y touched_opp_gen_boy_vil_y
		
		*/
		
		
* ======================================================================== *
* ---            5. Shortening Variable Names                    ---- *
* ======================================================================== *

* too long when suffix E2_S is added

rename (school_dropout_familymember_*)	(school_droput_fam_*)
rename (twelfth_score_expected*) (twel_score_exp*) //change this. 
rename (decision_past_twelfth*) (dec_past_twel*) 

foreach var of varlist sup_educ* sup_job_* college_course* *opp_gender* discourage* {
	local new = subinstr("`var'", "mother", "mt", .)
	local new = subinstr("`new'", "father", "ft", .)
	local new = subinstr("`new'", "before", "bef", .)
	local new = subinstr("`new'", "after", "aft", .)
	local new = subinstr("`new'", "college", "col", .)
	local new = subinstr("`new'", "opp_gender", "opp_gen", .)
	local new = subinstr("`new'", "discourage", "disc", .)
	rename `var' `new'
	}
	
	rename (*_opp_gen_boy_village*) (*_opp_gen_boy_vil*)
	rename (*_opp_gen_boy_school*) (*_opp_gen_boy_scl*)
	rename (touched_*) (tch_*)
	rename (teased_*) (teas_*)
	
* ======================================================================== *
* ---            6. Adding EL2 Prefix                     ---- *
* ======================================================================== *
	
	rename * E2_S*
	rename E2_Schild_id child_id
	rename E2_Sschool_id Sschool_id
	sort Sschool_id child_id
	
	
********************************* END OF FILE **********************************
