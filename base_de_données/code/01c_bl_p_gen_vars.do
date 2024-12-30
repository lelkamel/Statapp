* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
* Project: Breakthrough (BT)                                          *
* Purpose: Generating relevant dummies				              	  *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 


destring school_id, replace
drop school_id_entered child_id_entered


** Survey success variables

gen survey_attempted=1
label var survey_attempted "Attempted to survey"
gen survey_success=inlist(AB_merge,3,4)
replace survey_success=0 if parent_present != 1
replace survey_success=0 if parent_consent != 1
replace survey_success=0 if parent_disability <4
replace survey_success=0 if wrong_parent_surveyed==1
label var survey_success "Successfully surveyed"



** district

forval x=1/4{
	local dist: label district `x'
	local var=lower("`dist'")
	gen `var'=district==`x'
	label var `var' "`dist'"
}
order panipat sonipat rohtak jhajjar, after(district)




** Parent gender

// changes based on "Changes to be made 11th April.xlsx"
replace gender=2 if inlist(child_id,1111055,1113057,1113065,1115010,1115029,1115075,1115112,1119002,1119005,1119020,3410147,3416002,4201010)
replace relation=2 if inlist(child_id,1111055,1113057,1113065,1115010,1115029,1115075,1115112,1119002,1119005,1119020,3410147,3416002,4201010)
replace assigned_parent="Mother" if inlist(child_id,1111055,1113057,1113065,1115010,1115029,1115075,1115112,1119002,1119005,1119020,3410147,3416002,4201010)

replace assigned_parent="Father" if inlist(child_id,2110057,2110070,3407035,3416090)
replace assigned_parent="Mother" if inlist(child_id,2112049,2122032,3109035)
replace relation=1 if inlist(child_id,3407035,2110070)


// changes based on wrong_parent_comments.xls 

replace gender=gender-1 if inlist(child_id,1110086,1112021,1114126,1202090,1208003,1209092,1212080,1308058,1403045,1509066,2104013,2107071,2109152,2114156,2118052,2119061,2401074,2506010,2616100,3111099,3403049,3403076,3412033,3416011,3508014,4203053,4207007,4413012)
replace gender=2 if gender==0 & inlist(child_id,1110086,1112021,1114126,1202090,1208003,1209092,1212080,1308058,1403045,1509066,2104013,2107071,2109152,2114156,2118052,2119061,2401074,2506010,2616100,3111099,3403049,3403076,3412033,3416011,3508014,4203053,4207007,4413012)
 
replace gender=gender-1 if inlist(child_id,1104152,1104073,1108154,1111120,1119028,1119070,1201012,1304063,2101051,2103026,2104035,2104042,2106020,2106024,2107030,2214038,2302031,2405001,2518068,2616063,3104055,3107018,3114039,3118025,3119134,3504030,4207008,4215011,4219057,4413062,4505030)
replace gender=2 if gender==0 & inlist(child_id,1104152,1104073,1108154,1111120,1119028,1119070,1201012,1304063,2101051,2103026,2104035,2104042,2106020,2106024,2107030,2214038,2302031,2405001,2518068,2616063,3104055,3107018,3114039,3118025,3119134,3504030,4207008,4215011,4219057,4413062,4505030)

replace relation=1 if gender==1 & relation==2 & inlist(child_id,1104152,1104073,1108154,1111120,1119028,1119070,1201012,1304063,2101051,2103026,2104035,2104042,2106020,2106024,2107030,2214038,2302031,2405001,2518068,2616063,3104055,3107018,3114039,3118025,3119134,3504030,4207008,4215011,4219057,4413062,4505030)
replace relation=2 if gender==2 & relation==1 & inlist(child_id,1104152,1104073,1108154,1111120,1119028,1119070,1201012,1304063,2101051,2103026,2104035,2104042,2106020,2106024,2107030,2214038,2302031,2405001,2518068,2616063,3104055,3107018,3114039,3118025,3119134,3504030,4207008,4215011,4219057,4413062,4505030)

replace gender=2 if child_id==1317149


