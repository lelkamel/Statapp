*********************************************************************************
*	 Project: Breakthrough (BT)
*
*	 Purpose: Running double LASSO to select extended controls
*********************************************************************************

use "$finaldata", clear

# d ;

****** BASELINE ; 

** GENDER ATTITUDES ;

global bl_gender_flag B_Schild_woman_role_n_flag B_Schild_man_final_deci_n_flag 
B_Schild_woman_tol_viol_n_flag B_Schild_wives_less_edu_n_flag 
B_Schild_boy_more_opps_n_flag B_Schild_equal_opps_y_flag B_Schild_girl_allow_study_y_flag 
B_Schild_similar_right_y_flag B_Schild_elect_woman_y_flag;

global bl_educ_flag B_Schild_wives_less_edu_n_flag B_Schild_boy_more_opps_n_flag ;

global bl_emp_flag B_Schild_woman_role_n_flag ;

global bl_sub_flag B_Schild_man_final_deci_n_flag B_Schild_woman_tol_viol_n_flag B_Schild_similar_right_y_flag B_Schild_elect_woman_y_flag ;

global bl_fert_flag  ;


** ASPIRATIONS ;
global bl_aspiration_flag B_Sdisc_edu_goals_flag B_Shighest_educ_median_flag B_Soccupa_25_white_flag;

** BEHAVIOR  (where does this fit: B_Sabsent_sch_g_flag); 

global bl_behavior_girl_flag B_Stalk_opp_gender_g_flag B_Salone_friend_g_flag 
B_Sabsent_sch_g_flag B_Scook_clean_g_flag;

global bl_behavior_boy_flag B_Stalk_opp_gender_b_flag B_Scook_clean_b_flag;

global bl_behavior_common_flag B_Scook_clean_comm_flag B_Stalk_opp_gender_comm_flag;

global bl_behavior_oppsex_flag B_Stalk_opp_gender_comm_flag ;

global bl_behavior_hhchores_flag B_Scook_clean_comm_flag ;

global bl_behavior_relatives_flag  ;

global bl_behavior_decision_girl_flag B_Sabsent_sch_g_flag;

global bl_mobility_flag B_Salone_friend_g_flag ;

** SELF-ESTEEM;
global bl_esteem_flag B_Ssatisfy_y_flag B_Sgood_qlty_y_flag B_Sable_do_most_y_flag ;


**** ENDLINE 1 ; 

global el_gender_flag E_Swives_less_edu_n_flag E_Select_woman_y_flag E_Sboy_more_oppo_n_flag E_Stown_studies_y_flag 
	E_Sman_final_deci_n_flag E_Swoman_viol_n_flag E_Scontrol_daughters_n_flag E_Swoman_role_home_n_flag 
	E_Smen_better_suited_n_flag E_Ssimilar_right_y_flag E_Smarriage_more_imp_n_flag E_Steacher_suitable_n_flag E_Sgirl_marriage_age_19_flag 
	E_Smarriage_age_diff_m_flag E_Sstudy_marry_flag E_Sallow_work_y_flag E_Sfertility_flag;

global el_aspiration_flag E_Sboard_score_median_flag E_Shighest_educ_median_flag E_Sdiscuss_educ_flag E_Soccupa_25_white_flag E_Scont_educ_flag;

global el_behavior_girl_flag E_Stalk_opp_gender_g_flag E_Ssit_opp_gender_g_flag E_Scook_clean_g_flag 
		E_Sfuture_work_g_flag E_Sdecision_past_tenth_g_flag E_Sdecision_work_g_flag 
		E_Sdecision_kindofwork_g_flag E_Salone_friend_g_flag E_Sabsent_sch_g_flag E_Sabsent_sch_hhwork_g_flag 
		E_Sdiscourage_work_g_flag E_Sdiscourage_college_g_flag;

global el_behavior_boy_flag E_Stalk_opp_gender_b_flag E_Ssit_opp_gender_b_flag E_Scook_clean_b_flag
		E_Sabsent_sch_hhwork_b_flag E_Sdiscourage_work_b_flag E_Sdiscourage_college_b_flag;

global el_behavior_common_flag E_Stalk_opp_gender_comm_flag E_Ssit_opp_gender_comm_flag E_Scook_clean_comm 
		E_Sabsent_sch_hhwork_comm_flag E_Sdiscourage_college_comm_flag E_Sdiscourage_work_comm_flag;

* new variable
global el_behavior_girl_nv_flag E_Stalk_opp_gender_g_flag E_Ssit_opp_gender_g_flag E_Scook_clean_g_flag 
		E_Sfuture_work_g_flag E_Sdecision_past_tenth_g_flag E_Sdecision_work_g_flag 
		E_Sdecision_kindofwork_g_flag E_Salone_friend_g_flag E_Sabsent_sch_g_flag E_Sabsent_sch_hhwork_g_flag 
		E_Sdiscourage_work_g_flag E_Sdiscourage_college_g_flag 
		E_Shh_shopping_g_flag  E_Stake_care_young_sib_g_flag E_Sdecision_chores_g;

global el_behavior_boy_nv_flag E_Stalk_opp_gender_b_flag E_Ssit_opp_gender_b_flag E_Scook_clean_b_flag
		E_Sabsent_sch_hhwork_b_flag E_Sdiscourage_work_b_flag E_Sdiscourage_college_b_flag
		E_Shh_shopping_b E_Stake_care_young_sib_b;


*** gender subindices:
global el_educ_flag E_Swives_less_edu_n_flag E_Sboy_more_oppo_n_flag E_Stown_studies_y_flag;

global el_emp_flag  E_Swoman_role_home_n_flag E_Smen_better_suited_n_flag E_Smarriage_more_imp_n_flag E_Steacher_suitable_n E_Sallow_work_y_flag;		

global el_sub_flag E_Select_woman_y_flag E_Sman_final_deci_n_flag E_Swoman_viol_n_flag 
	E_Scontrol_daughters_n_flag E_Ssimilar_right_y_flag E_Sgirl_marriage_age_19_flag 
	E_Smarriage_age_diff_m_flag E_Sstudy_marry_flag;
	
global el_fert_flag ;

*** behavior subindices ;
global el_behavior_oppsex_flag E_Stalk_opp_gender_comm_flag E_Ssit_opp_gender_comm_flag;

global el_behavior_hhchores_flag E_Scook_clean_comm_flag E_Sabsent_sch_hhwork_comm_flag;

global el_behavior_relatives_flag E_Sdiscourage_college_comm_flag E_Sdiscourage_work_comm_flag;

global el_behavior_decision_girl_flag E_Sfuture_work_g_flag E_Sdecision_past_tenth_g_flag 
	E_Sdecision_work_g_flag E_Sdecision_kindofwork_g_flag E_Sabsent_sch_g_flag;
	
global el_mobility_flag ; 


