****************************************************************************
*
*	 Project: Breakthrough (BT)
*
*	 Purpose: Labelling variables and values of endline
*
****************************************************************************

	* use raw dataset (no PII)	

	local repeat_groups_csv1 "new_sibling"
	local repeat_groups_stata1 "new_sibling"
	local repeat_groups_short_stata1 "new_sibling"
	local note_fields1 "id_match_note1 id_match_note2 student_name_note student_common_name_note father_name_note mother_name_note gender_note religion_note caste_note info1 info4 info5 info6 info7 info8 info9"
	local note_fields2 "info10 info11 info12 sib_no1_note sib_gender1_note sib_relation1_note sib_age1_new sib_no2_note sib_gender2_note sib_relation2_note sib_age2_new sib_no3_note sib_gender3_note sib_relation3_note"
	local note_fields3 "sib_age3_new sib_no4_note sib_gender4_note sib_relation4_note sib_age4_new sib_no5_note sib_gender5_note sib_relation5_note sib_age5_new sib_no6_note sib_gender6_note sib_relation6_note sib_age6_new"
	local note_fields4 "sib_no7_note sib_gender7_note sib_relation7_note sib_age7_new sib_no8_note sib_gender8_note sib_relation8_note sib_age8_new sib_no9_note sib_gender9_note sib_relation9_note sib_age9_new sib_no10_note"
	local note_fields5 "sib_gender10_note sib_relation10_note sib_age10_new sib_no11_note sib_gender11_note sib_relation11_note sib_age11_new new_sib_number* info13 end_time"
	local text_fields1 "deviceid subscriberid simid devicephonenum username duration caseid child_id_sub1 child_id_sub2 student_name student_name_other_yes student_common_name father_name mother_name gender gender_label"
	local text_fields2 "religion religion_label caste caste_label random1 random2 random3 signature school_dropout school_dropout_reason_other section_enrolled extra_activities tease_girls female_foeticide_reason"
	local text_fields3 "female_foeticide_reason_other purp_mobile what_tv issues_session issues_session_other address address_new mobile_no email_id_new relation_relative relation_relative_label relative_address"
	local text_fields4 "relative_address_new relative_number relative_number_new relative_alternative_numb relative_alternative_numb_new address_mother address_father father_no mother_no guardian_address guardian_address_new"
	local text_fields5 "guardian_number guardian_number_new dob_month dob_year birth_place birth_place_label father_birth_place father_birth_place_label mother_birth_place mother_birth_place_label sib_name1 sib_name2"
	local text_fields6 "sib_name3 sib_name4 sib_name5 sib_name6 sib_name7 sib_name8 sib_name9 sib_name10 sib_name11 sib_no1 sib_name1_new sib_gender1 sib_gender1_label sib_relation1 sib_relation1_label sib_age1 sib_age1_3"
	local text_fields7 "sib_no2 sib_name2_new sib_gender2 sib_gender2_label sib_relation2 sib_relation2_label sib_age2 sib_age2_3 sib_no3 sib_name3_new sib_gender3 sib_gender3_label sib_relation3 sib_relation3_label sib_age3"
	local text_fields8 "sib_age3_3 sib_no4 sib_name4_new sib_gender4 sib_gender4_label sib_relation4 sib_relation4_label sib_age4 sib_age4_3 sib_no5 sib_name5_new sib_gender5 sib_gender5_label sib_relation5"
	local text_fields9 "sib_relation5_label sib_age5 sib_age5_3 sib_no6 sib_name6_new sib_gender6 sib_gender6_label sib_relation6 sib_relation6_label sib_age6 sib_age6_3 sib_no7 sib_name7_new sib_gender7 sib_gender7_label"
	local text_fields10 "sib_relation7 sib_relation7_label sib_age7 sib_age7_3 sib_no8 sib_name8_new sib_gender8 sib_gender8_label sib_relation8 sib_relation8_label sib_age8 sib_age8_3 sib_no9 sib_name9_new sib_gender9"
	local text_fields11 "sib_gender9_label sib_relation9 sib_relation9_label sib_age9 sib_age9_3 sib_no10 sib_name10_new sib_gender10 sib_gender10_label sib_relation10 sib_relation10_label sib_age10 sib_age10_3 sib_no11"
	local text_fields12 "sib_name11_new sib_gender11 sib_gender11_label sib_relation11 sib_relation11_label sib_age11 sib_age11_3 sib* new_sib_name* instancename"


	* drop extra table-list columns
	cap drop reserved_name_for_field_*
	cap drop generated_table_list_lab*