// change relation based on parent names and logical inconsistency
replace relation=1 if inlist(child_id,1211016,1409058,2105074,2106016,2109002,2112058,2115076,2407011,2608031,2608053,2616101,3206005,3209044,3417032,3424005,4213065,4405015) & gender==1 & inlist(relation,2,4)
replace relation=2 if inlist(child_id,1109011,1119001,1201018,1405022,1411102,1413073,1505046,2115050,3103093,3307031,3412084,3418006,3506062) & gender==2 & inlist(relation,1,3)
replace gender=1 if child_id==3314014 & relation==1


gen father=gender==1 if !mi(gender)
label define father 1 "Fathers" 0 "Mothers"
label values father father
label var father "Father"


gen mother=gender==2 if !mi(gender)
label define mother 1 "Mothers" 0 "Fathers"
label values mother mother
label var mother "Mother"


** Parent's age

gen age=parent_age
replace age=. if !inrange(age,21,70)
label var age "Parent's age"
replace spouse_age=. if !inrange(spouse_age,21,70)
label var spouse_age "Spouse's age"


** Studied

replace studied=11 if studied>11 & !mi(studied)
label define grp14b10_far_studied 11 "Other" 12 "" 13 "" 14 "" 15 "" 16 "", modify
label var studied "Parent's level of education"


** durables

foreach x of varlist hh_durables_*{
	replace `x'=. if hh_durables=="997"
	local varlab: variable label `x'
	label var `x' "Household owns: `varlab'"
}


** Caste 


replace caste=20 if inlist(caste,19) 
replace caste=. if caste==18
label define grp15caste 18 "" 19 "" 997 "" , modify
label var caste "Parent's caste"


gen caste_sc=inlist(caste,16) if !mi(caste)
label var caste_sc "Scheduled caste"


gen caste_st=inlist(caste,17) if !mi(caste)
label var caste_st "Scheduled tribe"

order caste_sc caste_st, after(caste)



** Parent education





gen illiterate=inlist(studied,1) if studied<11
gen primary=inlist(studied,2,3) if studied<11
gen secondary=inlist(studied,4,5) if studied<11
gen highedu=inlist(studied,6,7,8,9,10) if studied<11

label var illiterate "Illiterate"
label var primary "Primary school"
label var secondary "Secondary school"
label var highedu "Class 12 or higher"

order  illiterate primary secondary highedu, after(studied)


** No income

foreach x of varlist occupation_1-occupation_11{
	replace `x'=0 if occupation_12==1   // if answered no occupation, do not count other occupation
}


** Mother tongue

rename mother_toungue mother_tongue
label define grp16c1_mother_tongue 6 "Other" , modify
label var mother_tongue "Parent's mother tongue"



** Residence details

gen own_house=houses_owned>=2 if !mi(houses_owned)
label var own_house "Household owns one or more houses"
order own_house, after(houses_owned)

gen own_land=land_owned==1 if !mi(land_owned)
label var own_land "Household owns some land"
order own_land, after(land_owned)



** Plans for child


recode fin_ability_highest_edu (1=7) (2=8) (3=9) (4=10) (5=12) (6=13) (7=14) (8=15) (9=16) (10=.) (11=.), gen(high_level_edu)
label var high_level_edu "Desired level of completed education for child"

gen marry_age_girl2=marry_age_girl_yy if inrange(marry_age_girl_yy,10,40)
label var marry_age_girl2 "Desired age of marriage for daughters"

gen marry_age_boy2=marry_age_boy_yy if inrange(marry_age_boy_yy,10,40)
label var marry_age_boy2 "Desired age of marriage for sons"


foreach x of varlist parent_occupation_25yy_*{
	replace `x'=. if parent_occupation_25yy=="997"
	local varlab: variable label `x'
	label var `x' "Child's expected occupation at age 25: `varlab'"
}

rename parent_occupation* p_occu*

replace parent_num_child=0 if parent_num_child==8
label define grp52_1num_child 0 "0" 8 "", modify

gen parent_imp_sch_resp_y=inlist(parent_imp_sch_resp,1,2) if !mi(parent_imp_sch_resp)
label var parent_imp_sch_resp_y "Child's school-based duties more important than family-based ones"

gen often_read_y=inlist(often_read,1,2,3,4) if !mi(often_read)
label var often_read_y "Parent reads books, magazines, etc. more than a few times a month"


** Decisions

label var deci_cook "what to cook on daily basis"
label var deci_tv "whether to buy expensive items for home like TV, etc."
label var deci_buy_new "whether to buy investment goods like tractor, etc."
label var deci_child_sch "which school to send the child"
label var deci_spend_edu "how much to spend on a child's education"
label var deci_taken_dr "whether children should be taken to a doctor"
label var deci_child_cloth "whether to buy new clothes for children"
label var deci_child_books "whether to buy new books for children"
label var deci_have_child "whether to have a child or not"

foreach x of varlist deci_cook deci_tv deci_buy_new deci_child_sch deci_spend_edu deci_taken_dr deci_child_cloth deci_child_books deci_have_child{
	gen `x'_y=inlist(`x',1,3)
	local varlab: variable label `x'
	label var `x'_y "Mother has a say in: `varlab'"
	order `x'_y, after(`x')
}