** secondary outcomes ; 
global el_esteem_flag E_Ssatisfy_y_flag E_Sgood_qly_y_flag E_Sable_do_most_y_flag;


global el_discrimination_flag E_Sfemale_foeticide_flag E_Sfemale_foeticide_state_flag 
	E_Sfemale_foeticide_r_y_flag E_Sgirls_less_y_flag;


****** ENDLINE 2 ; 

** GENDER ATTITUDES ;
global el2_gender_flag E2_Swives_less_edu_n_flag E2_Sboy_more_oppo_n_flag E2_Stown_studies_y_flag
 E2_Swoman_role_home_n_flag E2_Smen_better_suited_n_flag E2_Smarriage_more_imp_n_flag 
 E2_Steacher_suitable_n_flag E2_Sallow_work_flag E2_Ssimilar_right_y_flag
 E2_Select_woman_y_flag E2_Sman_final_deci_n_flag E2_Swoman_viol_n_flag 
 E2_Scontrol_daughters_n_flag E2_Sstudy_marry_flag E2_Sgirl_marriage_age_19_flag 
 E2_Smarriage_age_diff_m_flag E2_Sfertility_flag ;

global el2_educ_flag E2_Swives_less_edu_n_flag E2_Sboy_more_oppo_n_flag E2_Stown_studies_y_flag;

global el2_emp_flag E2_Swoman_role_home_n_flag E2_Smen_better_suited_n_flag
E2_Smarriage_more_imp_n_flag E2_Steacher_suitable_n_flag E2_Sallow_work_flag;

global el2_sub_flag E2_Ssimilar_right_y_flag E2_Select_woman_y_flag E2_Sman_final_deci_n_flag
E2_Swoman_viol_n_flag E2_Scontrol_daughters_n_flag2 E2_Sstudy_marry_flag E2_Sgirl_marriage_age_19_flag E2_Smarriage_age_diff_m_flag;

global el2_fert_flag ;
* NOTE no flag for fertility (single variable); 

** ASPIRATIONS ;

global el2_aspiration_flag E2_Stwel_score_exp_m_flag E2_Sdiscuss_educ_flag E2_Scont_educ_flag 
E2_Shighest_educ_m_flag E2_Soccupa_25_y_flag E2_Splan_college_flag E2_Scol_course_want_y_flag 
E2_Scol_course_want_stem_flag E2_Scont_have_job_y_flag;

global el2_aspiration_boy_flag E2_Stwel_score_exp_m_flag E2_Sdiscuss_educ_flag 
E2_Scont_educ_flag E2_Shighest_educ_m_flag E2_Soccupa_25_y_flag 
E2_Splan_college_flag E2_Scol_course_want_y_flag E2_Scol_course_want_stem_flag;


** BEHAVIOR;

global el2_behavior_girl_flag E2_Sfuture_work_flag E2_Sdec_past_twel_y_flag E2_Sdecision_work_y_flag 
E2_Sdecision_kindofwork_y_flag E2_Sattendance_flag E2_Salone_friend_flag E2_Salone_market_flag 
E2_Salone_events_flag E2_Salone_past_week_flag E2_Salone_school_y_flag E2_Stalk_opp_gen_g_flag 
E2_Ssit_opp_gen_g_flag E2_Sfriend_opp_gen_g_flag E2_Splay_opp_gen_g_flag E2_Stalk_week_opp_gen_g_flag 
E2_Scook_clean_g_flag E2_Sabsent_sch_hhwork_g_flag E2_Sdisc_col_g_flag E2_Sdisc_work_g_flag;


global el2_behavior_boy_flag E2_Stalk_opp_gen_b_flag E2_Ssit_opp_gen_b_flag 
E2_Sfriend_opp_gen_b_flag E2_Splay_opp_gen_b_flag E2_Stalk_week_opp_gen_b_flag 
E2_Scook_clean_b_flag E2_Sabsent_sch_hhwork_b_flag E2_Sdisc_col_b_flag E2_Sdisc_work_b_flag;

global el2_behavior_common_flag E2_Stalk_opp_gen_comm_flag E2_Ssit_opp_gen_comm_flag
E2_Sfriend_opp_gen_comm_flag E2_Splay_opp_gen_comm_flag E2_Stalk_week_opp_gen_comm_flag 
E2_Scook_clean_comm_flag E2_Sabsent_sch_hhwork_comm_flag E2_Sdisc_col_comm_flag E2_Sdisc_work_comm_flag;

global el2_behavior_oppsex_flag E2_Stalk_opp_gen_comm_flag E2_Ssit_opp_gen_comm_flag 
E2_Sfriend_opp_gen_comm_flag E2_Splay_opp_gen_comm_flag E2_Stalk_week_opp_gen_comm_flag;

global el2_behavior_hhchores_flag E2_Scook_clean_comm_flag E2_Sabsent_sch_hhwork_comm_flag;

global el2_behavior_relatives_flag E2_Sdisc_col_comm_flag E2_Sdisc_work_comm_flag;

global el2_behavior_decision_girl_flag E2_Sfuture_work_flag E2_Sdec_past_twel_y_flag 
E2_Sdecision_work_y_flag E2_Sdecision_kindofwork_y_flag E2_Sattendance_flag;

global el2_mobility_flag E2_Salone_friend_flag E2_Salone_market_flag 
E2_Salone_events_flag E2_Salone_past_week_flag E2_Salone_school_y_flag;

** SELF-ESTEEM;
global el2_esteem_flag E2_Ssatisfy_y_flag E2_Sgood_qly_y_flag E2_Sable_do_most_y_flag;
global el_esteem_girl_flag E_Ssatisfy_y_flag E_Sgood_qly_y_flag E_Sable_do_most_y_flag; //added by Jake; created in build code but needed here as well
global el2_esteem_girl_flag E2_Ssatisfy_y_flag E2_Sgood_qly_y_flag E2_Sable_do_most_y_flag;
global el2_esteem_boy_flag E2_Ssatisfy_y_flag E2_Sgood_qly_y_flag E2_Sable_do_most_y_flag;

** GIRLS' EDUCATIONAL ATTAINMENT;
global el2_educ_attain_flag E2_Sschool_enrol_y_flag E2_Sstem_stream_y_flag 
E2_Senrol_eng_comp_voc_y_flag E2_Stake_tuition_y_flag;

** MARRIAGE AND FERTILITY ASPIRATIONS;

global el2_mar_fert_asp_flag E2_Stot_marry_age_m_flag E2_Sfirst_child_age_m_flag 
E2_Sgirl_boy_pref_flag E2_Sboy_count_m_flag E2_Sprefer_children_y_flag;

** HARASSMENT;
global el2_harassed_flag E2_Sharass_slapped_y_g_flag E2_Steas_opp_gen_boy_scl_y_flag E2_Steas_opp_gen_boy_vil_y_flag 
E2_Stch_opp_gen_boy_scl_y_flag E2_Stch_opp_gen_boy_vil_y_flag;

