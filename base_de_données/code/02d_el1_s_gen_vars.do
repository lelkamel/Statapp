*********************************************************************************
*	 Project: Breakthrough (BT)
*
*	 Purpose: Recoding variables to generate variables for the indices
*********************************************************************************

	
	** District

	forval x=1/4{
		local dist: label district `x'
		local var=lower("`dist'")
		gen `var'=district==`x'
		label var `var' "`dist'"
	}
	order panipat sonipat rohtak jhajjar, after(district)

	** Age
	
	gen age_cat=age
	replace age_cat=13 if age_cat<14 & !mi(age_cat)
	replace age_cat=17 if age_cat>16 & !mi(age_cat)
	label define age_cat 13 "< Age 14" 14 "Age 14" 15 "Age 15" 16 "Age 16" 17 "> Age 16"
	label values age_cat age_cat
	label var age_cat "Child's age (top and bottom coded)"
	
	order age_cat, after(age)

	
	** Number of siblings
	
	gen sibsize=0
	foreach x of numlist 1/11{
		replace sibsize=sibsize+1 if inlist(sib_relation`x',5,6)		
	}
	
	foreach x of numlist 1/8{
		replace sibsize=sibsize+1 if inlist(new_sib_relation_`x',5,6)
			}
	
	label var sibsize "Number of siblings at endline"

	
	** Number of younger siblings

	gen sibsize_young=0
	foreach x of numlist 1/11{
		replace sibsize_young=sibsize_young+1 if inlist(sib_relation`x',5,6) & sib_age`x'_3<age
	}
	
	foreach x of numlist 1/8{
		replace sibsize=sibsize+1 if inlist(new_sib_relation_`x',5,6) & new_sib_age_`x'<age
			}

	label var sibsize_young "Number of younger siblings"

	
	** Attendance

	gen attendance=0 if inrange(absent_days,0,7)
	replace attendance=1 if absent_days==0
	label var attendance "Attended school every day last week"
	
	label define yesno 1 "Yes" 0 "No"
	label values attendance yesno
	


	** Vignette questions

	**1. Neelam Naveen vignette

	gen agree_deci_2_y=inlist(agree_deci_2,1,2) if !mi(agree_deci_2)
	label values agree_deci_2_y yesno
	order agree_deci_2_y, after(agree_deci_2)

	gen agree_deci_2_n=inlist(agree_deci_2,4,5) if !mi(agree_deci_2)
	label values agree_deci_2_n yesno
	order agree_deci_2_n, after(agree_deci_2_y)

	foreach x in town_studies better_student{
		foreach num in 1 2 3{
			gen `x'_`num'=`x'==`num' if !mi(`x')
			local varlab`num': label (`x') `num'
			label var `x'_`num' "`varlab`num''"
			}
		order `x'_?, after(`x')	
		label values `x'_? yesno

		}


	label var town_studies_3 "Borrow money and send both"
	foreach x of varlist town_studies_1 town_studies_2 town_studies_3{
		local varlab: variable label `x'
		local varlab=subinstr("`varlab'","\hspace{3 mm} ","",1)
		label var `x' "Who would you send to school: `varlab'"
		label values `x' yesno
	}

	label var better_student_3 "Borrow money and send both"
	foreach x of varlist better_student_1 better_student_2 better_student_3{
		local varlab: variable label `x'
		local varlab=subinstr("`varlab'","\hspace{3 mm} ","",1)	
		label var `x' "If Neelam was a better student, send: `varlab'"
		label values `x' yesno
	}

	gen send_neelam=inlist(town_studies,2,3) if !mi(town_studies)
	replace send_neelam=0 if town_studies==.d   // don't know is 0
	
	gen send_neelam_better=inlist(better_student,2,3) if !mi(better_student)
	replace send_neelam_better=0 if better_student==.d 
	replace send_neelam_better=1 if town_studies==2
	order send_neelam send_neelam_better, after(better_student_3)
	label values send_neelam send_neelam_better yesno

	foreach x of varlist alone_not_safe marry_18 imp_boy_high_edu{
		local varlab: variable label `x'
		local varlab=trim(subinstr("`varlab'",word("`varlab'",1),"",1))
		gen `x'_y=inlist(`x',1,2) if !mi(`x')
		label var `x'_y "`varlab'"
		label values `x'_y yesno
		order `x'_y, after(`x')
		
		gen `x'_n=inlist(`x',4,5) if !mi(`x')
		label var `x'_n "Disagree: `varlab'"
		label values `x'_n yesno
		order `x'_n, after(`x'_y)	
		
	}

	foreach x in consult_deci favor_son {   // doesn't matter and don't know = 0 
		gen `x'_y=`x'==1 if !mi(`x')
		replace `x'_y=0 if `x'==.d
		order `x'_y, after(`x')
		label values `x'_y yesno
	}

	
	label var agree_deci_2_y "Agrees with sending Naveen (boy) to school"
	label var agree_deci_2_n "Disagrees with sending only Naveen (boy) to school"
	label var send_neelam "Send Neelam or both children to school"
	label var send_neelam_better "Send Neelam or both to school if Neelam is a better student"
	label var consult_deci_y "The father should have consulted the mother"
	label var favor_son_y "The family favored the son more"
	label var imp_boy_high_edu "It is more important to send boys for higher education"
	label var alone_not_safe_y "Agrees staying alone in the town is not safe for Neelam"
	label var marry_18_y "Agrees Neelam needs to be married off as she is 18 years old"
	label var imp_boy_high_edu_y "Agrees it is more important to send boys for higher education"
	
	gen town_studies_y=inlist(town_studies,2,3) if !mi(town_studies)

	lab var town_studies_y "If you were the head of the family - who would you have sent for further studies?"
	label define eduvignette 1 "Neelam/Both children" 0 "Naveen"
	label values town_studies_y eduvignette
	order town_studies_y, after(town_studies_3)


	**2. Pooja vignette
	
	label var agree_deci_1 "Agrees with getting Pooja married off"
	
	foreach x in right_time_marry not_work_marriage husband_responsibility marriage_more_imp bad_police_officer follow_parent_wish teacher_suitable pooja_decision {
	local varlab: variable label `x'
		gen `x'_y=inlist(`x',1,2) if !mi(`x')
		label var `x'_y "Agree: `varlab'"
		label values `x'_y yesno
		order `x'_y, after(`x')
		
		gen `x'_n=inlist(`x',4,5) if !mi(`x')
		label var `x'_n "Disagree: `varlab'"
		label values `x'_n yesno
		order `x'_n, after(`x'_y)		
	
	
	}
	
	** Self-efficacy
	
	local self satisfy enjoy_learn good_qly able_do_most make_comm full_idea social_prob parent_help defini_opinion
	
	
	foreach x in `self' {
		local varlab: variable label `x'
		gen `x'_y=inlist(`x',1,2) if !mi(`x')
		label var `x'_y "Agree: `varlab'"
		label values `x'_y yesno
		order `x'_y, after(`x')
		
		gen `x'_n=inlist(`x',4,5) if !mi(`x')
		label var `x'_n "Disagree: `varlab'"
		label values `x'_n yesno
		order `x'_n, after(`x'_y)		
			}
			
	** Gender attitude questions
	
	local gender woman_role_home man_final_deci woman_viol equal_oppo ///
		wives_less_edu girl_allow_far similar_right boy_more_oppo ///
		dowry_girl_marriage elect_woman question_opinion control_daughters ///
		sons_protect boy_study_marry control_wife men_better_suited ///
		girl_study_marry shy_boy girl_laugh shy_girl boy_laugh
	
	foreach x in `gender' {
		local varlab: variable label `x'
		gen `x'_y=inlist(`x',1,2) if !mi(`x')
		label var `x'_y "Agree: `varlab'"
		label values `x'_y yesno
		order `x'_y, after(`x')
		
		gen `x'_n=inlist(`x',4,5) if !mi(`x')
		label var `x'_n "Disagree: `varlab'"
		label values `x'_n yesno
		order `x'_n, after(`x'_y)		
		}

	gen study_marry= 1 if girl_study_marry_y==boy_study_marry_y & !mi(girl_study_marry_y) & !mi(boy_study_marry_y)
	replace study_marry= 0 if girl_study_marry_y!=boy_study_marry_y & !mi(girl_study_marry_y) & !mi(boy_study_marry_y)

	replace study_marry = .r if inlist(girl_study_marry, .r) |  inlist(boy_study_marry, .r)
	replace study_marry = .d if inlist(girl_study_marry, .d) |  inlist(boy_study_marry, .d)	 
	replace study_marry = .s if inlist(girl_study_marry, .s) |  inlist(boy_study_marry, .s)
	
	label var study_marry "Has gender equal views on getting higher education for better marriage prospects"
	order study_marry, after(girl_study_marry_n)


	**Fertility 
	
	gen fertility=0 if two_girls==two_boys & !mi(two_girls) & !mi(two_boys)
	replace fertility=-1 if inlist(two_boys,1) & inlist(two_girls,2,3)
	replace fertility=1 if inlist(two_girls,1) & inlist(two_boys,2,3)
	replace fertility=0 if fertility==. & !mi(two_girls) & !mi(two_boys)
	
	
	** Sex Ratio
	
	gen girls_less_y=inlist(girls_less,1) if !mi(girls_less)
	label var girls_less_y "In Haryana, the number of girls are less than the number of boys"
	label values girls_less_y yesno
	order girls_less_y, after(girls_less)
	
	
	** Education aspirations

	gen occupa_25_white=inlist(occupa_25,4,7,8) if !mi(occupa_25)
	label var occupa_25_white "Child expects white collar job when he/she is 25 years old"
	label values occupa_25_white yesno
	order occupa_25_white, after(occupa_25)
	
	gen class_rank_high=inlist(class_rank,1,2) if !mi(class_rank)
	label var class_rank_high "Child ranks himself/herself above average academically"
	label values class_rank_high yesno
	order class_rank_high, after(class_rank)
	
	** Marriage aspirations
	
	gen girl_marriage_age_19=1 if girl_marriage_age_numb>19 & !mi(girl_marriage_age_numb)
	replace girl_marriage_age_19=0 if girl_marriage_age_numb<=19 & !mi(girl_marriage_age_numb)
	label var girl_marriage_age_19 "Sister/cousins/female friends should be married after age 19"
	label values girl_marriage_age_19 yesno
	
	gen marriage_age_diff=boy_marriage_age_numb-girl_marriage_age_numb if !mi(boy_marriage_age_numb) & !mi(girl_marriage_age_numb)
	summ marriage_age_diff if treatment==0, detail
	local control_median= `r(p50)'
	gen marriage_age_diff_m=0 if marriage_age_diff>`control_median' & !mi(marriage_age_diff)
	replace marriage_age_diff_m=1 if marriage_age_diff<=`control_median' & !mi(marriage_age_diff)
	label var marriage_age_diff "Difference between boys and girls age to marry"
	label var marriage_age_diff_m "Difference between boys and girls age to marry is lesser than control median"
	order girl_marriage_age_19 marriage_age_diff marriage_age_diff_m, after(boy_marriage_age_numb)
	
	bys gender: egen board_median= median(board_score) if !mi(board_score)
	gen board_score_median = 1 if board_score>=board_median & !mi(board_score)
	replace board_score_median=0 if board_score<board_median & !mi(board_score)
	drop board_median
	lab var board_score_median "Board score is greater than the gender-wise median value"
	lab values board_score_median yesno
	order board_score_median, after(board_score)
	
	
	bys gender: egen educ_median= median(highest_educ) if !mi(highest_educ)
	gen highest_educ_median = 1 if highest_educ>=educ_median & !mi(highest_educ)
	replace highest_educ_median=0 if highest_educ<educ_median & !mi(highest_educ)
	drop educ_median
	lab var highest_educ_median "Highest level of education child wishes to complete is greater than the gender-wise median value"
	lab values highest_educ_median yesno
	order highest_educ_median, after(highest_educ)

	
	**Gender behaviour
	
	**
	egen talk_opp_gender= rowtotal(comf_opp_gender_girl comf_opp_gender_boy)
	replace talk_opp_gender=. if inlist(comf_opp_gender_girl,.d,.r,.s,.i,.) & inlist(comf_opp_gender_boy,.d,.r,.s,.i,.)
	
	lab var talk_opp_gender "Are you comfortable talking to students of the opposite gender who are not related to you inside and outside the school"
	note talk_opp_gender: "Are you comfortable talking to students of the opposite gender who are not related to you inside and outside the school"
	
	label define talk_opp_gender 1 "Very comfortable" 2 "Moderately comfortable" 3 "Moderately uncomfortable" 4 "Very uncomfortable"
	label values talk_opp_gender talk_opp_gender
	
	gen talk_opp_gender_comf=inlist(talk_opp_gender,1,2) if !mi(talk_opp_gender)
	label var talk_opp_gender_comf "Child is comfortable talking to students of the opposite sex"
	label values talk_opp_gender_comf yesno
	
	order talk_opp_gender talk_opp_gender_comf, after(comf_opp_gender_boy)

	**
	egen teased= rowtotal(teased_opp_gender_girl teased_opp_gender_boy) 
	replace teased=. if inlist(teased_opp_gender_girl,.d,.r,.s,.i,.) & inlist(teased_opp_gender_boy,.d,.s,.r,.i,.)

	lab var teased "How frequently have you been teased, whistled at or called names by students of opposite sex in your class?"
	note teased: "How frequently have you been teased, whistled at or called names by by students of opposite sex in your class?( Do not read the options out loud)"
	
	label define teased 1 "Never" 2 "Sometimes" 3 "Often" 4 "Always"
	label values teased teased
	
	gen teased_y=inlist(teased,2,3,4) if !mi(teased)
	gen teased_n=inlist(teased,1) if !mi(teased)
	label var teased_y "Child has been teased by students of the opposite sex"
	label var teased_n "Child has never been teased by students of the oppoiste sex"
	label values teased_y teased_n yesno

	order teased teased_y teased_n, after(teased_opp_gender_boy)
	
	**
	egen sit_opp_gender= rowtotal(sit_opp_gender_girl sit_opp_gender_boy)
	replace sit_opp_gender=. if inlist(sit_opp_gender_girl,.d,.r,.s,.i,.) & inlist(sit_opp_gender_boy,.d,.r,.s,.i,.)
	lab var sit_opp_gender "Do you sit next to by students of opposite sex in the classroom? (Do not read the options out loud)"
	note sit_opp_gender: "Do you sit next to by students of opposite sex in the classroom? (Do not read the options out loud)"
	label values sit_opp_gender yesno
	
	order sit_opp_gender, after(sit_opp_gender_boy)
	
	**
	egen play_opp_gender= rowtotal(play_opp_gender_girl play_opp_gender_boy)
	replace play_opp_gender=. if inlist(play_opp_gender_girl,.d,.r,.s,.i,.) & inlist(play_opp_gender_boy,.d,.r,.s,.i,.)
	lab var play_opp_gender "Do you play with students of opposite sex in the classroom? (Do not read the options out loud)"
	note play_opp_gender: "Do you play with students of opposite sex in the classroom? (Do not read the options out loud)"
	label values play_opp_gender yesno

	order play_opp_gender, after(play_opp_gender_boy)
	
	
	label var tease_girls_6 "The boys in the class do not indulge in any form of harassment"
	
	** Homework questions
	
	gen homework_y=inlist(homework,2,3,4) if !mi(homework)
	label var homework_y "Child does homework at least once a week"
	label values homework_y yesno

	order homework_y, after(homework)

	gen homework_self=inlist(help_homework,1) if !mi(help_homework)
	label var homework_self "Child does homework himself/herself"
	label values homework_self yesno

	order homework_self, after(help_homework)
	
	** Who eats meal first?
	
	gen father_eat_first=inlist(first_meal,2) if !mi(first_meal)
	label var father_eat_first "When the family takes the main meal, father takes the meal first"
	gen child_eat_first=inlist(first_meal,1) if !mi(first_meal)
	label var child_eat_first "When the family takes the main meal, child takes the meal first"
	label values father_eat_first child_eat_first yesno

	order father_eat_first child_eat_first, after(first_meal)
	
	** Access to media
	
	gen tv_per_day=often_tv_hr
	replace tv_per_day=0 if inlist(often_tv,2) | inlist(tv_house,2)
	replace tv_per_day=tv_per_day/7 if often_tv_unit==2
	replace tv_per_day=tv_per_day/30 if often_tv_unit==3
	replace tv_per_day=tv_per_day/365 if often_tv_unit==4
	replace tv_per_day=. if !inrange(tv_per_day,0,10) // outliers
	label var tv_per_day "Hours of TV watching per day"

	gen tv_per_day_cat=ceil(tv_per_day)
	label var tv_per_day_cat "Hours of TV watching per day (rounded up)"
	
	order tv_per_day tv_per_day_cat, after(often_tv_unit)
	
	** Female foeticide
	
	gen female_foeticide_reason_y=1 if female_foeticide_reason_1==1 | female_foeticide_reason_2==1 | female_foeticide_reason_3==1 ///
			| female_foeticide_reason_4==1 | female_foeticide_reason_5==1 | female_foeticide_reason_6==1 | female_foeticide_reason_7==1 ///
			| female_foeticide_reason_8==1 | female_foeticide_reason_9==1
	replace female_foeticide_reason_y=0 if female_foeticide_reason__999==1 | female_foeticide_reason__998==1
	label var female_foeticide_reason_y "Child knows at least one reason for female foeticide and infanticide"
	label values female_foeticide_reason_y yesno
	
	order female_foeticide_reason_y, after(female_foeticide_reason_other)

	
	** Treatment questions
	
	gen video_van_n=inlist(video_van,1) if !mi(video_van)
	label var video_van_n "Child has never attended a video van"
	label values video_van_n yesno

	order video_van_n, after(video_van)
	*exit
	gen useful_sessions_10=inlist(useful_sessions,10) if !mi(useful_sessions)
	label var useful_sessions_10 "How useful were the learnings from the sessions - child gives 10"
	label values useful_sessions_10 yesno
	
	order useful_sessions_10, after(useful_sessions)


	
	**How often?
	
	local often cook_clean take_care_young_sib hh_shopping 
	
	foreach x in `often' {
		gen `x'_y=inlist(`x',2,3,4) if !mi(`x')
		label values `x'_y yesno
		order `x'_y, after(`x')
	}
		
	
	lab var cook_clean_y "At least once a week: Cook/clean/wash clothes"
	lab var take_care_young_sib_y "At least once a week: Take care of younger siblings/old persons"
	lab var hh_shopping_y "At least once a week: Went shopping for household provisions/paid bills"
	
	
	**Decisions
	
	local decision decision_past_tenth decision_work decision_kindofwork decision_chores
	
	foreach x in `decision' {
		local varlab: variable label `x'
		gen `x'_y=inlist(`x',1) if !mi(`x')
		label var `x'_y "Child takes `varlab'"
		label values `x'_y yesno
		order `x'_y, after(`x')
	}
		
	
*************************************
***   Drop additional variables   ***
*************************************

	drop deviceid subscriberid simid devicephonenum ///
		 duration caseid school_id_1 child_id_1 child_id_sub1 child_id_sub2 ///
		 instanceid instancename formdef_version key 
		
	rename * S*
	rename Schild_id child_id
	sort Sschool_id child_id