** Gender view

label var parent_woman_role "A woman's most important role is being a good homemaker"
label var parent_man_final_deci "A man should have the final word about decisions in his home"
label var parent_woman_tol_viol "A woman should tolerate violence to keep her family together"
label var parent_equal_opps "Men and women should get equal opportunities in all spheres of life"
label var parent_easier_man "For the most part, it is easier to be a man than to be a woman"
label var parent_ghunghat_girl "A Ghunghat is needed for married girls when they are going outside."
label var parent_wives_less_edu "Wives should be less educated than their husbands"
label var parent_girl_allow_study "Girls should be allowed to study as far as they want"
label var parent_similar_right "Daughters should have a similar right to inherited property as sons."
label var parent_boy_more_opps "Boys should get more opportunities/ resources for education than girls"
label var parent_marry_opinion "Children can have an opinion in deciding who to marry"
label var parent_dowry_girl_marriage "Parents should give dowry for their girl's marriage"
label var parent_elect_woman "It would be a good idea to elect a woman as the village Sarpanch"
label var son_property "Sons are required to keep property within the family"
label var son_lineage "Sons keep the family lineage going"
label var son_earn_more "Sons earn more money and can better provide for the family"
label var daugh_leave_fam "Daughters marry and leave the family, hence not as useful"
label var son_care_old "Sons marry and stay with their parents, providing care in old-age"
label var pay_receive_dowry "When daughters marry, parents pay a dowry, unlike the case w/ sons"
label var son_imp_pyre "A son is important for religious reasons such as lighting the funeral pyre."
label var son_in_law_satisfy "Having a son is important; my parents and in-laws will be satisfied"
label var girl_risk_others "Girls' mobility should be restricted for their safety"
label var society_boy_girl "Society determines how we should behave towards boys and girls"
label var cult_diff_role "Tradition and culture say that men and women have different roles in society"


foreach x of varlist parent_woman_role parent_man_final_deci parent_woman_tol_viol parent_equal_opps parent_easier_man parent_ghunghat_girl parent_wives_less_edu parent_girl_allow_study parent_similar_right parent_boy_more_opps parent_marry_opinion parent_dowry_girl_marriage parent_elect_woman ///
	son_property son_lineage son_earn_more daugh_leave_fam son_care_old pay_receive_dowry son_imp_pyre son_in_law_satisfy girl_risk_others society_boy_girl cult_diff_role{
	gen `x'_y=inlist(`x',1,2) if !mi(`x')
	local varlab: variable label `x'
	label var `x'_y "`varlab'"
	order `x'_y, after(`x')
}



// Generate dummies based on gender norm opinion vars

foreach x in parent_woman_role parent_man_final_deci parent_woman_tol_viol parent_ghunghat_girl parent_wives_less_edu parent_boy_more_opps parent_dowry_girl_marriage son_property son_lineage son_earn_more daugh_leave_fam son_care_old pay_receive_dowry son_imp_pyre son_in_law_satisfy girl_risk_others society_boy_girl cult_diff_role{
	gen `x'_n=`x'>=4 if !mi(`x')
	local varlab: variable label `x'_y
	label var `x'_n "Disagree: `varlab'"
	order `x'_n, after(`x'_y)
}