** NOTE: no flag for boy's harassment index as regression are different;

#d cr

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
*	
*				 LASSO for selecting extended controls
*
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
set seed 5212021

**** have to define globals up top because we remove all-missing values below
global cntrls B_Sage B_Sgrade6 B_rural B_Scaste_sc B_Scaste_st B_Smuslim B_no_female_sib B_no_male_sib B_Sparent_stay ///	
	 B_m_secondary B_m_parttime B_m_fulltime B_Shouse_pukka_y B_Shouse_elec B_Sflush_toilet B_Snonflush_toilet ///
		B_Sown_house B_Phh_durables_1 B_Phh_durables_2 B_Phh_durables_7 B_Snewspaper_house B_Stap_water B_Phh_durables_16 ///
		B_Sefficacy_index2 B_Ssocial_scale B_Pgender_index2_impute B_q10_guest_teachr B_fulltime_teacher B_pct_female_teacher ///
		B_q13_counselor B_q18_pta_meet B_q22_library B_q22_toilets B_q22_electricity B_q22_avail_computers ///
		B_q22_avail_internet B_q22_sports_field B_q22_mid_meal B_q22_auditorium B_q22_avail_edusat B_q21_week1 ///
		B_q21_week6 B_coed Cfem_lit_rate Cmale_lit_rate Cfem_lab_part	

local missing_flags B_Pgender_index2_flag
foreach var of varlist $cntrls {
	cap confirm variable `var'_flag 
	if !_rc {
		local missing_flags `missing_flags' `var'_flag 
	}
} 