* label variables

	label variable key "Unique submission ID"
	cap label variable formdef_version "Form version used on device"


	label variable team_id "Team ID"
	note team_id: "Team ID"

	label variable surveyor_id "Surveyor ID"
	note surveyor_id: "Surveyor ID"

	label variable district "District"
	note district: "District"
	label define district 1 "Panipat" 2 "Sonipat" 3 "Rohtak" 4 "Jhajjar"
	label values district district

	label variable school_id "School ID"
	note school_id: "School ID"

	label variable school_id_1 "School ID again"
	note school_id_1: "School ID again"

	label variable child_id "Student ID"
	note child_id: "Student ID"

	label variable child_id_1 "Student ID again"
	note child_id_1: "Student ID again"
	
	label variable child_id_sub1 "Child ID - District ID check"
	note child_id_sub1: "Child ID - District ID check"
	
	label variable child_id_sub2 "Child ID - School ID check"
	note child_id_sub1: "Child ID - School ID check"
	
	label variable gender "Gender"
	note gender: "Gender"
	recode gender (1=0) (2=1)
	label define gender 0 "Male" 1 "Female"
	label values gender gender
	
	label variable religion "Religion"
	note religion: "Religion"
	label define religion 1 "Hindu" 2 "Muslim" 3 "Christian" 4 "Sikh" 5 "Jain" 6 "Buddhist"
	label values religion religion
	
	label variable caste "Caste"
	note caste: "Caste"
	recode caste (18=-999)
	label define caste 16 "SC" 17 "ST" -999 "Don't know" 19 "Don't have caste division in my religion" 20 "Other" 21 "General" 22 "BCA" 23 "BCB"
	label values caste caste

	label variable random1 "Random variable generated - 1"
	note random1: "Random variable generated - 1"

	label variable random2 "Random variable generated - 2"
	note random2: "Random variable generated - 2"
	
	label variable random3 "Random variable generated - 3"
	note random3: "Random variable generated - 3"

	
	label variable student_present "Is the student present?"
	note student_present: "Is the student present?"
	label define student_present 1 "Yes" 0 "No" -998 "Refuse"
	label values student_present student_present

	label variable parent_consent "Has the parent given consent? (check from tracking sheet)"
	note parent_consent: "Has the parent given consent? (check from tracking sheet)"
	label define parent_consent 1 "Yes" 0 "No" -998 "Refuse"
	label values parent_consent parent_consent

	label variable student_consent "Has the student given consent?"
	note student_consent: "Has the student given consent?"
	label define student_consent 1 "Yes" 0 "No" -998 "Refuse"
	label values student_consent student_consent

	label variable signature "Take student's signature here"
	note signature: "Take student's signature here"

	label variable disability "Do you have any disability? (To be observed, not to be asked)"
	note disability: "Do you have any disability? (To be observed, not to be asked)"
	label define disability 1 "No  disability" 2 "Physically handicapped" 3 "Deaf" 4 "Dumb" 5 "Mentally Challenged" 6 "Blind" -999 "Don't know" -998 "Refuse"
	label values disability disability
	
	label variable age "What is your age?"
	note age: "What is your age?"

	label variable father_occupation "What is your father's occupation?"
	note father_occupation: "What is your father's occupation?"
	label define father_occupation 1 "AGRI (L) - Agriculture work in land:" 2 "AGRI - Agriculture work:" 3 "INDS - Industry/Mill/Factory:" 4 "BUSI - Business:" 5 "TRANS - Transport:" 6 "CONSTR - Construction work:" 7 "PROFE - Professionals:" 8 "SERV - Professionals (Services):" 9 "OTHR (PR) - Other Professions" 10 "OTHR - Others" 11 "NTHN - No source of income" -999 "Don't know" -998 "Refuse"
	label values father_occupation father_occupation

	label variable mother_occupation "What is your mother's occupation?"
	note mother_occupation: "What is your mother's occupation?"
	label define mother_occupation 1 "AGRI (L) - Agriculture work in land:" 2 "AGRI - Agriculture work:" 3 "INDS - Industry/Mill/Factory:" 4 "BUSI - Business:" 5 "TRANS - Transport:" 6 "CONSTR - Construction work:" 7 "PROFE - Professionals:" 8 "SERV - Professionals (Services):" 9 "OTHR (PR) - Other Professions" 10 "OTHR - Others" 11 "NTHN - No source of income" -999 "Don't know" -998 "Refuse"
	label values mother_occupation mother_occupation

	label variable school_enrolled "Which school are you enrolled in? (Do not read the options out loud)"
	note school_enrolled: "Which school are you enrolled in? (Do not read the options out loud)"
	label define school_enrolled 1 "Government school in same village" 2 "Private school in same village" 3 "Government school in another village" 4 "Private school in another village" 5 "Open School" 6 "I don't go to school" -999 "Don't know" -998 "Refuse"
	label values school_enrolled school_enrolled
	
	label variable school_dropout "Why did you stop going to school?"
	note school_dropout: "Why did you stop going to school? (Do not read the options out loud)"
	
	label variable school_dropout_1 "Why did you stop going to school? - I dont like studying"
	note school_dropout_1: "Why did you stop going to school? - I dont like studying"
	
	label variable school_dropout_2 "Why did you stop going to school? - Financial problem "
	note school_dropout_2: "Why did you stop going to school? - Financial problem"
	
	label variable school_dropout_3 "Why did you stop going to school? - Family member does not approve"
	note school_dropout_3: "Why did you stop going to school? - Family member does not approve"
	
	label variable school_dropout_4 "Why did you stop going to school? - Required for hh work"
	note school_dropout_4: "Why did you stop going to school? - Required for hh work"
	
	label variable school_dropout_5 "Why did you stop going to school? - Required for work on farm/family business"
	note school_dropout_5: "Why did you stop going to school? - Required for work on farm/family business"
	
	label variable school_dropout_6 "Why did you stop going to school? - Poor quality and lack of facilities for education"
	note school_dropout_6: "Why did you stop going to school? - Poor quality and lack of facilities for education"
	
	label variable school_dropout_7 "Why did you stop going to school? - Not safe to send boys/girls"
	note school_dropout_7: "Why did you stop going to school? - Not safe to send boys/girls"
	
	label variable school_dropout_8 "Why did you stop going to school? - Illness or death of family member"
	note school_dropout_8: "Why did you stop going to school? - Illness or death of family member"

	label variable school_dropout_9 "Why did you stop going to school? - Any other reason, specify"
	note school_dropout_9: "Why did you stop going to school? - Any other reason, specify"
	
	label variable school_dropout__999 "Why did you stop going to school? - Dont know"
	note school_dropout__999: "Why did you stop going to school? - Dont know"
	
	label variable school_dropout__998 "Why did you stop going to school? - Refuse"
	note school_dropout__998: "Why did you stop going to school? - Refuse"
	
	label define dropout 1 "Yes" 0 "No"
	label values school_dropout_1 school_dropout_2 school_dropout_3 school_dropout_4 school_dropout_5 school_dropout_6 school_dropout_7 school_dropout_8 school_dropout_9 school_dropout__999 school_dropout__998 dropout
	
	label variable school_dropout_familymember "Which family member disapprove of you going to school?"
	note school_dropout_familymember: "Which family member disapprove of you going to school?( Do not read the options out loud)"
	label define school_dropout_familymember 1 "Mother" 2 "Father" 3 "Paternal Grandfather" 4 "Paternal Grandmother" 5 "Maternal Grandfather" 6 "Maternal Grandmother" 7 "Uncle" 8 "Aunt" 9 "Brother" 10 "Sister" 11 "Any other member" -999 "Don't know" -998 "Refuse"
	label values school_dropout_familymember school_dropout_familymember

	label variable school_dropout_reason_other "Other reason, please specify"
	note school_dropout_reason_other: "Other reason, please specify"

	label variable class_dropout "During which class did you drop out of school?"
	note class_dropout: "During which class did you drop out of school? (Do not read the options out loud)"
	label define class_dropout 1 "Class 6" 2 "Class 7" 3 "Class 8" 4 "Class 9" 5 "Class 10/HSC" 6 ">10th Class" -999 "Don't know" -998 "Refuse"
	label values class_dropout class_dropout

	label variable class "Which class are you studying in?"
	note class: "Which class are you studying in? ( Do not read the options out loud)"
	label define class 1 "Class 6" 2 "Class 7" 3 "Class 8" 4 "Class 9" 5 "Class 10/HSC" 6 ">10th Class" -999 "Don't know" -998 "Refuse"
	label values class class

	label variable section_enrolled "Which section are you enrolled in?"
	note section_enrolled: "Which section are you enrolled in?"

	label variable absent_sch "During last week how many days were you absent from school?"
	note absent_sch: "During last week how many days were you absent from school?"
	label define absent_sch 1 "Child wants to enter days" 2 "Student was not absent" -999 "Don't know" -998 "Refuse"
	label values absent_sch absent_sch

	label variable absent_days "Number of days - absent from school"
	note absent_days: "Number of days - absent from school"

	label variable absent_sch_reason_hhwork "In the past month, have you missed school due to household based responsibilities?"
	note absent_sch_reason_hhwork: "In the past month, have you missed school due to household based responsibilities? ( example- cleaning, cooking, taking care of hosuehold members, working in family farm, buying groceries etc.) ( Do not read the options out loud)"
	label define absent_sch_reason_hhwork 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values absent_sch_reason_hhwork absent_sch_reason_hhwork

	label variable often_bunk "How often do you bunk/skip classes in school?"
	note often_bunk: "How often do you bunk/skip classes in school? ( Read the options out loud)"
	label define often_bunk 1 "Never" 2 "Sometimes" 3 "Often" 4 "Always" -999 "Don't know" -998 "Refuse"
	label values often_bunk often_bunk

	label variable extra_activities "Mention which of the following you do after your formal school time:"
	note extra_activities: "Mention which of the following you do after your formal school time: (Read the options out loud, mark all that apply)"

	label variable extra_activities_1 "After school:Participate in extracurricular activities related to school(eco club/other club, singing, dancing, assemblies, sports)"
	note extra_activities_1: "Mention which of the following you do after your formal school time: Participate in extracurricular activities related to school ( eco club/other club, singing, dancing, assemblies, sports)"
	
	label variable extra_activities_2 "After school:Participate in voluntary activities such as planting trees, cleanliness drives, rallies or NGO activities"
	note extra_activities_2: "Mention which of the following you do after your formal school time: Participate in voluntary activities such as planting trees, cleanliness drives, rallies  or NGO activities"
	
	label variable extra_activities_3 "After school:Participate in Beti Padhao, Beti Bachao activities(rallies,essay competitions)"
	note extra_activities_3: "Mention which of the following you do after your formal school time: Participate in Beti Padhao, Beti Bachao activities ( rallies,essay competitions)"
	
	label variable extra_activities_4 "After school: None of the above"
	note extra_activities_4: "Mention which of the following you do after your formal school time: None of the above"
	
	label variable extra_activities__999 "After school: Dont know"
	note extra_activities__999: "Mention which of the following you do after your formal school time: Dont know"
	
	label define extra_activities 1 "Yes" 0 "No"
	label values extra_activities_1 extra_activities_2 extra_activities_3 extra_activities_4 extra_activities__999 extra_activities__998 extra_activities
	
	label variable extra_activities__998 "After school: Refuse"
	note extra_activities__998: "Mention which of the following you do after your formal school time: Refuse"

	label variable agree_deci_1 "Do you agree with the parent's decision?"
	note agree_deci_1: "Do you agree with the parent's decision? ( Do not read the options out loud)"
	label define agree_deci_1 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values agree_deci_1 agree_deci_1

	label variable right_time_marry "It is the right time for Pooja to get married"
	note right_time_marry: "It is the right time for Pooja to get married"
	label define right_time_marry 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values right_time_marry right_time_marry

	label variable not_work_marriage "Pooja should not work after marriage"
	note not_work_marriage: "Pooja should not work after marriage"
	label define not_work_marriage 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values not_work_marriage not_work_marriage

	label variable husband_responsibility "After Pooja is married, it should be her husband's responsibility to take care of her"
	note husband_responsibility: "After Pooja is married, it should be her husband's responsibility to take care of her."
	label define husband_responsibility 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values husband_responsibility husband_responsibility

	label variable marriage_more_imp "Marriage is more important for Pooja than her job"
	note marriage_more_imp: "Marriage is more important for Pooja than her job"
	label define marriage_more_imp 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values marriage_more_imp marriage_more_imp

	label variable bad_police_officer "Pooja will not be a good police officer after marriage"
	note bad_police_officer: "Pooja will not be a good police officer after marriage"
	label define bad_police_officer 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values bad_police_officer bad_police_officer

	label variable follow_parent_wish "Pooja should follow her parent's wishes"
	note follow_parent_wish: "Pooja should follow her parent's wishes"
	label define follow_parent_wish 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values follow_parent_wish follow_parent_wish

	label variable teacher_suitable "Being a teacher would be more suitable for Pooja"
	note teacher_suitable: "Being a teacher would be more suitable for Pooja"
	label define teacher_suitable 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values teacher_suitable teacher_suitable

	label variable pooja_decision "What would you have done if you were Pooja?"
	note pooja_decision: "What would you have done if you were Pooja?( Do not read the options out loud)"
	label define pooja_decision 1 "Readily Agree with decision" 2 "Disagree, but Keep Quiet" 3 "Negotiate with the parents" 4 "Work and then get married" 5 "Work after marriage" 6 "Refuse to get married" -999 "Don't know" -998 "Refuse"
	label values pooja_decision pooja_decision

	label variable agree_deci_2 "Do you agree with the parents' decision?"
	note agree_deci_2: "Do you agree with the parents' decision? (Do not read the options out loud)"
	label define agree_deci_2 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values agree_deci_2 agree_deci_2

	label variable town_studies "If you were the head of the family whom would you have sent to the town for further studies?"
	note town_studies: "If you were the head of the family whom would you have sent to the town for further studies? (Do not read the options out loud)"
	label define town_studies 1 "Naveen" 2 "Neelam" 3 "Borrowed money and sent both" -999 "Don't know" -998 "Refuse"
	label values town_studies town_studies

	label variable better_student "What will be your decision if Neelam was a better student(for example, if Neelam scored 86% marks)?"
	note better_student: "What will be your decision if Neelam was a better student (for example, if Neelam scored 86% marks)? (Do not read the options out aloud)"
	label define better_student 1 "Naveen" 2 "Neelam" 3 "Borrowed money and sent both" -999 "Don't know" -998 "Refuse"
	label values better_student better_student

	label variable consult_deci "Do you think that the father should have consulted the mother before taking the final decision?"
	note consult_deci: "Do you think that the father should have consulted the mother before taking the final decision?(Do not read the options out loud)"
	label define consult_deci 1 "Yes" 2 "No" 3 "Does not matter" -999 "Don't know" -998 "Refuse"
	label values consult_deci consult_deci

	label variable alone_not_safe "Staying alone in the town is not safe for Neelam"
	note alone_not_safe: "Staying alone in the town is not safe for Neelam"
	label define alone_not_safe 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values alone_not_safe alone_not_safe

	label variable marry_18 "Neelam needs to be married off as she is 18 years old."
	note marry_18: "Neelam needs to be married off as she is 18 years old."
	label define marry_18 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values marry_18 marry_18

	label variable imp_boy_high_edu "It is more important to send boys for higher education compared to girls."
	note imp_boy_high_edu: "It is more important to send boys for higher education compared to girls."
	label define imp_boy_high_edu 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values imp_boy_high_edu imp_boy_high_edu

	label variable favor_son "Do you think the family favoured the son more than the daughter?"
	note favor_son: "Do you think the family favoured the son more than the daughter? ( Do not read the options out loud)"
	label define favor_son 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values favor_son favor_son

	label variable satisfy "On the whole, I am satisfied with myself."
	note satisfy: "On the whole, I am satisfied with myself."
	label define satisfy 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values satisfy satisfy

	label variable enjoy_learn "I enjoy learning"
	note enjoy_learn: "I enjoy learning"
	label define enjoy_learn 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values enjoy_learn enjoy_learn

	label variable good_qly "I feel that I have a number of good qualities."
	note good_qly: "I feel that I have a number of good qualities."
	label define good_qly 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values good_qly good_qly

	label variable able_do_most "I am able to do things as well as most other people."
	note able_do_most: "I am able to do things as well as most other people."
	label define able_do_most 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values able_do_most able_do_most

	label variable make_comm "I help make my community a better place"
	note make_comm: "I help make my community a better place"
	label define make_comm 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values make_comm make_comm

	label variable full_idea "I am full of ideas"
	note full_idea: "I am full of ideas"
	label define full_idea 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values full_idea full_idea

	label variable social_prob "I think about social problems"
	note social_prob: "I think about social problems"
	label define social_prob 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values social_prob social_prob

	label variable parent_help "I have parents who try to help me succeed"
	note parent_help: "I have parents who try to help me succeed"
	label define parent_help 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values parent_help parent_help

	label variable defini_opinion "Some people say that it is important to have definite opinions about lots of things, whereas other people think that it is better to remain neutral on most issues. I think it is better to have definite opinions"
	note defini_opinion: "Some people say that it is important to have definite opinions about lots of things, whereas other people think that it is better to remain neutral on most issues. I think it is better to have definite opinions"
	label define defini_opinion 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values defini_opinion defini_opinion

	label variable woman_role_home "A woman's most important role is to take care of her home, feeding kids and cook for her family"
	note woman_role_home: "A woman's most important role is to take care of her home, feeding kids and cook for her family."
	label define woman_role_home 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values woman_role_home woman_role_home

	label variable man_final_deci "A man should have the final word about decisions in his home."
	note man_final_deci: "A man should have the final word about decisions in his home."
	label define man_final_deci 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values man_final_deci man_final_deci

	label variable woman_viol "A woman should tolerate violence in order to keep her family together."
	note woman_viol: "A woman should tolerate violence in order to keep her family together."
	label define woman_viol 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values woman_viol woman_viol

	label variable equal_oppo "Men and women should get equal opportunities in all spheres of life - education, healthcare, food, decision making."
	note equal_oppo: "Men and women should get equal opportunities in all spheres of life - education, healthcare, food, decision making."
	label define equal_oppo 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values equal_oppo equal_oppo

	label variable wives_less_edu "Wives should be less educated than their husbands."
	note wives_less_edu: "Wives should be less educated than their husbands."
	label define wives_less_edu 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values wives_less_edu wives_less_edu

	label variable girl_allow_far "Girls should be allowed to study as far as they want."
	note girl_allow_far: "Girls should be allowed to study as far as they want."
	label define girl_allow_far 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values girl_allow_far girl_allow_far

	label variable similar_right "Daughters should have a similar right to inherited property as sons."
	note similar_right: "Daughters should have a similar right to inherited property as sons."
	label define similar_right 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values similar_right similar_right

	label variable boy_more_oppo "Boys should be allowed to get more opportunities and resources for education than girls."
	note boy_more_oppo: "Boys should be allowed to get more opportunities and resources for education than girls."
	label define boy_more_oppo 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values boy_more_oppo boy_more_oppo

	label variable dowry_girl_marriage "Parents should give dowry for their girl's marriage"
	note dowry_girl_marriage: "Parents should give dowry for their girl's marriage"
	label define dowry_girl_marriage 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values dowry_girl_marriage dowry_girl_marriage

	label variable elect_woman "It would be a good idea to elect a woman as the Sarpanch of your village."
	note elect_woman: "It would be a good idea to elect a woman as the Sarpanch of your village."
	label define elect_woman 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values elect_woman elect_woman

	label variable question_opinion "A good woman should never question her husband's opinions, even if she is not sure she agrees with them"
	note question_opinion: "A good woman should never question her husband's opinions, even if she is not sure she agrees with them"
	label define question_opinion 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values question_opinion question_opinion

	label variable control_daughters "Parents should maintain stricter control over their daughters than their sons."
	note control_daughters: "Parents should maintain stricter control over their daughters than their sons."
	label define control_daughters 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values control_daughters control_daughters

	label variable sons_protect "A woman has to have a husband or sons or some other male kinsman to protect her"
	note sons_protect: "A woman has to have a husband or sons or some other male kinsman to protect her"
	label define sons_protect 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values sons_protect sons_protect

	label variable boy_study_marry "Boys should attain higher education so that they can find better wives"
	note boy_study_marry: "Boys should attain higher education so that they can find better wives"
	label define boy_study_marry 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values boy_study_marry boy_study_marry

	label variable control_wife "A man should have control over his wife"
	note control_wife: "A man should have control over his wife"
	label define control_wife 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values control_wife control_wife

	label variable men_better_suited "Men are better suited than women to work outside the house"
	note men_better_suited: "Men are better suited than women to work outside the house"
	label define men_better_suited 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values men_better_suited men_better_suited

	label variable girl_study_marry "Girls should attain higher education so that they can find better husbands"
	note girl_study_marry: "Girls should attain higher education so that they can find better husbands"
	label define girl_study_marry 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values girl_study_marry girl_study_marry

	label variable shy_boy "A shy demeanour makes a boy a more suitable groom"
	note shy_boy: "A shy demeanour makes a boy a more suitable groom"
	label define shy_boy 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values shy_boy shy_boy

	label variable girl_laugh "When a girl laughs, she should cover her mouth"
	note girl_laugh: "When a girl laughs, she should cover her mouth"
	label define girl_laugh 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values girl_laugh girl_laugh

	label variable shy_girl "A shy demeanour makes a girl a more suitable bride"
	note shy_girl: "A shy demeanour makes a girl a more suitable bride"
	label define shy_girl 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values shy_girl shy_girl

	label variable boy_laugh "When a boy laughs, he should cover his mouth"
	note boy_laugh: "When a boy laughs, he should cover his mouth"
	label define boy_laugh 1 "Strongly agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly disagree" -999 "Don't know" -998 "Refuse"
	label values boy_laugh boy_laugh

	label variable girls_less "In Haryana, are the number of girls less than the number of boys ?"
	note girls_less: "In Haryana, are the number of girls less than the number of boys ? ( Do not read the options out loud)"
	label define girls_less 1 "Yes" 2 "Equal number of boys and girls" 3 "There are more girls" -999 "Don't Know" -998 "Refuse"
	label values girls_less girls_less

	label variable cont_educ "Suppose you were to get married right after school, would you want to continue your education after marriage?"
	note cont_educ: "Suppose you were to get married right after school, would you want to continue your education after marriage?(Do not read the options out loud)"
	label define cont_educ 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values cont_educ cont_educ

	label variable discuss_educ "Have you ever discussed your education goals with your parents or adult relatives?"
	note discuss_educ: "Have you ever discussed your education goals with your parents or adult relatives? ( Do not read the options out loud)"
	label define discuss_educ 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values discuss_educ discuss_educ

	label variable highest_educ "What is the highest level of education you would like to complete if finances and opportunity of the school/college are available?"
	note highest_educ: "What is the highest level of education you would like to complete if finances and opportunity of the school/college are available? ( Do not read the options out loud)"
	label define highest_educ 1 "Class 7" 2 "Class 8" 3 "Class 9" 4 "Class10 / SSC" 5 "Class12 / HSC" 6 "Class 13 ( Graduation)" 7 "Class 14" 8 "Class 15" 9 "Class 16 or above (Post Graduation)" 10 "Diploma" -999 "Don't Know" -998 "Refuse"
	label values highest_educ highest_educ

	label variable class_rank "How would you academically rank yourself in class?"
	note class_rank: "How would you academically rank yourself in class? ( Read out the options out loud)"
	label define class_rank 1 "One of the best" 2 "Above average" 3 "Satisfactory" 4 "Below average" 5 "Worst in class" -999 "Don't Know" -998 "Refuse"
	label values class_rank class_rank

	label variable board_score "How many marks, according to you, will you score in the 10th board examinations?"
	note board_score: "How many marks, according to you, will you score in the 10th board examinations? ( Do not read the options out loud)"
	label define board_score 1 "Fail" 2 "<50" 3 "50-59" 4 "60-69" 5 "70-79" 6 "80-89" 7 "90-100" -999 "Don't Know" -998 "Refuse"
	label values board_score board_score

	label variable occupa_25 "What occupation do you expect to have when you are 25 years old?"
	note occupa_25: "What occupation do you expect to have when you are 25 years old? (Do not read the options out loud)"
	label define occupa_25 1 "AGRI (L) - Agriculture work in land:" 2 "AGRI - Agriculture work:" 3 "INDS - Industry/Mill/Factory:" 4 "BUSI - Business:" 5 "TRANS - Transport:" 6 "CONSTR - Construction work:" 7 "PROFE - Professionals:" 8 "SERV - Professionals (Services):" 9 "OTHR (PR) - Other Professions" 10 "OTHR - Others" 11 "NTHN - No source of income" -999 "Don't know" -998 "Refuse"
	label values occupa_25 occupa_25

	label variable girl_marriage_age "According to you, what is the appropriate age for your sister/female cousin/ female friend to get married?"
	note girl_marriage_age: "According to you, what is the appropriate age for your sister/female cousin/ female friend to get married? ( Do not read the options out loud)"
	label define girl_marriage_age 1 "Student wants to enter age" 2 "According to parents" 3 "Whenever he/she wants" 4 "After he/she has a job" 5 "After he/she has completed their education" -999 "Don't Know" -998 "Refuse"
	label values girl_marriage_age girl_marriage_age

	label variable girl_marriage_age_numb "At what age? - female friend marriage"
	note girl_marriage_age_numb: "At what age? - female friend marriage"

	label variable boy_marriage_age "According to you, what is the appropriate age for your brother/male cousin/ male"
	note boy_marriage_age: "According to you, what is the appropriate age for your brother/male cousin/ male friend to get married?( Do not read the options out loud)"
	label define boy_marriage_age 1 "Student wants to enter age" 2 "According to parents" 3 "Whenever he/she wants" 4 "After he/she has a job" 5 "After he/she has completed their education" -999 "Don't Know" -998 "Refuse"
	label values boy_marriage_age boy_marriage_age

	label variable boy_marriage_age_numb "At what age? - male friend marriage"
	note boy_marriage_age_numb: "At what age? - male friend marriage"

	label variable two_girls "If a husband and wife have 2 children and they are both girls. Which of the following should they do?"
	note two_girls: "If a husband and wife have 2 children and they are both girls. Which of the following should they do? (Read the options out loud)"
	label define two_girls 1 "Have no more children because they've reached a family size of 2" 2 "Have one more child, hoping it's a boy" 3 "Have more children, until a boy is born" -999 "Don't Know" -998 "Refuse"
	label values two_girls two_girls

	label variable comf_opp_gender_girl "Are you comfortable talking to girls who are not related to you inside and outside school?"
	note comf_opp_gender_girl: "Are you comfortable talking to girls who are not related to you inside and outside school? (Do not read the options out loud)"
	label define comf_opp_gender_girl 1 "Very comfortable" 2 "Moderately comfortable" 3 "Moderately uncomfortable" 4 "Very uncomfortable" -999 "Don't Know" -998 "Refuse"
	label values comf_opp_gender_girl comf_opp_gender_girl

	label variable comf_opp_gender_boy "Are you comfortable talking to boys who are not related to you inside and outside school?"
	note comf_opp_gender_boy: "Are you comfortable talking to boys who are not related to you inside and outside school? (Do not read the options out loud)"
	label define comf_opp_gender_boy 1 "Very comfortable" 2 "Moderately comfortable" 3 "Moderately uncomfortable" 4 "Very uncomfortable" -999 "Don't Know" -998 "Refuse"
	label values comf_opp_gender_boy comf_opp_gender_boy

	label variable play_opp_gender_girl "Do you play with girls who are not related to you inside or outside school?"
	note play_opp_gender_girl: "Do you play with girls who are not related to you inside or outside school? (Do not read the options out loud)"
	label define play_opp_gender_girl 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values play_opp_gender_girl play_opp_gender_girl

	label variable play_opp_gender_boy "Do you play with boys who are not related to you inside or outside school?"
	note play_opp_gender_boy: "Do you play with boys who are not related to you inside or outside school? (Do not read the options out loud)"
	label define play_opp_gender_boy 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values play_opp_gender_boy play_opp_gender_boy

	label variable teased_opp_gender_girl "How frequently have you been teased, whistled at or called names by girls in your class?"
	note teased_opp_gender_girl: "How frequently have you been teased, whistled at or called names by girls in your class?(Do not read the options out loud)"
	label define teased_opp_gender_girl 1 "Never" 2 "Sometimes" 3 "Often" 4 "Always" -999 "Don't know" -998 "Refuse"
	label values teased_opp_gender_girl teased_opp_gender_girl

	label variable teased_opp_gender_boy "How frequently have you been teased, whistled at or called names by boys in your class?"
	note teased_opp_gender_boy: "How frequently have you been teased, whistled at or called names by boys in your class?(Do not read the options out loud)"
	label define teased_opp_gender_boy 1 "Never" 2 "Sometimes" 3 "Often" 4 "Always" -999 "Don't know" -998 "Refuse"
	label values teased_opp_gender_boy teased_opp_gender_boy

	label variable encourage_dress "Do you discourage your sister/female cousin to dress up fashionably if she wants?"
	note encourage_dress: "Do you discourage your sister/female cousin to dress up fashionably if she wants? (Jeans, Kurtis, makeup et cetera)? (Do not read the options out loud)"
	label define encourage_dress 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values encourage_dress encourage_dress

	label variable encourage_meet_friends "Do you discourage your sister/female cousin to meet her friends when she wants?"
	note encourage_meet_friends: "Do you discourage your sister/female cousin to meet her friends when she wants? ( Do not read the options out loud)"
	label define encourage_meet_friends 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values encourage_meet_friends encourage_meet_friends

	label variable encourage_melas "Do you discourage your sister/female cousins to go for a mela with their friends"
	note encourage_melas: "Do you discourage your sister/female cousins to go for a mela with their friends? ( Do not read the options out loud)"
	label define encourage_melas 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values encourage_melas encourage_melas

	label variable tease_girls "In the past year, have boys in your class done the following to your girl classmates?"
	note tease_girls: "In the past year, have boys in your class done the following to your girl classmates (Multiple Options, Read the options out loud)"
	
	label variable tease_girls_1 "Boys in your class done the following to your girl classmates - Pulled hair"
	note tease_girls_1: "Boys in your class done the following to your girl classmates - Pulled hair"

	label variable tease_girls_2 "Boys in your class done the following to your girl classmates - Slapped/Pushed/Twisted Arm"
	note tease_girls_2: "Boys in your class done the following to your girl classmates - Slapped/Pushed/Twisted Arm"
	
	label variable tease_girls_3 "Boys in your class done the following to your girl classmates - Spoken rudely"
	note tease_girls_3: "Boys in your class done the following to your girl classmates - Spoken rudely"
	
	label variable tease_girls_4 "Boys in your class done the following to your girl classmates - Fight"
	note tease_girls_4: "Boys in your class done the following to your girl classmates - Fight"
	
	label variable tease_girls_5 "Boys in your class done the following to your girl classmates - Teased/Whistled at"
	note tease_girls_5: "Boys in your class done the following to your girl classmates - Teased/Whistled at"
	
	label variable tease_girls_6 "Boys in your class done the following to your girl classmates - None of the above"
	note tease_girls_6: "Boys in your class done the following to your girl classmates - None of the above"
	
	label variable tease_girls__999 "Boys in your class done the following to your girl classmates - Dont know"
	note tease_girls__999: "Boys in your class done the following to your girl classmates - Dont know"
	
	label variable tease_girls__998 "Boys in your class done the following to your girl classmates - Refused"
	note tease_girls__998: "Boys in your class done the following to your girl classmates - Refused"

	label define tease_girls 0 "No" 1 "Yes"
	label values tease_girls_1 tease_girls_2 tease_girls_3 tease_girls_4 tease_girls_5 tease_girls_6 tease_girls__999 tease_girls__998 tease_girls
	
	
	label variable action_harassed "Have you intervened or taken action if a girl was being harassed/teased in your school?"
	note action_harassed: "Have you intervened or taken action if a girl was being harassed/teased in your school? (Do not read the options out loud)"
	label define action_harassed 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values action_harassed action_harassed

	label variable decision_past_tenth "Decision: Whether or not you will continue in school past 10th grade"
	note decision_past_tenth: "Decision: Whether or not you will continue in school past 10th grade (Read the options out loud)"
	label define decision_past_tenth 1 "I make the decision" 2 "Jointly make decision with family" 3 "Parents make the decision" -999 "Don't Know" -998 "Refuse"
	label values decision_past_tenth decision_past_tenth

	label variable decision_work "Decision: If you will work after you finish your studies"
	note decision_work: "Decision: If you will work after you finish your studies (Read the options out loud)"
	label define decision_work 1 "I make the decision" 2 "Jointly make decision with family" 3 "Parents make the decision" -999 "Don't Know" -998 "Refuse"
	label values decision_work decision_work

	label variable decision_kindofwork "Decision: What type of work you will do after you finish your studies"
	note decision_kindofwork: "Decision: What type of work you will do after you finish your studies (Read the options out loud)"
	label define decision_kindofwork 1 "I make the decision" 2 "Jointly make decision with family" 3 "Parents make the decision" -999 "Don't Know" -998 "Refuse"
	label values decision_kindofwork decision_kindofwork

	label variable decision_chores "Decision: What types of chores you do at home (for example, cooking, cleaning dishes, taking care of your siblings)"
	note decision_chores: "Decision: What types of chores you do at home (for example, cooking, cleaning dishes, taking care of your siblings) ( Read the options out loud)"
	label define decision_chores 1 "I make the decision" 2 "Jointly make decision with family" 3 "Parents make the decision" -999 "Don't Know" -998 "Refuse"
	label values decision_chores decision_chores

	label variable allow_new_fashion "If you wanted to wear some of these modern fashions (kurti, jeans etc.)and had the money to do so, do you think your parents would allow you?"
	note allow_new_fashion: "Each year there are new fashions that come out. If you wanted to wear some of these modern fashions (kurti, jeans etc.) and had the money to do so, do you think your parents would allow you?( Do not read the options out loud)"
	label define allow_new_fashion 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values allow_new_fashion allow_new_fashion

	label variable own_jeans "Do you own a pair of jeans?"
	note own_jeans: "Do you own a pair of jeans? (Do not read the options out loud)"
	label define own_jeans 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values own_jeans own_jeans

	label variable allow_wear_any_dress "Are you allowed to wear any dress you want?"
	note allow_wear_any_dress: "Are you allowed to wear any dress you want? ( Do not read the options out loud)"
	label define allow_wear_any_dress 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values allow_wear_any_dress allow_wear_any_dress

	label variable future_work "I am able to talk to my parents about what work I would like to do in the future"
	note future_work: "I am able to talk to my parents about what work I would like to do in the future ( Do not read the options out loud)"
	label define future_work 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values future_work future_work

	label variable wish_married "I am able to talk to my parents about when I wish to get married"
	note wish_married: "I am able to talk to my parents about when I wish to get married ( Do not read the options out loud)"
	label define wish_married 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values wish_married wish_married

	label variable problem_friends "I am able to talk to my parents when I have problems with friends or at school"
	note problem_friends: "I am able to talk to my parents when I have problems with friends or at school ( Do not read the options out loud)"
	label define problem_friends 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values problem_friends problem_friends

	label variable alone_relative "Are you allowed to go alone to a relative's house inside the village?"
	note alone_relative: "Are you allowed to go alone to a relative's house inside the village? ( Do not read the options out loud)"
	label define alone_relative 1 "Yes" 0 "No" 2 "There are no relatives in the village" -999 "Don't Know" -998 "Refuse"
	label values alone_relative alone_relative

	label variable alone_friend "Are you allowed to go to the school alone or with friends?"
	note alone_friend: "Are you allowed to go to the school alone or with friends? ( Do not read the options out loud)"
	label define alone_friend 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values alone_friend alone_friend

	label variable meet_friend "Are you allowed to go alone to meet your friends for any reason (to get school notes, chat, play etc.)?"
	note meet_friend: "Are you allowed to go alone to meet your friends for any reason (to get school notes, chat, play etc.)? ( Do not read the options out loud)"
	label define meet_friend 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values meet_friend meet_friend

	label variable market_friend "Have you ever gone to the market within your village to buy personal items with friends?"
	note market_friend: "Have you ever gone to the market within your village to buy personal items with friends? (no guardians) ( Do not read the options out loud)"
	label define market_friend 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values market_friend market_friend

	label variable alone_market "Have you ever gone to the market within your village to buy personal items alone?"
	note alone_market: "Have you ever gone to the market within your village to buy personal items alone? ( Do not read the options out loud)"
	label define alone_market 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values alone_market alone_market

	label variable atten_events "Have you ever attended any sort of community events/activities? (Ex: fair, theatre, cultural program, religious event)"
	note atten_events: "Have you ever attended any sort of community events/activities? (Ex: fair, theatre, cultural program, religious event) ( Do not read the options out loud)"
	label define atten_events 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values atten_events atten_events

	label variable alone_atten_events "Have you ever attended one of these events without guardians present (either alone or with friends)?"
	note alone_atten_events: "Have you ever attended one of these events without guardians present (either alone or with friends)? ( Do not read the options out loud)"
	label define alone_atten_events 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values alone_atten_events alone_atten_events

	label variable sit_opp_gender_girl "Do you sit next to girls in the classroom?"
	note sit_opp_gender_girl: "Do you sit next to girls in the classroom? ( Do not read the options out loud)"
	label define sit_opp_gender_girl 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values sit_opp_gender_girl sit_opp_gender_girl

	label variable sit_opp_gender_boy "Do you sit next to boys in the classroom?"
	note sit_opp_gender_boy: "Do you sit next to boys in the classroom? (Do not read the options out loud)"
	label define sit_opp_gender_boy 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values sit_opp_gender_boy sit_opp_gender_boy

	label variable cook_clean "How often: Cook/Clean/Wash Clothes?"
	note cook_clean: "How often: Cook/Clean/Wash Clothes?(Read options out loud)"
	label define cook_clean 1 "Never" 2 "1-2 times a week" 3 "3-4 times a week" 4 "Everyday" -999 "Don't Know" -998 "Refuse"
	label values cook_clean cook_clean

	label variable take_care_young_sib "How often: Take care of younger siblings/ old persons in the household?"
	note take_care_young_sib: "How often: Take care of younger siblings/ old persons in the household? ( Read options out loud)"
	label define take_care_young_sib 1 "Never" 2 "1-2 times a week" 3 "3-4 times a week" 4 "Everyday" -999 "Don't Know" -998 "Refuse"
	label values take_care_young_sib take_care_young_sib

	label variable hh_shopping "How often: Went shopping for household provisions/ paid bills?"
	note hh_shopping: "How often: Went shopping for household provisions/ paid bills? ( Read options out loud)"
	label define hh_shopping 1 "Never" 2 "1-2 times a week" 3 "3-4 times a week" 4 "Everyday" -999 "Don't Know" -998 "Refuse"
	label values hh_shopping hh_shopping

	label variable homework "How often: Do homework assigned to you in school?"
	note homework: "How often: Do homework assigned to you in school? (Read options out loud)"
	label define homework 1 "Never" 2 "1-2 times a week" 3 "3-4 times a week" 4 "Everyday" -999 "Don't Know" -998 "Refuse"
	label values homework homework

	label variable help_homework "Who helped with the homework assigned to you?"
	note help_homework: "Who helped with the homework assigned to you?"
	label define help_homework 1 "Student himself/herself" 2 "Father" 3 "Mother" 4 "Brother" 5 "Sister" 6 "Uncle" 7 "Aunt" 8 "Grandfather" 9 "Grandmother" 10 "Other relatives" 11 "Friend" -999 "Don't Know" -998 "Refuse"
	label values help_homework help_homework

	label variable first_meal "When your family takes the main meal, who eats the meal first?"
	note first_meal: "When your family takes the main meal, who eats the meal first? ( Do not read options out loud)"
	label define first_meal 1 "Respondent" 2 "Father" 3 "Male Sibling" 4 "Mother" 5 "Female Sibling" 6 "Old persons in the family" 7 "Everyone eats together" 8 "Anybody can eat first" -999 "Don't Know" -998 "Refuse"
	label values first_meal first_meal

	label variable female_foeticide "Do you know about female foeticide and infanticide?"
	note female_foeticide: "Do you know about female foeticide and infanticide? ( Do not read the options out loud)"
	label define female_foeticide 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values female_foeticide female_foeticide

	label variable female_foeticide_state "Are female foeticide and infanticide practiced in your state?"
	note female_foeticide_state: "Are female foeticide and infanticide practiced in your state? ( Do not read the options out loud)"
	label define female_foeticide_state 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values female_foeticide_state female_foeticide_state

	label variable female_foeticide_reason "According to you, what is the main reason for female foeticide and infanticide?"
	note female_foeticide_reason: "According to you, what is the main reason for female foeticide and infanticide? ( Mark all that apply,do not read the options out loud)"

	label variable female_foeticide_reason_1 "Main reason for female foeticide and infanticide - There should be a boy in the family "
	note female_foeticide_reason_1: "According to you, what is the main reason for female foeticide and infanticide? - There should be a boy in the family "
	
	label variable female_foeticide_reason_2 "Main reason for female foeticide and infanticide - There are too many girls in a family"
	note female_foeticide_reason_2: "According to you, what is the main reason for female foeticide and infanticide? - There are too many girls in a family"
	
	label variable female_foeticide_reason_3 "Main reason for female foeticide and infanticide - Low status of the girl child"
	note female_foeticide_reason_3: "According to you, what is the main reason for female foeticide and infanticide? - Low status of the girl child"
	
	label variable female_foeticide_reason_4 "Main reason for female foeticide and infanticide - Girls are not considered a part of the family "
	note female_foeticide_reason_4: "According to you, what is the main reason for female foeticide and infanticide? - Girls are not considered a part of the family "
	
	label variable female_foeticide_reason_5 "Main reason for female foeticide and infanticide - Girls can cause trouble by being disobedient"
	note female_foeticide_reason_5: "According to you, what is the main reason for female foeticide and infanticide? - Girls can cause trouble by being disobedient"
	
	label variable female_foeticide_reason_6 "Main reason for female foeticide and infanticide - Girl Child is considered an economic burden(Dowry)"
	note female_foeticide_reason_6: "According to you, what is the main reason for female foeticide and infanticide? - Girl Child is considered an economic burden(Dowry)"
	
	label variable female_foeticide_reason_7 "Main reason for female foeticide and infanticide - Pressure from Family"
	note female_foeticide_reason_7: "According to you, what is the main reason for female foeticide and infanticide? - Pressure from Family"
	
	label variable female_foeticide_reason_8 "Main reason for female foeticide and infanticide - It is difficult to keep girls safe"
	note female_foeticide_reason_8: "According to you, what is the main reason for female foeticide and infanticide? - It is difficult to keep girls safe"
	
	label variable female_foeticide_reason_9 "Main reason for female foeticide and infanticide - Girls forsake the honour of their families"
	note female_foeticide_reason_9: "According to you, what is the main reason for female foeticide and infanticide? - Girls forsake the honour of their families"
	
	label variable female_foeticide_reason_10 "Main reason for female foeticide and infanticide - Others, Specify"
	note female_foeticide_reason_10: "According to you, what is the main reason for female foeticide and infanticide? - Others, Specify"

	label variable female_foeticide_reason__999 "Main reason for female foeticide and infanticide - Dont know"
	note female_foeticide_reason__999: "According to you, what is the main reason for female foeticide and infanticide? - Dont know"
	
	label variable female_foeticide_reason__998 "Main reason for female foeticide and infanticide - Refuse"
	note female_foeticide_reason__998: "According to you, what is the main reason for female foeticide and infanticide? - Refuse"
	
	label define female_foeticide_reason 1 "Yes" 0 "No"
	label values female_foeticide_reason_1 female_foeticide_reason_2 female_foeticide_reason_3 female_foeticide_reason_4 female_foeticide_reason_5 female_foeticide_reason_6 female_foeticide_reason_7 female_foeticide_reason_8 female_foeticide_reason_9 female_foeticide_reason_10 female_foeticide_reason__999 female_foeticide_reason__998 female_foeticide_reason
	
	label variable female_foeticide_reason_other "Main reason for female foeticide and infanticide: Any other reason"
	note female_foeticide_reason_other: "According to you, what is the main reason for female foeticide and infanticide? - Any other reason"

	label variable mem_cell "Does anybody in your house own a mobile phone?"
	note mem_cell: "Does anybody in your house own a mobile phone?"
	label define mem_cell 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values mem_cell mem_cell

	label variable access_mobile "Do you have access to that mobile phone?"
	note access_mobile: "Do you have access to that mobile phone? ( Do not read options out loud)"
	label define access_mobile 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values access_mobile access_mobile

	label variable purp_mobile "For what all purposes do you use the mobile phone?"
	note purp_mobile: "For what all purposes do you use the mobile phone? (Mark all that apply, Read options out loud)"
	
	label variable purp_mobile_1 "For what all purposes do you use the mobile phone? - Calling relatives"
	note purp_mobile_1: "For what all purposes do you use the mobile phone? -  Calling relatives"
	
	label variable purp_mobile_2 "For what all purposes do you use the mobile phone? -  Calling friends"
	note purp_mobile_2: "For what all purposes do you use the mobile phone? -  Calling friends"
	
	label variable purp_mobile_3 "For what all purposes do you use the mobile phone? -  Receiving calls"
	note purp_mobile_3: "For what all purposes do you use the mobile phone? -  Receiving calls"
	
	label variable purp_mobile_4 "For what all purposes do you use the mobile phone? - Sending messages"
	note purp_mobile_4: "For what all purposes do you use the mobile phone? -  Sending messages"
	
	label variable purp_mobile_5 "For what all purposes do you use the mobile phone? -  Playing games"
	note purp_mobile_5: "For what all purposes do you use the mobile phone? -  Playing games"
	
	label variable purp_mobile_6 "For what all purposes do you use the mobile phone? -  Listening to FM/Radio"
	note purp_mobile_6: "For what all purposes do you use the mobile phone? -  Listening to FM/Radio"
	
	label variable purp_mobile_7 "For what all purposes do you use the mobile phone? -  Access internet"
	note purp_mobile_7: "For what all purposes do you use the mobile phone? -  Access internet"
	
	label variable purp_mobile__999 "For what all purposes do you use the mobile phone? - Dont know"
	note purp_mobile__999: "For what all purposes do you use the mobile phone? - Dont know"
	
	label variable purp_mobile__998 "For what all purposes do you use the mobile phone? - Refuse"
	note purp_mobile__998: "For what all purposes do you use the mobile phone? - Refuse"

	label define purp_mobile 1 "Yes" 0 "No"
	label values purp_mobile_1 purp_mobile_2 purp_mobile_3 purp_mobile_4 purp_mobile_5 purp_mobile_6 purp_mobile_7 purp_mobile__999 purp_mobile__998 purp_mobile

	label variable tv_house "Do you have a TV your house?"
	note tv_house: "Do you have a TV your house? ( Do not read options out loud)"
	label define tv_house 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values tv_house tv_house

	label variable often_tv "How often do you watch TV?"
	note often_tv: "How often do you watch TV? (Encircle the appropriate unit, read options out loud)"
	label define often_tv 1 "______ Hours" 2 "Never" -999 "Don't Know" -998 "Refuse"
	label values often_tv often_tv

	label variable often_tv_hr "..Hours (TV)"
	note often_tv_hr: "..Hours (TV)"

	label variable often_tv_unit "unit(TV)"
	note often_tv_unit: "unit(TV)"
	label define often_tv_unit 1 "Day" 2 "Week" 3 "Month" 4 "Year" -999 "Don't Know" -998 "Refuse"
	label values often_tv_unit often_tv_unit

	label variable what_tv "What do you watch on TV?"
	note what_tv: "What do you watch on TV? (Mark all that apply, Read options out loud)"

	label variable what_tv_1 "What do you watch on TV? - Sports "
	note what_tv_1: "What do you watch on TV? - Sports"
	
	label variable what_tv_2 "What do you watch on TV? - Family serials"
	note what_tv_2: "What do you watch on TV? - Family serials"
	
	label variable what_tv_3 "What do you watch on TV? - Cartoons"
	note what_tv_3: "What do you watch on TV? - Cartoons"
	
	label variable what_tv_4 "What do you watch on TV? - News"
	note what_tv_4: "What do you watch on TV? - News"
	
	label variable what_tv_5 "What do you watch on TV? - Movies"
	note what_tv_5: "What do you watch on TV? - Movies"
	
	label variable what_tv_6 "What do you watch on TV? - Songs"
	note what_tv_6: "What do you watch on TV? - Songs"
	
	label variable what_tv__999 "What do you watch on TV? - Dont know"
	note what_tv__999: "What do you watch on TV? - Dont know"
	
	label variable what_tv__998 "What do you watch on TV? - Refuse"
	note what_tv__998: "What do you watch on TV? - Refuse"

	label define what_tv 1 "Yes" 0 "No"
	label values what_tv_1 what_tv_2 what_tv_3 what_tv_4 what_tv_5 what_tv_6 what_tv__999 what_tv__998 what_tv
	
	label variable allow_college "Do you think that girls should be allowed to study in college even if it is far "
	note allow_college: "Do you think that girls should be allowed to study in college even if it is far away?"
	label define allow_college 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values allow_college allow_college

	label variable community_allow_college "Do you think that people in your village/community think that girls should be allowed to study in college even if it is far away?"
	note community_allow_college: "Do you think that people in your village/community think that girls should be allowed to study in college even if it is far away? (Do not read the options out loud)"
	label define community_allow_college 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values community_allow_college community_allow_college

	label variable oppose_allow_college "Do you think the community will oppose you since you disagree with them?"
	note oppose_allow_college: "Do you think the community will oppose you since you disagree with them? (Do not read the options out loud)"
	label define oppose_allow_college 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values oppose_allow_college oppose_allow_college

	label variable discourage_college "Do you discourage your sister from studying in college if it is far away?"
	note discourage_college: "Do you discourage your sister from studying in college if it is far away? (Do not read the options out loud)"
	label define discourage_college 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values discourage_college discourage_college

	label variable counterfactual_allow_college "If the community did not oppose you, would you encourage your sister/cousin sister to study in college even if it is far away?"
	note counterfactual_allow_college: "If the community did not oppose you, would you encourage your sister/cousin sister to study in college even if it is far away? (Do not read the options out loud)"
	label define counterfactual_allow_college 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values counterfactual_allow_college counterfactual_allow_college

	label variable allow_work "Do you think that women should be allowed to work outside home ?"
	note allow_work: "Do you think that women should be allowed to work outside home ?"
	label define allow_work 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values allow_work allow_work

	label variable community_allow_work "Do you think that people in your village/community think that women should be allowed to work outside home?"
	note community_allow_work: "Do you think that people in your village/community think that women should be allowed to work outside home ?"
	label define community_allow_work 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values community_allow_work community_allow_work

	label variable oppose_allow_work "Do you think the community will oppose you since you disagree with them?"
	note oppose_allow_work: "Do you think the community will oppose you since you disagree with them? (Do not read the options out loud)"
	label define oppose_allow_work 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values oppose_allow_work oppose_allow_work

	label variable discourage_work "Do you discourage your sister/cousin sister to work outside home?"
	note discourage_work: "Do you discourage your sister/cousin sister to work outside home ? (Do not read the options out loud)"
	label define discourage_work 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values discourage_work discourage_work

	label variable counterfactual_allow_work "If the community did not oppose you, would you discourage your sister/cousin sister to work outside home?"
	note counterfactual_allow_work: "If the community did not oppose you, would you discourage your sister/cousin sister to work outside home ? (Do not read the options out loud)"
	label define counterfactual_allow_work 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values counterfactual_allow_work counterfactual_allow_work

	label variable two_boys "If a husband and wife have 2 children and they are both boys. Which of the following should they do?"
	note two_boys: "If a husband and wife have 2 children and they are both boys. Which of the following should they do? ( Read the options out loud)"
	label define two_boys 1 "Have no more children because they've reached a family size of 2" 2 "Have one more child, hoping it's a girl" 3 "Have more children, until a girl is born" -999 "Don't Know" -998 "Refuse"
	label values two_boys two_boys

	label variable organization_session "Is there an organization which visits your school to organize students in a club/group and conduct sessions regarding gender discrimination in class?"
	note organization_session: "Is there an organization which visits your school to organize students in a club/group and conduct sessions regarding gender discrimination in class ? (Do not read the options out loud)"
	label define organization_session 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values organization_session organization_session

	label variable name_organization "What is the name of this organization?"
	note name_organization: "What is the name of this organization? (Do not read the options out loud)"
	label define name_organization 1 "Breakthrough/Taaron ki toli" 2 "Other organization" -999 "Don't Know" -998 "Refuse"
	label values name_organization name_organization

	label variable attend_session "Have you ever attended any of the sessions?"
	note attend_session: "Have you ever attended any of the sessions? (Do not read the options out loud)"
	label define attend_session 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values attend_session attend_session

	label variable issues_session "What are the main issues discussed during these sessions?"
	note issues_session: "What are the main issues discussed during these sessions? ( Multiple options, Do not read the options out loud)"

	label variable issues_session_1 "What are the main issues discussed during these sessions? - Boys and girls are equal "
	note issues_session_1: "What are the main issues discussed during these sessions? - Boys and girls are equal "
	
	label variable issues_session_2 "What are the main issues discussed during these sessions? - Gender based discrimination"
	note issues_session_2: "What are the main issues discussed during these sessions? - Gender based discrimination"
	
	label variable issues_session_3 "What are the main issues discussed during these sessions? -  Rights of both girls and boys"
	note issues_session_3: "What are the main issues discussed during these sessions? -  Rights of both girls and boys"
	
	label variable issues_session_4 "What are the main issues discussed during these sessions? - Life skills (negotiation, communication, decision-making)"
	note issues_session_4: "What are the main issues discussed during these sessions? - Life skills (negotiation, communication, decision-making)"
	
	label variable issues_session_5 "What are the main issues discussed during these sessions? - Eve teasing and harassment"
	note issues_session_5: "What are the main issues discussed during these sessions? - Eve teasing and harassment"
	
	label variable issues_session_6 "What are the main issues discussed during these sessions? - Negotiating with your family "
	note issues_session_6: "What are the main issues discussed during these sessions? - Negotiating with your family "
	
	label variable issues_session_7 "What are the main issues discussed during these sessions? - Other, Specify____"
	note issues_session_7: "What are the main issues discussed during these sessions? - Other, Specify____"
	
	label variable issues_session__999 "What are the main issues discussed during these sessions? - Dont know"
	note issues_session__999: "What are the main issues discussed during these sessions? - Dont know"
	
	label variable issues_session__998 "What are the main issues discussed during these sessions? - Refuse"
	note issues_session__998: "What are the main issues discussed during these sessions? - Refuse"

	label define issues_session 1 "Yes" 0 "No"
	label values issues_session_1 issues_session_2 issues_session_3 issues_session_4 issues_session_5 issues_session_6 issues_session_7 issues_session__999 issues_session__998 issues_session
	
	label variable issues_session_other "Any other issue"
	note issues_session_other: "Any other issue"

	label variable continue_sessions "Do you think these sessions should be continued in schools?"
	note continue_sessions: "Do you think these sessions should be continued in schools? (Do not read the options out loud)"
	label define continue_sessions 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values continue_sessions continue_sessions

	label variable useful_sessions "How useful were learnings from these sessions for you? Rate the sessions on a scale of 1 to 10."
	note useful_sessions: "How useful were learnings from these sessions for you? Rate the sessions on a scale of 1 to 10 ( 1 - Least Useful and 10 - Most useful, Read the options out loud)."
	label define useful_sessions 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" -999 "Don't Know" -998 "Refuse"
	label values useful_sessions useful_sessions

	label variable video_van "A video van came to your school. How many times did you attend it?"
	note video_van: "A video van came to your school. How many times did you attend it?"
	label define video_van 1 "Never" 2 "Once" 3 "Twice" 4 "More than two times" -999 "Don't Know" -998 "Refuse"
	label values video_van video_van

	label variable healthcheckup "Have you received any health check-ups in the past year?"
	note healthcheckup: "Have you received any health check-ups in the past year?"
	label define healthcheckup 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values healthcheckup healthcheckup

	label variable bankaccount "Have you opened an account at a bank or post office in your name or jointly with"
	note bankaccount: "Have you opened an account at a bank or post office in your name or jointly with someone else in the last 2 years?"
	label define bankaccount 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values bankaccount bankaccount

	label variable freebooks "In the past year, have you received any free books from school?"
	note freebooks: "In the past year, have you received any free books from school?"
	label define freebooks 1 "Yes" 0 "No" -999 "Don't know" -998 "Refuse"
	label values freebooks freebooks

	label variable live_parents "Do you live with your parents?"
	note live_parents: "Do you live with your parents?"
	label define live_parents 1 "Yes, with both mother and father" 2 "Only father" 3 "Only mother" 4 "Don't live with either mother or father" -999 "Don't Know" -998 "Refuse"
	label values live_parents live_parents

	label variable sib_gender1 "Gender of the sibling"
	note sib_gender1: "Gender of the sibling"
	label define gender2 1 "Male" 2 "Female"
	label values sib_gender1 gender2
	
	label variable sib_relation1 "Relation of the sibling"
	note sib_relation1: "Relation of the sibling"
	label define relation 5 "Sister" 6 "Brother"
	label values sib_relation1 relation
	
	label variable sib_age1 "Sibling age at baseline"
	note sib_age1: "Sibling age at baseline"
	
	label variable sib_age1_3 "Sibling age at baseline +3"
	note sib_age1_3: "Sibling age at baseline +3 : This was done to verify the age at endline"
	
	label variable sib_alive1 "Is this sibling alive?"
	note sib_alive1: "Is this sibling alive?"
	label define sib_alive1 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_alive1 sib_alive1

	label variable sib_status1 "Marital status"
	note sib_status1: "Marital status"
	label define sib_status1 1 "Married" 2 "Never married" 3 "Married earlier but not anymore" -999 "Don't Know" -998 "Refuse"
	label values sib_status1 sib_status1

	label variable sib_school1 "Is this person enrolled in school?"
	note sib_school1: "Is this person enrolled in school?"
	label define sib_school1 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_school1 sib_school1

	label variable sib_edu_level1 "What is the highest education level they attained?"
	note sib_edu_level1: "What is the highest education level they attained?"
	label define sib_edu_level1 1 "Not literate" 2 "Literate" 3 "Primary" 4 "Class 8 (Middle)" 5 "Class 10 (Secondary)" 6 "Class 12 (Higher secondary)" 7 "Diploma/certificate course" 8 "Graduate" 9 "Started College but did not complete" 10 "Postgraduate and above" 11 "Other" -999 "Don't Know" -998 "Refuse"
	label values sib_edu_level1 sib_edu_level1

	label variable sib_class1 "What class are they currently in?"
	note sib_class1: "What class are they currently in?"

	label variable sib_same_sch1 "Do they go to the same school as you?"
	note sib_same_sch1: "Do they go to the same school as you?"
	label define sib_same_sch1 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_same_sch1 sib_same_sch1
	
	label variable sib_gender2 "Gender of the sibling"
	note sib_gender2: "Gender of the sibling"
	label values sib_gender2 gender2
	
	label variable sib_relation2 "Relation of the sibling"
	note sib_relation2: "Relation of the sibling"
	label values sib_relation2 relation
	
	label variable sib_age2 "Sibling age at baseline"
	note sib_age2: "Sibling age at baseline"
	
	label variable sib_age2_3 "Sibling age at baseline +3"
	note sib_age2_3: "Sibling age at baseline +3 : This was done to verify the age at endline"
	
	
	label variable sib_alive2 "Is this sibling alive?"
	note sib_alive2: "Is this sibling alive?"
	label define sib_alive2 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_alive2 sib_alive2

	label variable sib_status2 "New Marital status"
	note sib_status2: "New Marital status"
	label define sib_status2 1 "Married" 2 "Never married" 3 "Married earlier but not anymore" -999 "Don't Know" -998 "Refuse"
	label values sib_status2 sib_status2

	label variable sib_school2 "Is this person enrolled in school?"
	note sib_school2: "Is this person enrolled in school?"
	label define sib_school2 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_school2 sib_school2

	label variable sib_edu_level2 "What is the highest education level they attained?"
	note sib_edu_level2: "What is the highest education level they attained?"
	label define sib_edu_level2 1 "Not literate" 2 "Literate" 3 "Primary" 4 "Class 8 (Middle)" 5 "Class 10 (Secondary)" 6 "Class 12 (Higher secondary)" 7 "Diploma/certificate course" 8 "Graduate" 9 "Started College but did not complete" 10 "Postgraduate and above" 11 "Other" -999 "Don't Know" -998 "Refuse"
	label values sib_edu_level2 sib_edu_level2

	label variable sib_class2 "What class are they currently in?"
	note sib_class2: "What class are they currently in?"

	label variable sib_same_sch2 "Do they go to the same school as you?"
	note sib_same_sch2: "Do they go to the same school as you?"
	label define sib_same_sch2 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_same_sch2 sib_same_sch2
	
	label variable sib_gender3 "Gender of the sibling"
	note sib_gender3: "Gender of the sibling"
	label values sib_gender3 gender2
	
	label variable sib_relation3 "Relation of the sibling"
	note sib_relation3: "Relation of the sibling"
	label values sib_relation3 relation
	
	label variable sib_age3 "Sibling age at baseline"
	note sib_age3: "Sibling age at baseline"
	
	label variable sib_age3_3 "Sibling age at baseline +3"
	note sib_age3_3: "Sibling age at baseline +3 : This was done to verify the age at endline"
	

	label variable sib_alive3 "Is this sibling alive?"
	note sib_alive3: "Is this sibling alive?"
	label define sib_alive3 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_alive3 sib_alive3

	label variable sib_status3 "New Marital status"
	note sib_status3: "New Marital status"
	label define sib_status3 1 "Married" 2 "Never married" 3 "Married earlier but not anymore" -999 "Don't Know" -998 "Refuse"
	label values sib_status3 sib_status3

	label variable sib_school3 "Is this person enrolled in school?"
	note sib_school3: "Is this person enrolled in school?"
	label define sib_school3 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_school3 sib_school3

	label variable sib_edu_level3 "What is the highest education level they attained?"
	note sib_edu_level3: "What is the highest education level they attained?"
	label define sib_edu_level3 1 "Not literate" 2 "Literate" 3 "Primary" 4 "Class 8 (Middle)" 5 "Class 10 (Secondary)" 6 "Class 12 (Higher secondary)" 7 "Diploma/certificate course" 8 "Graduate" 9 "Started College but did not complete" 10 "Postgraduate and above" 11 "Other" -999 "Don't Know" -998 "Refuse"
	label values sib_edu_level3 sib_edu_level3

	label variable sib_class3 "What class are they currently in?"
	note sib_class3: "What class are they currently in?"

	label variable sib_same_sch3 "Do they go to the same school as you?"
	note sib_same_sch3: "Do they go to the same school as you?"
	label define sib_same_sch3 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_same_sch3 sib_same_sch3
	
	label variable sib_gender4 "Gender of the sibling"
	note sib_gender4: "Gender of the sibling"
	label values sib_gender4 gender2
	
	label variable sib_relation4 "Relation of the sibling"
	note sib_relation4: "Relation of the sibling"
	label values sib_relation4 relation
	
	label variable sib_age4 "Sibling age at baseline"
	note sib_age4: "Sibling age at baseline"
	
	label variable sib_age4_3 "Sibling age at baseline +3"
	note sib_age4_3: "Sibling age at baseline +3 : This was done to verify the age at endline"

	
	label variable sib_alive4 "Is this sibling alive?"
	note sib_alive4: "Is this sibling alive?"
	label define sib_alive4 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_alive4 sib_alive4

	label variable sib_status4 "New Marital status"
	note sib_status4: "New Marital status"
	label define sib_status4 1 "Married" 2 "Never married" 3 "Married earlier but not anymore" -999 "Don't Know" -998 "Refuse"
	label values sib_status4 sib_status4

	label variable sib_school4 "Is this person enrolled in school?"
	note sib_school4: "Is this person enrolled in school?"
	label define sib_school4 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_school4 sib_school4

	label variable sib_edu_level4 "What is the highest education level they attained?"
	note sib_edu_level4: "What is the highest education level they attained?"
	label define sib_edu_level4 1 "Not literate" 2 "Literate" 3 "Primary" 4 "Class 8 (Middle)" 5 "Class 10 (Secondary)" 6 "Class 12 (Higher secondary)" 7 "Diploma/certificate course" 8 "Graduate" 9 "Started College but did not complete" 10 "Postgraduate and above" 11 "Other" -999 "Don't Know" -998 "Refuse"
	label values sib_edu_level4 sib_edu_level4

	label variable sib_class4 "What class are they currently in?"
	note sib_class4: "What class are they currently in?"

	label variable sib_same_sch4 "Do they go to the same school as you?"
	note sib_same_sch4: "Do they go to the same school as you?"
	label define sib_same_sch4 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_same_sch4 sib_same_sch4
	
	label variable sib_gender5 "Gender of the sibling"
	note sib_gender5: "Gender of the sibling"
	label values sib_gender5 gender2
	
	label variable sib_relation5 "Relation of the sibling"
	note sib_relation5: "Relation of the sibling"
	label values sib_relation5 relation
	
	label variable sib_age5 "Sibling age at baseline"
	note sib_age5: "Sibling age at baseline"
	
	label variable sib_age5_3 "Sibling age at baseline +3"
	note sib_age5_3: "Sibling age at baseline +3 : This was done to verify the age at endline"

	label variable sib_alive5 "Is this sibling alive?"
	note sib_alive5: "Is this sibling alive?"
	label define sib_alive5 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_alive5 sib_alive5

	label variable sib_status5 "New Marital status"
	note sib_status5: "New Marital status"
	label define sib_status5 1 "Married" 2 "Never married" 3 "Married earlier but not anymore" -999 "Don't Know" -998 "Refuse"
	label values sib_status5 sib_status5

	label variable sib_school5 "Is this person enrolled in school?"
	note sib_school5: "Is this person enrolled in school?"
	label define sib_school5 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_school5 sib_school5

	label variable sib_edu_level5 "What is the highest education level they attained?"
	note sib_edu_level5: "What is the highest education level they attained?"
	label define sib_edu_level5 1 "Not literate" 2 "Literate" 3 "Primary" 4 "Class 8 (Middle)" 5 "Class 10 (Secondary)" 6 "Class 12 (Higher secondary)" 7 "Diploma/certificate course" 8 "Graduate" 9 "Started College but did not complete" 10 "Postgraduate and above" 11 "Other" -999 "Don't Know" -998 "Refuse"
	label values sib_edu_level5 sib_edu_level5

	label variable sib_class5 "What class are they currently in?"
	note sib_class5: "What class are they currently in?"

	label variable sib_same_sch5 "Do they go to the same school as you?"
	note sib_same_sch5: "Do they go to the same school as you?"
	label define sib_same_sch5 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_same_sch5 sib_same_sch5
	
	label variable sib_gender6 "Gender of the sibling"
	note sib_gender6: "Gender of the sibling"
	label values sib_gender6 gender2
	
	label variable sib_relation6 "Relation of the sibling"
	note sib_relation6: "Relation of the sibling"
	label values sib_relation6 relation
	
	label variable sib_age6 "Sibling age at baseline"
	note sib_age6: "Sibling age at baseline"
	
	label variable sib_age6_3 "Sibling age at baseline +3"
	note sib_age6_3: "Sibling age at baseline +3 : This was done to verify the age at endline"
	
	label variable sib_alive6 "Is this sibling alive?"
	note sib_alive6: "Is this sibling alive?"
	label define sib_alive6 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_alive6 sib_alive6

	label variable sib_status6 "New Marital status"
	note sib_status6: "New Marital status"
	label define sib_status6 1 "Married" 2 "Never married" 3 "Married earlier but not anymore" -999 "Don't Know" -998 "Refuse"
	label values sib_status6 sib_status6

	label variable sib_school6 "Is this person enrolled in school?"
	note sib_school6: "Is this person enrolled in school?"
	label define sib_school6 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_school6 sib_school6

	label variable sib_edu_level6 "What is the highest education level they attained?"
	note sib_edu_level6: "What is the highest education level they attained?"
	label define sib_edu_level6 1 "Not literate" 2 "Literate" 3 "Primary" 4 "Class 8 (Middle)" 5 "Class 10 (Secondary)" 6 "Class 12 (Higher secondary)" 7 "Diploma/certificate course" 8 "Graduate" 9 "Started College but did not complete" 10 "Postgraduate and above" 11 "Other" -999 "Don't Know" -998 "Refuse"
	label values sib_edu_level6 sib_edu_level6

	label variable sib_class6 "What class are they currently in?"
	note sib_class6: "What class are they currently in?"

	label variable sib_same_sch6 "Do they go to the same school as you?"
	note sib_same_sch6: "Do they go to the same school as you?"
	label define sib_same_sch6 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_same_sch6 sib_same_sch6
	
	label variable sib_gender7 "Gender of the sibling"
	note sib_gender7: "Gender of the sibling"
	label values sib_gender7 gender2
	
	label variable sib_relation7 "Relation of the sibling"
	note sib_relation7: "Relation of the sibling"
	label values sib_relation7 relation
	
	label variable sib_age7 "Sibling age at baseline"
	note sib_age7: "Sibling age at baseline"
	
	label variable sib_age7_3 "Sibling age at baseline +3"
	note sib_age7_3: "Sibling age at baseline +3 : This was done to verify the age at endline"

	label variable sib_alive7 "Is this sibling alive?"
	note sib_alive7: "Is this sibling alive?"
	label define sib_alive7 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_alive7 sib_alive7

	label variable sib_status7 "New Marital status"
	note sib_status7: "New Marital status"
	label define sib_status7 1 "Married" 2 "Never married" 3 "Married earlier but not anymore" -999 "Don't Know" -998 "Refuse"
	label values sib_status7 sib_status7

	label variable sib_school7 "Is this person enrolled in school?"
	note sib_school7: "Is this person enrolled in school?"
	label define sib_school7 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_school7 sib_school7

	label variable sib_edu_level7 "What is the highest education level they attained?"
	note sib_edu_level7: "What is the highest education level they attained?"
	label define sib_edu_level7 1 "Not literate" 2 "Literate" 3 "Primary" 4 "Class 8 (Middle)" 5 "Class 10 (Secondary)" 6 "Class 12 (Higher secondary)" 7 "Diploma/certificate course" 8 "Graduate" 9 "Started College but did not complete" 10 "Postgraduate and above" 11 "Other" -999 "Don't Know" -998 "Refuse"
	label values sib_edu_level7 sib_edu_level7

	label variable sib_class7 "What class are they currently in?"
	note sib_class7: "What class are they currently in?"

	label variable sib_same_sch7 "Do they go to the same school as you?"
	note sib_same_sch7: "Do they go to the same school as you?"
	label define sib_same_sch7 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_same_sch7 sib_same_sch7
	
	label variable sib_gender8 "Gender of the sibling"
	note sib_gender8: "Gender of the sibling"
	label values sib_gender8 gender2
	
	label variable sib_relation8 "Relation of the sibling"
	note sib_relation8: "Relation of the sibling"
	label values sib_relation8 relation
	
	label variable sib_age8 "Sibling age at baseline"
	note sib_age8: "Sibling age at baseline"
	
	label variable sib_age8_3 "Sibling age at baseline +3"
	note sib_age8_3: "Sibling age at baseline +3 : This was done to verify the age at endline"
	
	label variable sib_alive8 "Is this sibling alive?"
	note sib_alive8: "Is this sibling alive?"
	label define sib_alive8 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_alive8 sib_alive8

	label variable sib_status8 "New Marital status"
	note sib_status8: "New Marital status"
	label define sib_status8 1 "Married" 2 "Never married" 3 "Married earlier but not anymore" -999 "Don't Know" -998 "Refuse"
	label values sib_status8 sib_status8

	label variable sib_school8 "Is this person enrolled in school?"
	note sib_school8: "Is this person enrolled in school?"
	label define sib_school8 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_school8 sib_school8

	label variable sib_edu_level8 "What is the highest education level they attained?"
	note sib_edu_level8: "What is the highest education level they attained?"
	label define sib_edu_level8 1 "Not literate" 2 "Literate" 3 "Primary" 4 "Class 8 (Middle)" 5 "Class 10 (Secondary)" 6 "Class 12 (Higher secondary)" 7 "Diploma/certificate course" 8 "Graduate" 9 "Started College but did not complete" 10 "Postgraduate and above" 11 "Other" -999 "Don't Know" -998 "Refuse"
	label values sib_edu_level8 sib_edu_level8

	label variable sib_class8 "What class are they currently in?"
	note sib_class8: "What class are they currently in?"

	label variable sib_same_sch8 "Do they go to the same school as you?"
	note sib_same_sch8: "Do they go to the same school as you?"
	label define sib_same_sch8 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_same_sch8 sib_same_sch8
	
	label variable sib_gender9 "Gender of the sibling"
	note sib_gender9: "Gender of the sibling"
	label values sib_gender9 gender2
	
	label variable sib_relation9 "Relation of the sibling"
	note sib_relation9: "Relation of the sibling"
	label values sib_relation9 relation
	
	label variable sib_age9 "Sibling age at baseline"
	note sib_age9: "Sibling age at baseline"
	
	label variable sib_age9_3 "Sibling age at baseline +3"
	note sib_age9_3: "Sibling age at baseline +3 : This was done to verify the age at endline"
	
	label variable sib_alive9 "Is this sibling alive?"
	note sib_alive9: "Is this sibling alive?"
	label define sib_alive9 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_alive9 sib_alive9

	label variable sib_status9 "New Marital status"
	note sib_status9: "New Marital status"
	label define sib_status9 1 "Married" 2 "Never married" 3 "Married earlier but not anymore" -999 "Don't Know" -998 "Refuse"
	label values sib_status9 sib_status9

	label variable sib_school9 "Is this person enrolled in school?"
	note sib_school9: "Is this person enrolled in school?"
	label define sib_school9 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_school9 sib_school9

	label variable sib_edu_level9 "What is the highest education level they attained?"
	note sib_edu_level9: "What is the highest education level they attained?"
	label define sib_edu_level9 1 "Not literate" 2 "Literate" 3 "Primary" 4 "Class 8 (Middle)" 5 "Class 10 (Secondary)" 6 "Class 12 (Higher secondary)" 7 "Diploma/certificate course" 8 "Graduate" 9 "Started College but did not complete" 10 "Postgraduate and above" 11 "Other" -999 "Don't Know" -998 "Refuse"
	label values sib_edu_level9 sib_edu_level9

	label variable sib_class9 "What class are they currently in?"
	note sib_class9: "What class are they currently in?"

	label variable sib_same_sch9 "Do they go to the same school as you?"
	note sib_same_sch9: "Do they go to the same school as you?"
	label define sib_same_sch9 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_same_sch9 sib_same_sch9
	
	label variable sib_gender10 "Gender of the sibling"
	note sib_gender10: "Gender of the sibling"
	label values sib_gender10 gender2
	
	label variable sib_relation10 "Relation of the sibling"
	note sib_relation10: "Relation of the sibling"
	label values sib_relation10 relation
	
	label variable sib_age10 "Sibling age at baseline"
	note sib_age10: "Sibling age at baseline"
	
	label variable sib_age10_3 "Sibling age at baseline +3"
	note sib_age10_3: "Sibling age at baseline +3 : This was done to verify the age at endline"
	
	label variable sib_alive10 "Is this sibling alive?"
	note sib_alive10: "Is this sibling alive?"
	label define sib_alive10 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_alive10 sib_alive10

	label variable sib_status10 "New Marital status"
	note sib_status10: "New Marital status"
	label define sib_status10 1 "Married" 2 "Never married" 3 "Married earlier but not anymore" -999 "Don't Know" -998 "Refuse"
	label values sib_status10 sib_status10

	label variable sib_school10 "Is this person enrolled in school?"
	note sib_school10: "Is this person enrolled in school?"
	label define sib_school10 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_school10 sib_school10

	label variable sib_edu_level10 "What is the highest education level they attained?"
	note sib_edu_level10: "What is the highest education level they attained?"
	label define sib_edu_level10 1 "Not literate" 2 "Literate" 3 "Primary" 4 "Class 8 (Middle)" 5 "Class 10 (Secondary)" 6 "Class 12 (Higher secondary)" 7 "Diploma/certificate course" 8 "Graduate" 9 "Started College but did not complete" 10 "Postgraduate and above" 11 "Other" -999 "Don't Know" -998 "Refuse"
	label values sib_edu_level10 sib_edu_level10

	label variable sib_class10 "What class are they currently in?"
	note sib_class10: "What class are they currently in?"

	label variable sib_same_sch10 "Do they go to the same school as you?"
	note sib_same_sch10: "Do they go to the same school as you?"
	label define sib_same_sch10 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_same_sch10 sib_same_sch10
	
	label variable sib_gender11 "Gender of the sibling"
	note sib_gender11: "Gender of the sibling"
	label values sib_gender11 gender2
	
	label variable sib_relation11 "Relation of the sibling"
	note sib_relation11: "Relation of the sibling"
	label values sib_relation11 relation
	
	label variable sib_age11 "Sibling age at baseline"
	note sib_age11: "Sibling age at baseline"
	
	label variable sib_age11_3 "Sibling age at baseline +3"
	note sib_age11_3: "Sibling age at baseline +3 : This was done to verify the age at endline"
	
	label variable sib_alive11 "Is this sibling alive?"
	note sib_alive11: "Is this sibling alive?"
	label define sib_alive11 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_alive11 sib_alive11

	label variable sib_status11 "New Marital status"
	note sib_status11: "New Marital status"
	label define sib_status11 1 "Married" 2 "Never married" 3 "Married earlier but not anymore" -999 "Don't Know" -998 "Refuse"
	label values sib_status11 sib_status11

	label variable sib_school11 "Is this person enrolled in school?"
	note sib_school11: "Is this person enrolled in school?"
	label define sib_school11 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_school11 sib_school11

	label variable sib_edu_level11 "What is the highest education level they attained?"
	note sib_edu_level11: "What is the highest education level they attained?"
	label define sib_edu_level11 1 "Not literate" 2 "Literate" 3 "Primary" 4 "Class 8 (Middle)" 5 "Class 10 (Secondary)" 6 "Class 12 (Higher secondary)" 7 "Diploma/certificate course" 8 "Graduate" 9 "Started College but did not complete" 10 "Postgraduate and above" 11 "Other" -999 "Don't Know" -998 "Refuse"
	label values sib_edu_level11 sib_edu_level11

	label variable sib_class11 "What class are they currently in?"
	note sib_class11: "What class are they currently in?"

	label variable sib_same_sch11 "Do they go to the same school as you?"
	note sib_same_sch11: "Do they go to the same school as you?"
	label define sib_same_sch11 1 "Yes" 0 "No" -998 "Refuse"
	label values sib_same_sch11 sib_same_sch11

	label variable new_sib_add "Do you want to add a new sibling?"
	note new_sib_add: "Do you want to add a new sibling?"
	label define new_sib_add 1 "Yes" 0 "No" -998 "Refuse"
	label values new_sib_add new_sib_add

	label variable place_of_interview "Where was this interview conducted?"
	note place_of_interview: "Where was this interview conducted?"
	label define place_of_interview 1 "School" 2 "Home" 3 "Over the phone" -999 "Don't Know"
	label values place_of_interview place_of_interview

	label variable five_point_scale "To what extent did the student understand the five point scale?"
	note five_point_scale: "To what extent did the student understand the five point scale?"
	label define five_point_scale 1 "Poor" 2 "Fair" 3 "Good" 4 "Very Good" 5 "Excellent" -999 "Don't Know"
	label values five_point_scale five_point_scale

	label variable focus_survey "How focused was the student during the survey?"
	note focus_survey: "How focused was the student during the survey?"
	label define focus_survey 1 "Completely Unfocused" 2 "Slightly Unfocused" 3 "Neutral" 4 "Slightly Focused" 5 "Completely Focused" -999 "Don't Know"
	label values focus_survey focus_survey

	label variable understand_ques "To what extent did the student understand the questions?"
	note understand_ques: "To what extent did the student understand the questions?"
	label define understand_ques 1 "Always" 2 "Often" 3 "Sometimes" 4 "Rarely" 5 "Never" -999 "Don't Know"
	label values understand_ques understand_ques

	label variable present_interview "Who was present while you were conducting the survey?"
	note present_interview: "Who was present while you were conducting the survey?"
	label define present_interview 1 "Supervisor" 2 "Monitor" 3 "PA" 4 "RSC" 5 "RA" 6 "No one was present"
	label values present_interview present_interview
	
	capture {
		foreach rgvar of varlist new_sib_gender* {
			label variable `rgvar' "Gender"
			note `rgvar': "Gender"
			label define `rgvar' 1 "Male" 2 "Female" -998 "Refuse"
			label values `rgvar' `rgvar'
		}
	}

	capture {
		foreach rgvar of varlist new_sib_relation* {
			label variable `rgvar' "Relation of the sibling"
			note `rgvar': "Relation of the sibling"
			label define `rgvar' 6 "Brother" 5 "Sister" -998 "Refuse"
			label values `rgvar' `rgvar'
		}
	}

	capture {
		foreach rgvar of varlist new_sib_age* {
			label variable `rgvar' "Age (years)"
			note `rgvar': "Age (years)"
		}
	}

	capture {
		foreach rgvar of varlist new_sib_status* {
			label variable `rgvar' "Marital status"
			note `rgvar': "Marital status"
			label define `rgvar' 1 "Married" 2 "Never married" 3 "Married earlier but not anymore" -999 "Don't Know" -998 "Refuse"
			label values `rgvar' `rgvar'
		}
	}

	capture {
		foreach rgvar of varlist new_sib_school* {
			label variable `rgvar' "Is this person enrolled in school?"
			note `rgvar': "Is this person enrolled in school?"
			label define `rgvar' 1 "Yes" 0 "No" -998 "Refuse"
			label values `rgvar' `rgvar'
		}
	}

	capture {
		foreach rgvar of varlist sib_edu_level_* {
			ren `rgvar' new_`rgvar'
			label variable new_`rgvar' "What is the highest education level they attained?"
			note new_`rgvar': "What is the highest education level they attained?"
			label define `rgvar' 1 "Not literate" 2 "Literate" 3 "Primary" 4 "Class 8 (Middle)" 5 "Class 10 (Secondary)" 6 "Class 12 (Higher secondary)" 7 "Diploma/certificate course" 8 "Graduate" 9 "Started College but did not complete" 10 "Postgraduate and above" 11 "Other" -999 "Don't Know" -998 "Refuse"
			label values new_`rgvar' `rgvar'
		}
	}

	capture {
		foreach rgvar of varlist new_sib_class* {
			label variable `rgvar' "What class are they currently in?"
			note `rgvar': "What class are they currently in?"
		}
	}

	capture {
		foreach rgvar of varlist new_sib_same_sch* {
			label variable `rgvar' "Do they go to the same school as you?"
			note `rgvar': "Do they go to the same school as you?"
			label define `rgvar' 1 "Yes" 0 "No" -998 "Refuse"
			label values `rgvar' `rgvar'
		}
	}


	label var child_married "Is the child married"
	note child_married: "Is the child married"
	label define child_married 1 "Yes" 0 "No" -998 "Refuse"
	label values child_married child_married