foreach x of varlist pcpndt_act learn_before_born fam_learn_boy_girl alone_relative alone_friend market_friend alone_market atten_events atten_events_alone disc_edu_goals allow_new_fashion allow_wear_any_dress{
	replace `x'=0 if `x'==2 
	replace `x'=. if !inlist(`x',1,0)
	label define `x' 0 "No" 1 "Yes", replace
	label values `x' `x'
}


gen approve_learn_bg_n=approve_learn_bg==5 if !mi(approve_learn_bg)

foreach x of varlist prefer_child_sex other_child_sex{
	replace `x'=. if !inrange(`x',1,5)
}
 
label var pcpndt_act "Has ever heard of the PCPNDT Act"
label var learn_before_born "It is possible to learn the baby's sex before birth"
label var fam_learn_boy_girl "(if yes to the above) there are families who try to learn the fetus' sex"
label var approve_learn_bg_n "I never approve of families trying to find out the fetus' sex"
label var prefer_child_sex "It is understandable to end a pregnancy for a baby that was the wrong sex"
label var other_child_sex "For a couple with two girls wanting a son, it is a good to have a third child"
label var alone_relative "Allow girls to go alone to a relative's house in the village"
label var alone_friend "Allow girls to go alone to meet their friends for any reason"
label var market_friend "Allow girls to go to the market to buy personal items without guardians"
label var alone_market "Allow girls to go to the market to buy personal items alone"
label var atten_events "Allow girls to attend any sort of community events /activities"
label var atten_events_alone "(If yes above) Allow girls to attend such events without guardians"
label var disc_edu_goals "Allow girls to discuss their education goals in home"
label var allow_new_fashion "Allow girls to wear some of these modern fashions"
label var allow_wear_any_dress "(If yes above) Allow girls to wear any dress they want"


** Chores

foreach x of varlist girl_help_cook girl_help_clean girl_help_clean_home girl_help_laundry girl_help_get_water girl_help_care_child girl_help_care_old girl_help_care_cattle girl_help_farming girl_help_get_groce boy_help_cook boy_help_clean boy_help_clean_home boy_help_laundry boy_help_get_water boy_help_care_child boy_help_care_old boy_help_care_cattle boy_help_farming boy_help_get_groce{
	assert inlist(`x',1,2,3) if !mi(`x')
	replace `x'=0 if `x'==2
	replace `x'=.a if `x'==3
	label define `x' 0 "No" 1 "Yes" , replace
	label values `x' `x'
	if regexm("`x'","girl") local child Girl
	if regexm("`x'","boy") local child Boy
	local varlab: variable label `x'
	label var `x' "`child' helps with: `x'"
}


** Khap

gen parent_khap_work_y=parent_khap_work==parent_khap_work!=3 if !mi(parent_khap_work)
label var parent_khap_work_y "Parent has ever heard about Khap"



** Vignette

foreach x of varlist woman_resp_inci{
	replace `x'=. if !inrange(`x',1,5)
}

gen woman_resp_inci_y=inlist(woman_resp_inci,1,2) if !mi(woman_resp_inci)
gen woman_resp_inci_n=inlist(woman_resp_inci,4,5) if !mi(woman_resp_inci)

foreach x of varlist agree_1 agree_2 agree_3 agree_4 agree_5{
	replace `x'=. if agree=="997"
	gen dis`x'=1-`x'
	order dis`x', after(`x')
	local varlab: variable label `x'
	label var dis`x' "Disagree: `varlab'"
}

foreach x of varlist girl_do_after_inci_1 girl_do_after_inci_2 girl_do_after_inci_3{
	replace `x'=. if girl_do_after_inci=="997"
}


foreach x of varlist how_inci_reduced_1 how_inci_reduced_2 how_inci_reduced_3 how_inci_reduced_4 how_inci_reduced_5{
	replace `x'=. if how_inci_reduced=="997"
}