foreach type in /*std all all_1 all_2 all_5b _6 _7 _8 _9 all_3 all_4 all_7 all_6*/ all_8 { //all_8 is version in paper; run all if running 3_2 internal analysis

	if "`type'" == "std" {
		local i
	}

	else if "`type'" == "all" {
		local i _all
	}

	else if "`type'" == "all_1" {
		local i _all_1
	}

	else if "`type'" == "all_2" {
		local i _all_2 
	}

	else if "`type'" == "all_3" {
		local i _all_3 
	}
	
	else if "`type'" == "all_5a" {
		local i _all5a 
	}

	else if "`type'" == "all_5b" {
		local i _all5b 
	}

	else {
		local i _`type'
	}

	foreach gender in girls boys both {

		use "$finaldata", clear
		local bg
		if "`gender'" == "girls" {
			keep if B_Sgirl == 1
			local bg "_g"
		}
		else if "`gender'" == "boys" {
			keep if B_Sgirl == 0
			local bg "_b"
		}

		global cntrls_all B_Sage B_Sgrade6 B_rural B_Scaste_sc B_Scaste_st B_Smuslim B_no_female_sib B_no_male_sib B_Sparent_stay ///	
		 B_m_secondary B_m_parttime B_m_fulltime B_Shouse_pukka_y B_Shouse_elec B_Sflush_toilet B_Snonflush_toilet ///
			B_Sown_house B_Phh_durables_1 B_Phh_durables_2 B_Phh_durables_7 B_Snewspaper_house B_Stap_water B_Phh_durables_16 ///
				B_Sefficacy_index2 B_Ssocial_scale B_Pgender_index2_impute B_q10_guest_teachr B_fulltime_teacher B_pct_female_teacher ///
					B_q13_counselor B_q18_pta_meet B_q22_library B_q22_toilets B_q22_electricity B_q22_avail_computers ///
						B_q22_avail_internet B_q22_sports_field B_q22_mid_meal B_q22_auditorium B_q22_avail_edusat B_q21_week1 ///
							B_q21_week6 B_coed Cfem_lit_rate Cmale_lit_rate Cfem_lab_part district_gender_1 district_gender_2 district_gender_3 district_gender_4 district_gender_5 district_gender_6 ///
								district_gender_7 district_gender_8 gender_grade_1 gender_grade_2 gender_grade_3 gender_grade_4 B_Sgender_index2 B_Saspiration_index2 B_Sbehavior_index2 
						 

		global cntrls_all_1 B_Sage B_Sgrade6 B_rural B_Scaste_sc B_Scaste_st B_Smuslim B_no_female_sib B_no_male_sib B_Sparent_stay ///	
		 B_m_secondary B_m_parttime B_m_fulltime B_Shouse_pukka_y B_Shouse_elec B_Sflush_toilet B_Snonflush_toilet ///
			B_Sown_house B_Phh_durables_1 B_Phh_durables_2 B_Phh_durables_7 B_Snewspaper_house B_Stap_water B_Phh_durables_16 ///
				B_Sefficacy_index2 B_Ssocial_scale B_Pgender_index2_impute B_q10_guest_teachr B_fulltime_teacher B_pct_female_teacher ///
					B_q13_counselor B_q18_pta_meet B_q22_library B_q22_toilets B_q22_electricity B_q22_avail_computers ///
						B_q22_avail_internet B_q22_sports_field B_q22_mid_meal B_q22_auditorium B_q22_avail_edusat B_q21_week1 ///
							B_q21_week6 B_coed Cfem_lit_rate Cmale_lit_rate Cfem_lab_part B_Sgender_index2 B_Saspiration_index2 B_Sbehavior_index2	

		global cntrls_all_2 B_Sage B_Sgrade6 B_rural B_Scaste_sc B_Scaste_st B_Smuslim B_no_female_sib B_no_male_sib B_Sparent_stay ///	
			B_m_secondary B_m_parttime B_m_fulltime	B_Shouse_pukka_y B_Shouse_elec B_Sflush_toilet B_Snonflush_toilet ///
					B_Sown_house B_Phh_durables_1 B_Phh_durables_2 B_Phh_durables_7 B_Snewspaper_house B_Stap_water B_Phh_durables_16 ///
						B_Sefficacy_index2 B_Ssocial_scale B_Pgender_index2_impute B_q10_guest_teachr B_fulltime_teacher B_pct_female_teacher ///
							B_q13_counselor B_q18_pta_meet B_q22_library B_q22_toilets B_q22_electricity B_q22_avail_computers ///
								B_q22_avail_internet B_q22_sports_field B_q22_mid_meal B_q22_auditorium B_q22_avail_edusat B_q21_week1 ///
									B_q21_week6 B_coed Cfem_lit_rate Cmale_lit_rate Cfem_lab_part district_gender_1 district_gender_2 district_gender_3 district_gender_4 ///
										district_gender_5 district_gender_6 district_gender_7 district_gender_8 B_Sgender_index2 B_Saspiration_index2 B_Sbehavior_index2 
											/*${el_gender_flag} ${el_behavior_common_flag} ${el_aspiration_flag} ADDED AS APPROPRIATE BELOW*/

		global cntrls_all_3 B_Sage B_Sgrade6 B_rural B_Scaste_sc B_Scaste_st B_Smuslim B_no_female_sib B_no_male_sib B_Sparent_stay ///	
		 B_m_secondary B_m_parttime B_m_fulltime B_Shouse_pukka_y B_Shouse_elec B_Sflush_toilet B_Snonflush_toilet ///
			B_Sown_house B_Phh_durables_1 B_Phh_durables_2 B_Phh_durables_7 B_Snewspaper_house B_Stap_water B_Phh_durables_16 ///
				B_Sefficacy_index2 B_Ssocial_scale B_Pgender_index2_impute B_q10_guest_teachr B_fulltime_teacher B_pct_female_teacher ///
					B_q13_counselor B_q18_pta_meet B_q22_library B_q22_toilets B_q22_electricity B_q22_avail_computers ///
						B_q22_avail_internet B_q22_sports_field B_q22_mid_meal B_q22_auditorium B_q22_avail_edusat B_q21_week1 ///
							B_q21_week6 B_coed Cfem_lit_rate Cmale_lit_rate Cfem_lab_part district_gender_1 district_gender_2 district_gender_3 district_gender_4 ///
										district_gender_5 district_gender_6 district_gender_7 district_gender_8 B_Sgender_index2 B_Saspiration_index2 B_Sbehavior_index2 `missing_flags' 

											/*${el_gender_flag} ${el_behavior_common_flag} ${el_aspiration_flag} ADDED AS APPROPRIATE BELOW */

		

		*** removing controls for unimputed LASSO selection
		local cntrls $cntrls 
		local cntrls_all $cntrls_all										
		local cntrls_all_2 $cntrls_all_2
		local cntrls_all_3 $cntrls_all_3
		local removed_missing B_Pgender_index2_impute B_m_secondary B_Phh_durables_1 B_Phh_durables_2 B_Phh_durables_7 B_Phh_durables_16 B_q10_guest_teachr B_pct_female_teacher B_q21_week1 B_q21_week6 
		local removed_seema B_Sage B_no_female_sib B_no_male_sib B_Sparent_stay B_m_parttime B_m_fulltime

		global cntrls_all5a: list cntrls_all - removed_missing 
		global cntrls_all5b: list cntrls_all_2 - removed_missing 
		global cntrls_6: list cntrls - removed_missing 
		global cntrls_7 $cntrls_all_2 
		global cntrls_8 $cntrls_all5b 
		local cntrls_all5b $cntrls_all5b 
		local removed_baseline_index B_Sgender_index2 B_Sbehavior_index2 B_Saspiration_index2
		global cntrls_9: list cntrls_all5b - removed_baseline_index 

		***ADDING FLAGS TO REMOVE FOR NEW TABLES
		foreach var in B_Pgender_index2_impute B_m_secondary B_Phh_durables_1 B_Phh_durables_2 B_Phh_durables_7 B_Phh_durables_16 B_q10_guest_teachr B_pct_female_teacher B_q21_week1 B_q21_week6 {
			local removed_missing `removed_missing' `var'_flag
		}
		foreach var in B_Sage B_no_female_sib B_no_male_sib B_Sparent_stay B_m_parttime B_m_fulltime {
			local removed_seema `removed_seema' `var'_flag 
		}
		global cntrls_all_4: list cntrls_all_3 - removed_missing 
		global cntrls_all_6: list cntrls_all_3 - removed_seema 
		local cntrls_all_4 ${cntrls_all_4} 
		global cntrls_all_7: list cntrls_all_4 - removed_seema
		local removed_collinear B_Phh_durables_2_flag B_Phh_durables_7_flag B_Phh_durables_16_flag B_Scaste_st_flag B_Snonflush_toilet_flag B_q22_toilets_flag //removing one of each collinear pairing (only keeping one of durable flags)
		local cntrls_all_6 $cntrls_all_6 
		global cntrls_all_8: list cntrls_all_6 - removed_collinear

		*** have to remove variables with missing values or LASSO selection glitches; relevant for both and boys only selections (can't include baseline aspirations index or endline aspiration missing flags)
		if "`gender'" == "boys" | "`gender'" == "both" {

			local removed B_Saspiration_index2 ${el_aspiration_flag}
			foreach var in _std _all _all_1 _all_2 _all_5b _6 _7 _8 _9 _all_3 _all_4 _all_6 _all_7 _all_8 {
				local cntrls`var' ${cntrls`var'}
				global cntrls`var': list cntrls`var' - removed    
			}
		}

		*** remove imputed observations for each control where relevant ***
		if "`type'" == "all_5a" | "`type'" == "all_5b" | "`type'" == "_6" | "`type'" == "_9" {
			foreach var of varlist ${cntrls`i'} {
				cap confirm variable `var'_flag 
					if !_rc {
						keep if `var'_flag == 0
					}
			}
			global obsn_`type'`bg' = _N
		}

		**Gender Attitudes Index
		local cntrls`i' ${cntrls`i'} //have to redefine each time
		if "`type'" == "std" | "`type'" == "_6" {
			reg E_Sgender_index2 B_Sgender_index2 B_Sgender_index2_flag district_gender_* gender_grade_* ${el_gender_flag} if !mi(E_Steam_id) & attrition_el==0 , cluster(Sschool_id)
			predict E_Sgender_index2_rd, residuals
		}
		else if "`type'" == "all" | "`type'" == "all_5a" {
			reg E_Sgender_index2 ${el_gender_flag} if !mi(E_Steam_id) & attrition_el==0 , cluster(Sschool_id)
			predict E_Sgender_index2_rd, residuals
		}
		else if "`type'" == "all_1" {
			reg E_Sgender_index2 district_gender_* gender_grade_* ${el_gender_flag} if !mi(E_Steam_id) & attrition_el==0 , cluster(Sschool_id)
			predict E_Sgender_index2_rd, residuals
		}
		else if "`type'" == "_9" {
			gen E_Sgender_index2_rd = E_Sgender_index2
			*** adding relevant indice component missing flags
			local cntrls`i' ${cntrls`i'} B_Sgender_index2 ${el_gender_flag}
		}
		else {
			gen E_Sgender_index2_rd = E_Sgender_index2
			*** adding relevant indice component missing flags
			local cntrls`i' ${cntrls`i'} ${el_gender_flag}
		}

		lassoShooting E_Sgender_index2_rd `cntrls`i'', lasiter(1000) verbose(1) fdisplay(1)
		local ysel "`r(selected)'"
		lassoShooting B_treat `cntrls`i'', lasiter(1000) verbose(1) fdisplay(1)
		local xsel "`r(selected)'"

		local las_gender: list ysel | xsel
		local las_gender_flag
		display "`gender', `type', `type': `las_gender'"
		foreach var of varlist `las_gender' {
			cap confirm variable `var'_flag 
			if !_rc {
				local las_gender_flag `las_gender_flag' `var'_flag
			}
		}

		global ext_gender`bg'`i' `las_gender'
		global ext_gender_flag`bg'`i' `las_gender_flag'


		**Girls' Aspirations Index
		local cntrls`i' ${cntrls`i'} //have to redefine each time
		if "`gender'" != "boys" {
			if "`type'" == "std" | "`type'" == "all_6" {
				reg E_Saspiration_index2 B_Saspiration_index2 B_Saspiration_index2_flag district_gender_* gender_grade_* ${el_aspiration_flag} if B_Sgirl==1 & !mi(E_Steam_id) & attrition_el==0, cluster(Sschool_id)
				predict E_Saspiration_index2_rd, residuals
			}
			else if "`type'" == "all" | "`type'" == "all_5a" {
				reg E_Saspiration_index2 ${el_aspiration_flag} if !mi(E_Steam_id) & attrition_el==0 , cluster(Sschool_id) 
				predict E_Saspiration_index2_rd, residuals
			}
			else if "`type'" == "all_1" {
				reg E_Saspiration_index2 district_gender_* gender_grade_* ${el_aspiration_flag} if !mi(E_Steam_id) & attrition_el==0 , cluster(Sschool_id)
				predict E_Saspiration_index2_rd, residuals
			}
			else if "`type'" == "_9" {
				gen E_Saspiration_index2_rd = E_Saspiration_index2
				*** adding relevant indice component missing flags
				local cntrls`i' ${cntrls`i'} ${el_aspiration_flag} B_Saspiration_index2
			}
			else  {
				gen E_Saspiration_index2_rd = E_Saspiration_index2
				*** adding relevant indice component missing flags
				local cntrls`i' ${cntrls`i'} ${el_aspiration_flag}
			}

			lassoShooting E_Saspiration_index2_rd `cntrls`i'', lasiter(1000) verbose(1) fdisplay(1)
			local ysel "`r(selected)'"
			lassoShooting B_treat `cntrls`i'', lasiter(1000) verbose(1) fdisplay(1)
			local xsel "`r(selected)'"

			local las_aspiration: list ysel | xsel
			local las_aspiration_flag
			display "`gender', `type': `las_aspiration'"
			foreach var of varlist `las_aspiration' {
				cap confirm variable `var'_flag 
				if !_rc {
					local las_aspiration_flag `las_aspiration_flag' `var'_flag
				}
			}

			global ext_aspiration`bg'`i' `las_aspiration'
			global ext_aspiration_flag`bg'`i' `las_aspiration_flag'
		}


			

		** Behavior Index
		local cntrls`i' ${cntrls`i'} //have to redefine each time
		if "`type'" == "std" | "`type'" == "all_6" {
			reg E_Sbehavior_index2 B_Sbehavior_index2 B_Sbehavior_index2_flag B_Sbehavior_index2_m district_gender_* gender_grade_* ${el_behavior_common_flag} if !mi(E_Steam_id) & attrition_el==0, cluster(Sschool_id)
			predict E_Sbehavior_index2_rd, residuals
		}
		else if "`type'" == "all" | "`type'" == "all_5a" {
			reg E_Sbehavior_index2 ${el_behavior_common_flag} if !mi(E_Steam_id) & attrition_el==0 , cluster(Sschool_id) 
			predict E_Sbehavior_index2_rd, residuals
		}
		else if "`type'" == "all_1" {
			reg E_Sbehavior_index2 district_gender_* gender_grade_* ${el_behavior_common_flag} if !mi(E_Steam_id) & attrition_el==0 , cluster(Sschool_id)
			predict E_Sbehavior_index2_rd, residuals
		}
		else if "`type'" == "_9"  {
			gen E_Sbehavior_index2_rd = E_Sbehavior_index2
			*** adding relevant indice component missing flags
			local cntrls`i' ${cntrls`i'} ${el_behavior_common_flag} B_Sbehavior_index2
		}
		else  {
			gen E_Sbehavior_index2_rd = E_Sbehavior_index2
			*** adding relevant indice component missing flags
			local cntrls`i' ${cntrls`i'} ${el_behavior_common_flag}
		}


		lassoShooting E_Sbehavior_index2_rd `cntrls`i'', lasiter(1000) verbose(1) fdisplay(1)
		local ysel "`r(selected)'"
		lassoShooting B_treat `cntrls`i'', lasiter(1000) verbose(1) fdisplay(1)
		local xsel "`r(selected)'"


		local las_behavior: list ysel | xsel
		display "`gender', `type': `las_behavior'"
		local las_behavior_flag
		foreach var in `las_behavior' {
			cap confirm variable `var'_flag 
			if !_rc {
				local las_behavior_flag `las_behavior_flag' `var'_flag
			}
		}

		global ext_behavior_common`bg'`i' `las_behavior'
		global ext_behavior_common_flag`bg'`i' `las_behavior_flag'

		** Scholarship index
		local cntrls`i' ${cntrls`i'} //have to redefine each time
		 if "`gender'" != "boys" {
			if "`type'" == "std" | "`type'" == "_6" {
				reg E2_Sscholar_index2 district_gender_* gender_grade_* if !mi(E2_Steam_id) & attrition==0, cluster(Sschool_id)
				predict E2_Sscholar_index2_rd, residuals
			}
			else if "`type'" == "all" | "`type'" == "all_2" | "`type'" == "all_3" {
				gen E2_Sscholar_index2_rd = E2_Sscholar_index2
			}
			else if "`type'" == "all_1" {
				reg E2_Sscholar_index2 district_gender_* gender_grade_* if !mi(E_Steam_id) & attrition_el==0 , cluster(Sschool_id)
				predict E2_Sscholar_index2_rd, residuals
			}	
			else {
				gen E2_Sscholar_index2_rd = E2_Sscholar_index2
			}

			lassoShooting E2_Sscholar_index2_rd `cntrls`i'', lasiter(1000) verbose(1) fdisplay(1)
			local ysel "`r(selected)'"
			lassoShooting B_treat `cntrls`i'', lasiter(1000) verbose(1) fdisplay(1)
			local xsel "`r(selected)'"

			local las_scholar: list ysel | xsel  
			display "`gender', `type': `las_scholar'"
			local las_scholar_flag
			foreach var of varlist `las_scholar' {
				cap confirm variable `var'_flag 
				if !_rc {
					local las_scholar_flag `las_scholar_flag' `var'_flag
				}
			}

			global ext_scholar`bg'`i' `las_scholar'
			global ext_scholar_flag`bg'`i' `las_scholar_flag'

		}
			
		** Petition index
		local cntrls`i' ${cntrls`i'} //have to redefine each time
		if "`type'" == "std" | "`type'" == "_6" {
			reg E2_Spetition_index2 district_gender_* gender_grade_* if !mi(E2_Steam_id) & attrition==0, cluster(Sschool_id)
			predict E2_Spetition_index2_rd, residuals
		}
		else if "`type'" == "all" | "`type'" == "all_2" | "`type'" == "all_3" {
			gen E2_Spetition_index2_rd = E2_Spetition_index2
		}
		else if "`type'" == "all_1" {
			reg E2_Spetition_index2 district_gender_* gender_grade_* if !mi(E_Steam_id) & attrition_el==0 , cluster(Sschool_id)
			predict E2_Spetition_index2_rd, residuals
		}

		else {
			gen E2_Spetition_index2_rd = E2_Spetition_index2
		}	

		lassoShooting E2_Spetition_index2_rd `cntrls`i'', lasiter(1000) verbose(1) fdisplay(1)
		local ysel "`r(selected)'"
		lassoShooting B_treat `cntrls`i'', lasiter(1000) verbose(1) fdisplay(1)
		local xsel "`r(selected)'"

		local las_petition: list ysel | xsel 
		display "`gender', `type': `las_petition'"
		local las_petition_flag
		foreach var in `las_petition' {
			cap confirm variable `var'_flag 
			if !_rc {
				local las_petition_flag `las_petition_flag' `var'_flag
			}
		}

		global ext_petition`bg'`i' `las_petition'
		global ext_petition_flag`bg'`i' `las_petition_flag'
		
		/* commenting out because we don't use these extended controls
		** Girl's education attainment index
		if "`gender'" != "boys" {
			if "`type'" == "std" {
				reg E2_Seduc_attain_index2_g gender_grade_* district_gender_*, cluster(Sschool_id)
				predict E2_Seduc_attain_index2_g_rd, residuals
			}
			else if "`type'" == "all" | "`type'" == "all_2" | "`type'" == "all_3" {
				gen E2_Seduc_attain_index2_g_rd = E2_Seduc_attain_index2_g
			}
			else if "`type'" == "all_1" {
				reg E2_Seduc_attain_index2_g district_gender_* gender_grade_* if !mi(E_Steam_id) & attrition_el==0 , cluster(Sschool_id)
				predict E2_Seduc_attain_index2_g_rd, residuals
			}		

			lassoShooting E2_Seduc_attain_index2_g_rd ${cntrls`i'} if B_Sgirl==1, lasiter(1000) verbose(1) fdisplay(1)
			local ysel "`r(selected)'"
			lassoShooting B_treat ${cntrls`i'} if B_Sgirl==1, lasiter(1000) verbose(1) fdisplay(1)
			local xsel "`r(selected)'"
			
			local las_educattain: list ysel | xsel 
			display "`gender', `type': `las_educattain'"
			local las_educattain_flag
			foreach var of varlist `las_educattain' {
				cap confirm variable `var'_flag 
				if !_rc {
					local las_educattain_flag `las_educattain_flag' `var'_flag
				}
			}

			global ext_educ_attain`bg'`i' `las_educattain'
			global ext_educ_attain_flag`bg'`i' `las_educattain_flag'

		}

		** Fertility and Marraige Aspirations index
		if "`gender'" != "boys" {
			if "`type'" == "std" {
				reg E2_Smar_fert_asp_index2 gender_grade_* district_gender_* if B_Sgirl==1, cluster(Sschool_id)
				predict E2_Smar_fert_asp_index2_rd, residuals
			}
			else if "`type'" == "all" | "`type'" == "all_2" | "`type'" == "all_3" {
				gen E2_Smar_fert_asp_index2_rd = E2_Smar_fert_asp_index2
			}
			else if "`type'" == "all_1" {
				reg E2_Smar_fert_asp_index2 district_gender_* gender_grade_* if !mi(E_Steam_id) & attrition_el==0 , cluster(Sschool_id)
				predict E2_Smar_fert_asp_index2_rd, residuals
			}

			lassoShooting E2_Smar_fert_asp_index2_rd ${cntrls`i'} if B_Sgirl==1, lasiter(1000) verbose(1) fdisplay(1)
			local ysel "`r(selected)'"
			lassoShooting B_treat ${cntrls`i'} if B_Sgirl==1, lasiter(1000) verbose(1) fdisplay(1)
			local xsel "`r(selected)'"

			local las_mar_fert_asp: list ysel | xsel
			display "`gender', `type': `las_mar_fert_asp'"
			local las_mar_fert_asp_flag
			foreach var of varlist `las_mar_fert_asp' {
				cap confirm variable `var'_flag 
				if !_rc {
					local las_mar_fert_asp_flag `las_mar_fert_asp_flag' `var'_flag
				}
			}

			global ext_mar_fert_asp`bg'`i' `las_mar_fert_asp'
			global ext_mar_fert_asp_flag`bg'`i' `las_mar_fert_asp_flag'
		}

		*/
			
	}

}

