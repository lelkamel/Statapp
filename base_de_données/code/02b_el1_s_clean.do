*********************************************************************************
*
*	 Project: Breakthrough (J-PAL South Asia)
*
*    Purpose: 
*********************************************************************************

/* CONTENTS
1. Recoding 'don't knows' and 'refuses'
2. Coding valid and invalid skips patterns
5.

*/

	
	
	*******************************************
	******recoding dont knows and refuses******
	*******************************************
	
	quietly ds, has(type numeric)

	foreach var in `r(varlist)' {
	replace `var'=.d if `var'==-999
	replace `var'=.r if `var'==-998
	replace `var'=.d if `var'==999

	}
	
	
	*********************************
	******recoding valid skips*******
	*********************************
	
	**1. 50-50 randomization
	
	**Vignettes
	
	local vignette1 agree_deci_1 right_time_marry not_work_marriage husband_responsibility ///
		marriage_more_imp bad_police_officer follow_parent_wish teacher_suitable pooja_decision
	
	local vignette2 agree_deci_2 town_studies better_student consult_deci alone_not_safe marry_18 imp_boy_high_edu favor_son
	
	foreach var in `vignette1' {
		replace `var'=.s if random1<0.5 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1 & random1!=.
		}
	
	foreach var in `vignette2' {
		replace `var'=.s if random1>=0.5 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1 & random1!=.
		}
		
	
	replace better_student=.s if town_studies==2 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
	
	**Attitudes
	
	local grp1 shy_boy girl_laugh
	local grp2 shy_girl boy_laugh
	
		foreach var in `grp1' {
		replace `var'=.s if random2<0.5 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
		}
	
	foreach var in `grp2' {
		replace `var'=.s if random2>=0.5 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
		}
	
	**Social norms
	
	local social1 allow_work community_allow_work oppose_allow_work discourage_work counterfactual_allow_work
	local social2 allow_college community_allow_college oppose_allow_college discourage_college counterfactual_allow_college
	
	foreach var in `social1' {
		replace `var'=.s if random3<0.5 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
		}
	
	foreach var in `social2' {
		replace `var'=.s if random3>=0.5 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
		}

	
	
	**2. School information
	
	**dropouts
	local dropout school_dropout_1 school_dropout_2 school_dropout_3 ///
		school_dropout_4 school_dropout_5 school_dropout_6 school_dropout_7 ///
		school_dropout_8 school_dropout_9 school_dropout__999 school_dropout__998 ///
		school_dropout_familymember class_dropout
	
	foreach var in `dropout' {
		replace `var'=.s if school_enrolled==1 | school_enrolled==2 | school_enrolled==3 | school_enrolled==4 | school_enrolled==.d | school_enrolled==.r 
		}
	
	replace school_dropout_familymember=.s if school_dropout_3==0
	
	**school-going children
	
	//encode section_enrolled, generate(section)
	
	local school class absent_sch absent_days absent_sch_reason_hhwork ///
		often_bunk extra_activities_1 extra_activities_2 extra_activities_3 ///
		extra_activities_4 extra_activities__999 extra_activities__998 class_rank
		
	foreach var in `school' {
		replace `var'=.s if school_enrolled==5 | school_enrolled==6
		}
		
	replace absent_days=0 if absent_sch==2 
	replace absent_days=.s if absent_sch==.r | absent_sch==.d
	
	replace board_score=.s if school_enrolled==6 
	
	**3. Female Foeticide
	
	local foeticide female_foeticide_state female_foeticide_reason_1 female_foeticide_reason_2 ///
		female_foeticide_reason_3 female_foeticide_reason_4 female_foeticide_reason_5 ///
		female_foeticide_reason_6 female_foeticide_reason_7 female_foeticide_reason_8 ///
		female_foeticide_reason_9 female_foeticide_reason_10 female_foeticide_reason__999 female_foeticide_reason__998
		
	foreach var in `foeticide' {
		replace `var'=.s if female_foeticide==0 | female_foeticide==.d | female_foeticide==.r
		}
	
	**4. Media
	
	replace access_mobile=.s if mem_cell==0 | mem_cell==.d | mem_cell==.r
	
	local purp_mobile purp_mobile_1 purp_mobile_2 purp_mobile_3 purp_mobile_4 purp_mobile_5 purp_mobile_6 purp_mobile_7 purp_mobile__999 purp_mobile__998
	
	foreach var in `purp_mobile' {
		replace `var'=.s if access_mobile==0 | access_mobile==.s | access_mobile==.d | access_mobile==.r
			}
	
	replace often_tv=.s if tv_house==0 | tv_house==.d | tv_house==.r
	
	replace often_tv_hr=.s if often_tv==2 | often_tv==.d | often_tv==.r | often_tv==.s

	replace often_tv_unit=.s if often_tv==2 | often_tv==.d | often_tv==.r | often_tv==.s
	
	local watch_tv what_tv_1 what_tv_2 what_tv_3 what_tv_4 what_tv_5 what_tv_6 what_tv__999 what_tv__998
	
	foreach var in `watch_tv' {
		replace `var'=.s if often_tv==2 | often_tv==.d | often_tv==.r | often_tv==.s
			}


	
	**5. Social norms
	
	replace oppose_allow_college=.s if allow_college==0 & community_allow_college==0
	replace oppose_allow_college=.s if allow_college==1 & community_allow_college==1
	replace oppose_allow_college=.s if allow_college==.d | allow_college==.r
	replace oppose_allow_college=.s if community_allow_college==.d | community_allow_college==.r

	replace counterfactual_allow_college=.s if counterfactual_allow_college==. & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
	
	replace oppose_allow_work=.s if allow_work==0 & community_allow_work==0
	replace oppose_allow_work=.s if allow_work==1 & community_allow_work==1
	replace oppose_allow_work=.s if allow_work==.d | allow_work==.r
	replace oppose_allow_work=.s if community_allow_work==.d | community_allow_work==.r

	replace counterfactual_allow_work=.s if counterfactual_allow_work==. & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1

	**6. Treatment questions
	
	local treatment organization_session name_organization attend_session issues_session_1 ///
		issues_session_2 issues_session_3 issues_session_4 issues_session_5 issues_session_6 ///
		issues_session_7 issues_session__999 issues_session__998 continue_sessions ///
		useful_sessions video_van
		
	foreach var in `treatment' {
	replace `var'=.s if treatment==0 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
		}
	
	replace name_organization=.s if organization_session==0 | organization_session==.d | organization_session==.r
	replace attend_session=.s if organization_session==0 | organization_session==.d | organization_session==.r

	local treatment2 issues_session_1 issues_session_2 ///
		issues_session_3 issues_session_4 issues_session_5 issues_session_6 ///
		issues_session_7 issues_session__999 issues_session__998 continue_sessions ///
		useful_sessions
	
	foreach var in `treatment2' {
	replace `var'=.s if organization_session==0 |  organization_session==.d | organization_session==.r 
	replace `var'=.s if attend_session==0 |  organization_session==.d | organization_session==.r | attend_session==.s
		}
	
	
	
	**6. Misc
	
	replace help_homework=.s if homework==1
	
	replace girl_marriage_age_numb=.s if girl_marriage_age!=1 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
	replace boy_marriage_age_numb=.s if boy_marriage_age!=1 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
	
	replace action_harassed=.s if tease_girls_6==1 | tease_girls__999==1 | tease_girls__998==1
	
	replace alone_atten_events=.s if atten_events!=1 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1

	
	**7. Skip patterns based on gender of the respondent
	
	replace comf_opp_gender_girl=.s if gender==1 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
	replace comf_opp_gender_boy=.s if gender==0 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1

	replace play_opp_gender_girl=.s if gender==1 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
	replace play_opp_gender_boy=.s if gender==0 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1

	replace teased_opp_gender_girl=.s if gender==1 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
	replace teased_opp_gender_boy=.s if gender==0 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1

	replace sit_opp_gender_girl=.s if gender==1 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
	replace sit_opp_gender_boy=.s if gender==0 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1

	local asked_boys encourage_dress encourage_meet_friends encourage_melas
	
	foreach var in `asked_boys' {
		replace `var'=.s if gender==1 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
			}
			
	local asked_girls allow_new_fashion own_jeans allow_wear_any_dress
	
	foreach var in `asked_girls' {
		replace `var'=.s if gender==0 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
			}
	
	
	
	**migrant survey skips
	
	**Migrant surveys were done over the phone using just a subset of the questions
	
	quietly ds, has(type numeric) 
	local vars `r(varlist)'
	unab omit: new_sib* sib* subscriberid caseid simid devicephonenum
	local want : list vars - omit
	//display "`want'"

	foreach var in `want' {
		replace `var'=.s if `var'==. & place_of_interview==3
		
	}
	
	
	
	***********************************
	********coding wrong skips*********
	***********************************

	/*this was required because 
		1. the form was not updated in SurveyCTO before starting the survey activities
		2. there was a coding glitch in SurveyCTO prefilled dataset
		3. some skips for dropouts and students in same-sex schools were not considered
		4. wrong student ID filled in by surveyors
	*/
	
	replace help_homework=.i if homework==4 & formdef_version==1611071742

	local treatment3 name_organization attend_session issues_session_1 ///
		issues_session_2 issues_session_3 issues_session_4 issues_session_5 issues_session_6 ///
		issues_session_7 issues_session__999 issues_session__998 continue_sessions ///
		useful_sessions video_van

	
	foreach var in `treatment3' {
		replace `var'=.i if organization_session==. & school_id==3426 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
			}
			
	replace organization_session=.i if organization_session==. & school_id==3426 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
			
	replace homework=.i if school_enrolled==5 | school_enrolled==6
	replace help_homework=.i if school_enrolled==5 | school_enrolled==6

	local gender comf_opp_gender_girl comf_opp_gender_boy play_opp_gender_girl ///
		play_opp_gender_boy teased_opp_gender_girl teased_opp_gender_boy encourage_dress ///
		encourage_meet_friends encourage_melas own_jeans allow_wear_any_dress ///
		allow_new_fashion sit_opp_gender_girl sit_opp_gender_boy
	
	foreach var in `gender' {
		replace `var'=.i if child_id==2515119 | child_id==3204081 | child_id==3414019
			}
			
	
	
	**same-sex schools
	
	bys gender: gen ID=1
	bys school_id: egen girl=total(ID) if inlist(gender,1)
	bys school_id: egen boy=total(ID) if inlist(gender,0)
	bys school_id: egen total_school=total(ID)
	
	bys school_id: gen perc_girl=girl/total_school*100
	bys school_id: gen perc_boy=boy/total_school*100
	
	gen coed=0 if perc_girl==100 | perc_boy==100
	replace coed=1 if coed==.
	
	drop ID girl boy perc_girl perc_boy total_school
	
	label var coed "School is coed"
	
	**skips
	
	replace  sit_opp_gender_girl=.i if coed==0 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
	replace  sit_opp_gender_boy=.i if coed==0 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1

	replace  teased_opp_gender_girl=.i if coed==0 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
	replace  teased_opp_gender_boy=.i if coed==0 & student_consent==1 & disability!=5 & disability!=6 & parent_consent==1
	
	
	
	
	
	
	***********************************
	********cleaning variables*********
	***********************************

	**Section
	replace section_enrolled="A" if section_enrolled=="a"
	replace section_enrolled="B" if section_enrolled=="b"
	replace section_enrolled="C" if section_enrolled=="c"
	replace section_enrolled="A" if section_enrolled=="À"
	replace section_enrolled="." if section_enrolled=="0" | section_enrolled=="6" | section_enrolled=="9"

		
	sort school_id child_id	
	