label var woman_resp_inci_y "Woman was responsible for the incident"
label var woman_resp_inci_n "Disagrees woman was responsible for the incident"
label var agree_1 "Woman was not responsible in any way"
label var agree_2 "Woman chose a job which kept her out of home late at night"
label var agree_4 "Woman was accompanied by a man who was neither her husband nor a relative"
label var agree_5 "Woman should have been more careful about choosing the cab"
label var girl_do_after_inci_1 "Woman should go to the police, media, women's group"
label var girl_do_after_inci_2 "Woman should go to family and let them make the decision"
label var girl_do_after_inci_3 "Woman should keep the matter private"
label var how_inci_reduced_1 "Women should avoid working during these hours"
label var how_inci_reduced_2 "Families should restrict women from wearing dresses"
label var how_inci_reduced_3 "Families should restrict girls from coming home late at night"
label var how_inci_reduced_4 "The gov't should increase punishments for the guilty"
label var how_inci_reduced_5 "The gov't should conduct awareness campaigns to promote gender equality"

foreach x of varlist girl_do_after_inci_2 girl_do_after_inci_3 how_inci_reduced_1 how_inci_reduced_2 how_inci_reduced_3{ 
	gen `x'_no=1-`x'
	order `x'_no, after(`x')
	local varlab: variable label `x'
	label var `x'_no "Disagree: `varlab'"	
}

foreach x in parent_imp_sch_resp often_read approve_learn_bg parent_khap_work woman_resp_inci{
	order `x'_*, after(`x')
}

** Number of children desired

gen hypo_sons = real(val_x)
gen hypo_tfr = real(val_n)
label var hypo_tfr "Specified hypothetical number of children"
label var hypo_sons "Desired number of sons at hypo fertility"


gen ideal_tfr=parent_num_child
label var ideal_tfr "Ideal number of children"
replace ideal_tfr = . if ideal_tfr > 8

gen ideal_tfr_sq = ideal_tfr^2
label var ideal_tfr_sq "Ideal number of children, squared"


rename parent_choose_num_boys ideal_boys
rename parent_choose_num_girls ideal_girls
rename parent_either_bg ideal_either

gen ideal_tfr2 = ideal_boys + ideal_girls + ideal_either
replace ideal_tfr2 = 7 if ideal_tfr2 > 7 & !mi(ideal_tfr2) & ideal_tfr==7  // Because we top-coded the ideal tfr question at 6, we run into problems for those that want more than 6
replace ideal_tfr2=. if ideal_tfr2 > 7 & !mi(ideal_tfr2)  & ideal_tfr<7
replace ideal_tfr2=0 if ideal_tfr==0

count if ideal_tfr!=ideal_tfr2 & !mi(ideal_tfr,ideal_tfr2)
gen temp=ideal_boys+ideal_girls
replace ideal_either=0 if ideal_tfr!=ideal_tfr2 & !mi(ideal_tfr,ideal_tfr2) & temp==ideal_tfr
replace ideal_tfr2=ideal_tfr if ideal_tfr!=ideal_tfr2 & !mi(ideal_tfr,ideal_tfr2) & temp==ideal_tfr
replace ideal_tfr=. if ideal_tfr!=ideal_tfr2 & !mi(ideal_tfr,ideal_tfr2) & temp!=ideal_tfr



foreach x of varlist ideal_boys ideal_girls ideal_either{
	replace `x'=. if mi(ideal_tfr) | mi(ideal_tfr2)
}

gen ideal_tfr3 = ideal_boys + ideal_girls + ideal_either
assert ideal_tfr3==ideal_tfr if ideal_tfr!=7 & !mi(ideal_tfr3)

gen ideal_pct_sons = (ideal_boys + ideal_either/2)/ideal_tfr3
gen hypo_pct_sons=hypo_sons/hypo_tfr
drop temp ideal_tfr2 ideal_tfr3

label var hypo_pct_sons "% sons desired at hypothetical family size"
label var ideal_pct_sons "% sons desired at ideal family size"

gen count=1 if survey_success==1
bysort school_id: egen total = count(count) // Total number of households completed per school (village)
label variable total "No. of surveyed households per school"
drop count