** Girl's harassment index
** Boy's harassment index

******************************** EXTENDED CONTROLS *****************************
global effic B_Ssatisfy_y B_Senjoy_learn_y B_Sgood_qlty_y B_Sable_do_most_y B_Smake_comm_y ///
	B_Sfull_idea_y B_Ssocial_prob_y B_Sparent_help_y B_Sdefini_opinion_y

global effic_flag B_Ssatisfy_y_flag B_Senjoy_learn_y_flag B_Sgood_qlty_y_flag B_Sable_do_most_y_flag ///
 B_Smake_comm_y_flag B_Sfull_idea_y_flag B_Ssocial_prob_y_flag B_Sparent_help_y_flag B_Sdefini_opinion_y_flag

 global social B_Shard_ifnot_enco_n B_Sfeel_resent_n B_Slittle_ability_n B_Srebel_against_n ///
		B_Sgood_listen B_Socca_advan_n B_Sadmit_mistake B_Ssome_forgive_n ///
		B_Scourteous B_Sirked B_Sjealous_n B_Sirritated_n B_Sdeliberately_hurt_n
	
global social_flag B_Shard_ifnot_enco_n_flag B_Sfeel_resent_n_flag B_Slittle_ability_n_flag ///
	B_Srebel_against_n_flag B_Sgood_listen_flag B_Socca_advan_n_flag B_Sadmit_mistake_flag B_Ssome_forgive_n_flag ///
	B_Scourteous_flag B_Sirked_flag B_Sjealous_n_flag B_Sirritated_n_flag B_Sdeliberately_hurt_n_flag
	
global parent B_P_woman_role_n B_P_man_final_deci_n B_P_woman_tol_viol_n B_P_wives_less_edu_n ///
	B_P_boy_more_opps_n B_P_equal_opps_y B_P_girl_allow_study_y B_P_similar_right_y B_P_elect_woman_y

global parent_flag B_P_woman_role_n_flag B_P_man_final_deci_n_flag B_P_woman_tol_viol_n_flag B_P_wives_less_edu_n_flag ///
	B_P_boy_more_opps_n_flag B_P_equal_opps_y_flag B_P_girl_allow_study_y_flag B_P_similar_right_y_flag B_P_elect_woman_y_flag

global ext_behavior_girl $ext_behavior_g

global ext_behavior_girl_flag $ext_behavior_flag_g

global ext_behavior_boy_flag $ext_behavior_b

global ext_behavior_boy_flag $ext_behavior_flag_b

global ext_behavior_common $ext_behavior

global ext_behavior_common_flag $ext_behavior_common_flag

***REDEFINING GLOBAL LISTS (WE CUT ASPIRATIONS STUFF FOR BOYS/BOTH GENDERS)***

global cntrls_all B_Sage B_Sgrade6 B_rural B_Scaste_sc B_Scaste_st B_Smuslim B_no_female_sib B_no_male_sib B_Sparent_stay ///	
		 B_m_secondary B_m_parttime B_m_fulltime B_Shouse_pukka_y B_Shouse_elec B_Sflush_toilet B_Snonflush_toilet ///
			B_Sown_house B_Phh_durables_1 B_Phh_durables_2 B_Phh_durables_7 B_Snewspaper_house B_Stap_water B_Phh_durables_16 ///
				B_Sefficacy_index2 B_Ssocial_scale B_Pgender_index2_impute B_q10_guest_teachr B_fulltime_teacher B_pct_female_teacher ///
					B_q13_counselor B_q18_pta_meet B_q22_library B_q22_toilets B_q22_electricity B_q22_avail_computers ///
						B_q22_avail_internet B_q22_sports_field B_q22_mid_meal B_q22_auditorium B_q22_avail_edusat B_q21_week1 ///
							B_q21_week6 B_coed Cfem_lit_rate Cmale_lit_rate Cfem_lab_part district_gender_1 district_gender_2 district_gender_3 district_gender_4 district_gender_5 district_gender_6 ///
								district_gender_7 district_gender_8 gender_grade_1 gender_grade_2 gender_grade_3 gender_grade_4 B_Sgender_index2 B_Saspiration_index2 B_Sbehavior_index2 
						 

global cntrls_all_1 B_Sage B_Sgrade6 B_rural B_Scaste_sc B_Scaste_st B_Smuslim B_no_female_sib B_no_male_sib B_Sparent_stay ///	
 B_m_secondary B_m_parttime B_m_fulltime B_Shouse_pukka_y B_Shouse_elec B_Sflush_toilet B_Snonflush_toilet ///
	B_Sown_house B_Phh_durables_1 B_Phh_durables_2 B_Phh_durables_7 B_Snewspaper_house B_Stap_water B_Phh_durables_16 ///
		B_Sefficacy_index2 B_Ssocial_scale B_Pgender_index2_impute B_q10_guest_teachr B_fulltime_teacher B_pct_female_teacher ///
			B_q13_counselor B_q18_pta_meet B_q22_library B_q22_toilets B_q22_electricity B_q22_avail_computers ///
				B_q22_avail_internet B_q22_sports_field B_q22_mid_meal B_q22_auditorium B_q22_avail_edusat B_q21_week1 ///
					B_q21_week6 B_coed Cfem_lit_rate Cmale_lit_rate Cfem_lab_part B_Sgender_index2 B_Saspiration_index2 B_Sbehavior_index2	

global cntrls_all_2 B_Sage B_Sgrade6 B_rural B_Scaste_sc B_Scaste_st B_Smuslim B_no_female_sib B_no_male_sib B_Sparent_stay ///	
	B_m_secondary B_m_parttime B_m_fulltime	B_Shouse_pukka_y B_Shouse_elec B_Sflush_toilet B_Snonflush_toilet ///
			B_Sown_house B_Phh_durables_1 B_Phh_durables_2 B_Phh_durables_7 B_Snewspaper_house B_Stap_water B_Phh_durables_16 ///
				B_Sefficacy_index2 B_Ssocial_scale B_Pgender_index2_impute B_q10_guest_teachr B_fulltime_teacher B_pct_female_teacher ///
					B_q13_counselor B_q18_pta_meet B_q22_library B_q22_toilets B_q22_electricity B_q22_avail_computers ///
						B_q22_avail_internet B_q22_sports_field B_q22_mid_meal B_q22_auditorium B_q22_avail_edusat B_q21_week1 ///
							B_q21_week6 B_coed Cfem_lit_rate Cmale_lit_rate Cfem_lab_part district_gender_1 district_gender_2 district_gender_3 district_gender_4 ///
								district_gender_5 district_gender_6 district_gender_7 district_gender_8 B_Sgender_index2 B_Saspiration_index2 B_Sbehavior_index2 ///
									${el_gender_flag} ${el_behavior_common_flag} ${el_aspiration_flag} 

global cntrls_all_3 B_Sage B_Sgrade6 B_rural B_Scaste_sc B_Scaste_st B_Smuslim B_no_female_sib B_no_male_sib B_Sparent_stay ///	
 B_m_secondary B_m_parttime B_m_fulltime B_Shouse_pukka_y B_Shouse_elec B_Sflush_toilet B_Snonflush_toilet ///
	B_Sown_house B_Phh_durables_1 B_Phh_durables_2 B_Phh_durables_7 B_Snewspaper_house B_Stap_water B_Phh_durables_16 ///
		B_Sefficacy_index2 B_Ssocial_scale B_Pgender_index2_impute B_q10_guest_teachr B_fulltime_teacher B_pct_female_teacher ///
			B_q13_counselor B_q18_pta_meet B_q22_library B_q22_toilets B_q22_electricity B_q22_avail_computers ///
				B_q22_avail_internet B_q22_sports_field B_q22_mid_meal B_q22_auditorium B_q22_avail_edusat B_q21_week1 ///
					B_q21_week6 B_coed Cfem_lit_rate Cmale_lit_rate Cfem_lab_part district_gender_1 district_gender_2 district_gender_3 district_gender_4 ///
								district_gender_5 district_gender_6 district_gender_7 district_gender_8 B_Sgender_index2 B_Saspiration_index2 B_Sbehavior_index2 ///
									${el_gender_flag} ${el_behavior_common_flag} ${el_aspiration_flag} `missing_flags'


local cntrls $cntrls 
local cntrls_all $cntrls_all										
local cntrls_all_2 $cntrls_all_2
local cntrls_all_3 $cntrls_all_3
local removed_missing B_Pgender_index2_impute B_m_secondary B_Phh_durables_1 B_Phh_durables_2 B_Phh_durables_7 B_Phh_durables_16 B_q10_guest_teachr B_pct_female_teacher B_q21_week1 B_q21_week6 
global cntrls_all5a: list cntrls_all - removed_missing 
global cntrls_all5b: list cntrls_all_2 - removed_missing 
global cntrls_6: list cntrls - removed_missing 
global cntrls_7 $cntrls_all_2 
global cntrls_8 $cntrls_all5b 
local cntrls_all5b $cntrls_all5b 
//local removed_baseline_index B_Sgender_index2 B_Sbehavior_index2 B_Saspiration_index2
global cntrls_9 $cntrls_all5b 

***ADDING FLAGS TO REMOVE FOR NEW TABLES
foreach var in B_Pgender_index2_impute B_m_secondary B_Phh_durables_1 B_Phh_durables_2 B_Phh_durables_7 B_Phh_durables_16 B_q10_guest_teachr B_pct_female_teacher B_q21_week1 B_q21_week6 {
	local removed_missing `removed_missing' `var'_flag
}
foreach var in B_Sage B_no_female_sib B_no_male_sib B_Sparent_stay B_m_parttime B_m_fulltime {
	local removed_seema `removed_seema' `var'_flag 
}
global cntrls_all_4: list cntrls_all_3 - removed_missing 
global cntrls_all_6: list cntrls_all_3 - removed_seema 
local cntrls_all_4 ${cntrls_all_4} 
global cntrls_all_7: list cntrls_all_4 - removed_seema
local removed_collinear B_Phh_durables_2_flag B_Phh_durables_7_flag B_Phh_durables_16_flag B_Scaste_st_flag B_Snonflush_toilet_flag B_q22_toilets_flag //removing one of each collinear pairing (only keeping one of durable flags)
local cntrls_all_6 $cntrls_all_6 
global cntrls_all_8: list cntrls_all_6 - removed_collinear
local remove_elcomponents ${el_gender_flag} ${el_behavior_common_flag} ${el_aspiration_flag} //removing for table space
local cntrls_all_8 $cntrls_all_8 
global cntrls_all_8: list cntrls_all_8 - remove_elcomponents 

*** adding for seema a loop removing missing flags that only represent the one school without baseline data (only doing 5b, the eventual specification)
local overall_flags_toremove
cap log close
log using "$ad_hoc/missing_flags_toremove", replace
qui log off
foreach var of varlist `missing_flags' {
	count if `var' == 1
	local count_1 = `r(N)'
	count if `var' == 1 & Sschool_id == 2711
	local count_2 = `r(N)'
	if `count_1' == `count_2' {
		local overall_flags_toremove `overall_flags_toremove' `var'
	}
}
qui log on 
di "LASSO flags that are only 1 at school 2711:"
di "`overall_flags_toremove'"
qui log off 
log close
/*
*** removing variables flags without corresponding variables in _all3 (to make _all3a) ***
foreach gender in girls boys both {
	local bg
	use "$finaldata", clear
	if "`gender'" == "girls" {
		local bg "_g"
		//keep if B_Sgirl == 1
	}
	else if "`gender'" == "boys" {
		local bg "_b"
		//keep if B_Sgirl == 0
	}
	foreach index in gender behavior_common aspiration scholar petition {
		if "`gender'" != "girls" & ("`index'" == "aspiration" | "`index'" == "scholar") {
			continue 
		}
		local flags_toremove  
		foreach var of varlist ${ext_`index'`bg'_all_3} {
			if strpos("`var'", "_flag") {
				local temp_var = subinstr("`var'", "_flag", "", .)
				if !strpos("${ext_`index'`bg'_all5b}", " `temp_var' ") {
					local flags_toremove `flags_toremove' `var' 
				}
			}
		}
		local temp_list ${ext_`index'`bg'_all_3}
		global ext_`index'`bg'_all_3a: list temp_list - flags_toremove

	}
}

/*
foreach gender in girls boys both {
	local bg
	use "$finaldata", clear
	if "`gender'" == "girls" {
		local bg "_g"
		//keep if B_Sgirl == 1
	}
	else if "`gender'" == "boys" {
		local bg "_b"
		//keep if B_Sgirl == 0
	}
	foreach index in gender behavior_common aspiration scholar petition {
		if "`gender'" != "girls" & ("`index'" == "aspiration" | "`index'" == "scholar") {
			continue 
		}
		local removed_5b_`index'`bg'
		foreach var of varlist ${ext_`index'_flag`bg'_all5b} {
			count if `var' == 1
			local count_1 = `r(N)'
			count if `var' == 1 & Sschool_id == 2711
			local count_2 = `r(N)'
			if `count_1' == `count_2' {
				local removed_5b_`index'`bg' `removed_5b_`index'`bg'' `var' 
			}
		}
	} 
}


log using "$ad_hoc/missing_flags_removed", replace 
foreach gender in girls boys both {
	local bg
	use "$finaldata", clear
	if "`gender'" == "girls" {
		local bg "_g"
		//keep if B_Sgirl == 1
	}
	else if "`gender'" == "boys" {
		local bg "_b"
		//keep if B_Sgirl == 0
	}
	foreach index in gender behavior_common aspiration scholar petition {
		if "`gender'" != "girls" & ("`index'" == "aspiration" | "`index'" == "scholar") {
			continue 
		}
		local temp_flag_list ${ext_`index'_flag`bg'_all5b}
		local temp_removed_list `removed_5b_`index'`bg''
		qui log on 
		di "`gender', `index': `removed_5b_`index'`bg''"
		qui log off 
		global ext_`index'_flag`bg'_all5b: list temp_flag_list - temp_removed_list
	}
}

log close
*/






/*
	*extended controls

	global ext_gender B_Sage B_Scaste_sc B_no_male_sib B_m_secondary B_Pgender_index2_impute B_Ssocial_scale Cfem_lit_rate B_Sefficacy_index2 B_Phh_durables_7

	global ext_gender_flag B_Sage_flag B_Scaste_sc_flag B_m_secondary_flag B_Pgender_index2_flag 
	
	global ext_aspiration B_Sage B_no_male_sib B_m_secondary B_Shouse_pukka_y B_Sflush_toilet B_Sefficacy_index2  

	global ext_aspiration_flag B_Sage_flag B_m_secondary_flag B_Shouse_pukka_y_flag B_Sflush_toilet_flag 

	global ext_behavior_girl B_Sage B_no_male_sib B_Shouse_pukka_y B_Sefficacy_index2 B_Ssocial_scale 

	global ext_behavior_girl_flag B_Sage_flag B_Shouse_pukka_y_flag 

	global ext_behavior_boy 		

	global ext_behavior_boy_flag	

	global ext_behavior_common Cmale_lit_rate

	global ext_behavior_common_flag 
	
	global ext_scholar B_Sage B_pct_female_teacher  

	global ext_scholar_flag B_Sage_flag B_pct_female_teacher_flag 
	
	global ext_petition	

	global ext_petition_flag	
	
	global ext_educ_attain    B_Scaste_sc  B_no_female_sib B_no_male_sib B_Sparent_stay B_Sage B_Shouse_pukka_y B_Phh_durables_7 B_Sefficacy_index2
	
	global ext_educ_attain_flag B_Scaste_sc_flag B_Sparent_stay_flag B_Sage_flag B_Shouse_pukka_y_flag B_Phh_durables_7_flag
	
	global ext_mar_fert_asp   B_no_male_sib B_Sage B_Sefficacy_index2
	
	global ext_mar_fert_asp_flag B_Sage_flag


