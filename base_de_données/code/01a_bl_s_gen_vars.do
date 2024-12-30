* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
* Project: Breakthrough (BT)                                          *
* Purpose: Generating relevant dummies				              	  *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 


** School id

order child_id, first
destring school_id, replace
drop school_id_entered child_id_entered


** district

forval x=1/4{
	local dist: label district `x'
	local var=lower("`dist'")
	gen `var'=district==`x'
	label var `var' "`dist'"
}
order panipat sonipat rohtak jhajjar, after(district)



** Gender


// missing child gender 
replace student_gender=2 if inlist(child_id,4403014,4219046,4501026,4211125,4503045,4503042,2615060,3201019,1506041,1506028,1308038,1206035,1117086,1316101,3315043,3316025,3401011,3507104,3203050,3426090,3418048,2515021,2609037,2407047,2604054,2604052)

 // student gender entered wrong as these students are from boys only or girls only schools
replace student_gender=student_gender-1 if inlist(child_id,2608057,4207073,3418010,4211025,2409034,2514029,3307120,3426080,4205037,4222008)
replace student_gender=2 if student_gender==0 & inlist(child_id,2608057,4207073,3418010,4211025,2409034,2514029,3307120,3426080,4205037,4222008)


gen boy=student_gender==1 if !mi(student_gender)
label var boy "Child is a boy"
label define boy 1 "Boys" 0 "Girls"
label values boy boy


gen girl = student_gender==2 if !mi(student_gender)
label var girl "Child is a girl"
label define girl 1 "Girls" 0 "Boys"
label values girl girl


** Class

// missing child grade 
replace enrolled=3 if inlist(child_id,4405002,4221022,1404044,1414034,3111110,3414041,2416029,2507006)

gen class=.
replace class=6 if enrolled==2
replace class=7 if enrolled==3
label var class "Child's school class"

gen grade6 = enrolled==2
gen grade7 = enrolled==3
label var grade6 "6th Grade"
label var grade7 "7th Grade"


** Age

gen age=child_age
label var age "Age"

gen age_cat=age
replace age_cat=10 if age_cat<10 & !mi(age_cat)
replace age_cat=14 if age_cat>14 & !mi(age_cat)
label define age_cat 10 "< Age 11" 11 "Age 11" 12 "Age 12" 13 "Age 13" 14 "> Age 13"
label values age_cat age_cat
label var age_cat "Child's age (top and bottom coded)"

** Religion

forval x=1/2{
	local dist: label (religion) `x'
	local var=lower("`dist'")
	gen `var'=religion==`x'
	label var `var' "`dist'"
}

gen religion_oth=inlist(religion,3,4,5,6)
label var religion_oth "Other religion"

order hindu muslim religion_oth, after(religion)

** Caste

gen caste_sc=inlist(caste,16) if !mi(caste)
label var caste_sc "Scheduled caste"

gen caste_st=inlist(caste,17) if !mi(caste)
label var caste_st "Scheduled tribe"

** Gender X class

gen int gender_class=.
replace gender_class=1 if class==6 & boy==1
replace gender_class=2 if class==6 & boy==0
replace gender_class=3 if class==7 & boy==1
replace gender_class=4 if class==7 & boy==0
label define gender_class 1 "6th Grade Boys" 2 "6th Grade Girls" 3 "7th Grade Boys" 4 "7th Grade Girls"
label values gender_class gender_class
label var gender_class "Child's gender * Class"



** Household size

gen hh_size=hh_members if inrange(hh_members,2,25)
label var hh_size "Household size"



* Number of siblings 

gen sibsize=0
foreach x of numlist 1/11{
	replace sibsize=sibsize+1 if inlist(sib_relation`x',5,6)
	replace sibsize=sibsize+1 if inlist(parent_relation`x',5,6)   // some siblings were listed in the parent roaster 
}
label var sibsize "Number of siblings"

** Pukka

gen house_pukka_y=house_pukka==2 if inrange(house_pukka,1,3)
label var house_pukka_y "House is pukka"
order house_pukka_y, after(house_pukka)

** Flush toilet

gen flush_toilet=inlist(house_toilet,1,2) if inrange(house_toilet,1,5)
label var flush_toilet "Flush toilet"
gen nonflush_toilet=inlist(house_toilet,3,4) if inrange(house_toilet,1,5)
label var nonflush_toilet "Non-flush toilet"
gen no_toilet=inlist(house_toilet,5) if inrange(house_toilet,1,5)
label var no_toilet "No toilet"
order flush_toilet nonflush_toile no_toilet, after(house_toilet)

** Water source

gen tap_water=inlist(source_water,1) if inrange(source_water,1,4)
label var tap_water "Tap water"
gen nontap_water=inlist(source_water,2,3,4) if inrange(source_water,1,4)
label var nontap_water "Water from well/tube-well/hand pump"
order tap_water nontap_water, after(source_water)

** Attendance

gen attendance=0 if inrange(absent_sch,0,7)
replace attendance=1 if absent_sch==0
label var attendance "Attended school every day last week"


** Importantce of school

gen child_imp_sch_resp_y=inlist(child_imp_sch_resp,1,2) if !mi(child_imp_sch_resp)
label var child_imp_sch_resp_y "Agrees school based duties more important than family ones"


** Highest level of education

recode highest_edu_finance (1=7) (2=8) (3=9) (4=10) (5=12) (6=13) (7=14) (8=15) (9=16) (10=.), gen(high_level_edu)
label var high_level_edu "Child's desired level of completed education"


** Self-perception

gen class_rank_high=inlist(class_rank,1,2) if !mi(class_rank)
label var class_rank_high "Child ranks herself above average academically"

** Child occupation

foreach x of varlist child_occupation_25yy_*{
	replace `x'=. if child_occupation_25yy=="997"
	local varlab: variable label `x'
	label var `x' "Desired occupation at age 25: `varlab'"
}


** Vignette questions

replace agree_deci=. if agree_deci==6
gen agree_deci_y=inlist(agree_deci,1,2) if !mi(agree_deci)
order agree_deci_y, after(agree_deci)

gen agree_deci_n=inlist(agree_deci,4,5) if !mi(agree_deci)
order agree_deci_n, after(agree_deci_y)

foreach x in town_studies better_student{
	foreach num in 1 2 3{
		gen `x'_`num'=`x'==`num' if !mi(`x')
		local varlab`num': label (`x') `num'
		label var `x'_`num' "`varlab`num''"
		}
	order `x'_?, after(`x')	
	}


label var town_studies_3 "Borrow money and send both"
foreach x of varlist town_studies_1 town_studies_2 town_studies_3{
	local varlab: variable label `x'
	local varlab=subinstr("`varlab'","\hspace{3 mm} ","",1)
	label var `x' "Who would you send to school: `varlab'"
}

label var better_student_3 "Borrow money and send both"
foreach x of varlist better_student_1 better_student_2 better_student_3{
	local varlab: variable label `x'
	local varlab=subinstr("`varlab'","\hspace{3 mm} ","",1)	
	label var `x' "If Rakhi was a better student, send: `varlab'"
}

gen send_rakhi=inlist(town_studies,2,3) if !mi(town_studies)
replace send_rakhi=0 if town_studies==.d   // don't know is 0
gen send_rakhi_better=inlist(better_student,2,3) if !mi(better_student)
replace send_rakhi_better=0 if better_student==.d 
replace send_rakhi_better=1 if town_studies==2
order send_rakhi send_rakhi_better, after(better_student_3)

foreach x of varlist alone_not_safe marry_18 imp_boy_high_edu{
	local varlab: variable label `x'
	local varlab=trim(subinstr("`varlab'",word("`varlab'",1),"",1))
	gen `x'_y=inlist(`x',1,2) if !mi(`x')
	label var `x'_y "`varlab'"
	order `x'_y, after(`x')
	
	gen `x'_n=inlist(`x',4,5) if !mi(`x')
	label var `x'_n "Disagree: `varlab'"
	order `x'_n, after(`x')	
}

foreach x in consult_deci favor_son {   // doesn't matter and don't know = 0 
	gen `x'_y=`x'==1 if !mi(`x')
	replace `x'_y=0 if `x'==.d
	order `x'_y, after(`x')
}

label var agree_deci_y "Agrees with sending Rajat(boy) to school"
label var agree_deci_n "Disagrees with sending only Rajat(boy) to school"
label var send_rakhi "Send Rakhi or both to school"
label var send_rakhi_better "Send Rakhi or both to school if Rakhi is a better student"
label var consult_deci_y "The father should have consulted the mother"
label var favor_son_y "The family favored the son more"
label var imp_boy_high_edu "It is more important to send boys for higher education"
label var alone_not_safe_y "Agrees staying alone in the town is not safe for Rakhi"
label var marry_18_y "Agrees Rakhi needs to be married off as she is 18 years old"
label var imp_boy_high_edu_y "Agrees it is more important to send boys for higher education"
label var child_equal_opps "4. Men and women should get equal opportunities in all spheres of life"



** Gender attitude

foreach x of varlist child_woman_role child_man_final_deci child_woman_tol_viol child_equal_opps child_easier_man child_ghunghat_girl child_wives_less_edu child_girl_allow_study child_similar_right child_boy_more_opps child_marry_opinion child_dowry_girl_marriage child_elect_woman{
	local varlab: variable label `x'
	local varlab=trim(subinstr("`varlab'",word("`varlab'",1),"",1))
	gen `x'_y=inlist(`x',1,2) if !mi(`x')
	label var `x'_y "`varlab'"
	order `x'_y, after(`x')
}

label var child_woman_role_y "A woman's most important role is being a good homemaker"
label var child_woman_tol_viol_y "A woman should tolerate violence to keep her family together"
label var child_boy_more_opps_y "Boys should get more opportunities/ resources for education than girls"
label var child_elect_woman_y "It would be a good idea to elect a woman as the village Sarpanch"



// Generate dummies based on gender norm opinion vars

foreach x in child_woman_role child_man_final_deci child_woman_tol_viol child_wives_less_edu child_boy_more_opps child_dowry_girl_marriage{
	gen `x'_n=`x'>=4 if !mi(`x')
	local varlab: variable label `x'_y
	label var `x'_n "Disagree: `varlab'"
	order `x'_n, after(`x'_y)
}





** Gender behavior




label var alone_meet_friend "Are you allowed to go alone to meet your friends for any reason?"
label var market_friend "Have you ever gone to the village market w/ just friends?"
label var alone_market "Have you ever gone to the village market alone?"
label var atten_events "Have you ever attended any sort of community events/activities?"
label var alone_atten_events "If yes above, have you ever attended one of these events without guardians?"
label var disc_edu_goals "Have you ever discussed your education goals with your parent or adult relative?"
label var allow_fashion_wear "Are you allowed to wear some of these modern fashions (jeans etc.)? (girls only)"
label var own_jeans "Do you own a pair of jeans? (girls only)"
label var allow_wear_any_dress "Are you allowed to wear any dress you want? (girls only)"


** Are you teased?

gen talk_opp_gender_y=inlist(talk_opp_gender,1,2) if !mi(talk_opp_gender)
label var talk_opp_gender_y "Very/moderately comfortable with children of the opposite gender"
replace play_opp_gender=0 if play_opp_gender==2
label var play_opp_gender "Play with children of the opposite gender"
gen teased_y=inlist(teased,1,2) if !mi(teased)
label var teased_y "Often/sometimes teased by someone of the opposite gender"

foreach x in talk_opp_gender teased{
	order `x'_y, after(`x')
}

** Chores

foreach x of varlist help_cook help_clean help_clean_home help_laundry help_get_water help_care_child help_care_old help_care_cattle help_farming help_get_groce{
	local varlab: variable label `x'
	local varlab=subinstr("`varlab'","Do you help in ","Child helps with: ",1)
	label var `x' "`varlab'"
}


** Decisions

label var deci_cook "what to cook on daily basis"
label var deci_buy_tv "whether to buy expensive items for home like TV, etc."
label var deci_taken_dr "whether children should be taken to a doctor"
label var deci_buy_cloth "whether to buy new clothes for children"
label var deci_buy_books "whether to buy new books for children"


foreach x of varlist deci_cook deci_buy_tv deci_taken_dr deci_buy_cloth deci_buy_books{
	local varlabx: variable label `x'
	forval y=1/5{
		local varlab: variable label `x'_`y'
		local varlab=substr("`varlab'",strpos("`varlab'","by ")+3,.)
		local varlab2="`varlab' has a say in: `varlabx'"
		local varlab2=subinstr("`varlab2'","father","Father",1)
		local varlab2=subinstr("`varlab2'","mother","Mother",1)
		label var `x'_`y' "`varlab2'"	
	}
	local varlab: variable label `x'_5
	local varlab=subinstr("`varlab'","other has","Others have",1)
	label var `x'_5 "`varlab'"
}




** Visit doctor

replace help_visit_dr=5 if help_visit_dr==.d
forval x=1/5{
	gen help_visit_dr_`x'=help_visit_dr==`x' if !mi(`x')
	local varlab: label (help_visit_dr) `x'
	label var help_visit_dr_`x' "Child's last visit to doctor: `varlab'"
}

gen visit_dr_lastmth=inlist(help_visit_dr,1,2,3) if !mi(help_visit_dr)
order help_visit_dr_* visit_dr_lastmth, after(help_visit_dr)
label var visit_dr_lastmth "Visited doctor in the last 6 months"



** Eat first

gen fath_eat_bef_y=inlist(fath_eat_bef,1,2) if !mi(fath_eat_bef)
label var fath_eat_bef_y "Father always/frequently eats food before mother"
gen you_eat_bef_y=inlist(you_eat_bef,1,2) if !mi(you_eat_bef)
label var you_eat_bef_y "Child always/frequently eats food before brother/sister"
foreach x in fath_eat_bef you_eat_bef{
	order `x'_y, after(`x')
}




** TV

gen tv_per_day=often_tv_hr
replace tv_per_day=0 if inlist(often_tv,2) | inlist(tv_house,2)
replace tv_per_day=. if often_tv==3 | tv_house==3
replace tv_per_day=tv_per_day/7 if often_tv_unit==2
replace tv_per_day=tv_per_day/30 if often_tv_unit==3
replace tv_per_day=tv_per_day/365 if often_tv_unit==4
replace tv_per_day=. if !inrange(tv_per_day,0,10)
label var tv_per_day "Hours of TV watching per day"

gen tv_per_day_cat=ceil(tv_per_day)
label var tv_per_day_cat "Hours of TV watching per day (rounded up)"



** Mobile and Internet

gen access_mobile_y=access_mobile==1 if !mi(access_mobile)
label var access_mobile_y "Child has access to a mobile phone"
gen hear_net_y=inlist(hear_net,2,3) if !mi(hear_net)
label var hear_net_y "Child has heard about the internet"


** Reading magazine


label define grp35read_magazine 7 "Don't remember", modify
foreach x of numlist 1/8{
	gen read_magazine_`x'=read_magazine==`x' if !mi(read_magazine)
	local varlab: label (read_magazine) `x'
	label var read_magazine_`x' "Last time child read a book/magazine: `varlab'"
}

** Social engagement 


label var part_ngo "Child has voluntarily done any NGO organized activity"
label var meena_activ "Girl has attended any Meena Manch activity"
label var club_sch "Child has done any school club activity"


** Khap

gen child_khap_work_y=child_khap_work==child_khap_work!=3 if !mi(child_khap_work)
label var child_khap_work_y "Child has ever heard about Khap"


foreach x in access_mobile hear_net read_magazine child_khap_work{
	order `x'_*, after(`x')
}

** Co-resident grandmother


gen grandma= grandparents_1 | grandparents_3
replace grandma=. if grandparents_stay=="997"
label define grandma 0 "No" 1 "Yes"
label values grandma grandma
label var grandma "Living with a grandmother"


** Number of younger siblings

gen sibsize_young=0
foreach x of numlist 1/11{
	replace sibsize_young=sibsize_young+1 if inlist(sib_relation`x',5,6) & sib_age`x'<age
}
label var sibsize_young "Number of younger siblings"



** Number of children desired

gen hypo_sons = real(val_x)
gen hypo_tfr = real(val_n)
label var hypo_tfr "Specified hypothetical number of children"
label var hypo_sons "Desired number of sons at hypo fertility"

replace child_num_child=0 if child_num_child==8
label define grp44num_child 0 "0" 8 "", modify

gen ideal_tfr=child_num_child
label var ideal_tfr "Ideal number of children"
replace ideal_tfr = . if ideal_tfr > 8

gen ideal_tfr_sq = ideal_tfr^2
label var ideal_tfr_sq "Ideal number of children, squared"



rename child_choose_num_boys ideal_boys
rename child_choose_num_girls ideal_girls
rename child_either_bg ideal_either

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



** Happy about education
gen father_view_edu_happy=inlist(father_view_edu,1,2) if !mi(father_view_edu)
replace father_view_edu_happy=0 if father_view_edu==.d
order father_view_edu_happy, after(father_view_edu)
gen mother_view_edu_happy=inlist(mother_view_edu,1,2) if !mi(mother_view_edu)
replace mother_view_edu_happy=0 if mother_view_edu==.d
order mother_view_edu_happy, after(mother_view_edu)
label var father_view_edu_happy "Father would be happy to see the child study in a city"
label var mother_view_edu_happy "Mother would be happy to see the child study in a city"


** Highest level of education child would like to complete

gen highest_edu_13plus=inlist(highest_edu_finance,6,7,8,9) if !mi(highest_edu_finance)
replace highest_edu_13plus=0 if highest_edu_finance==.d
order highest_edu_13plus, after(highest_edu_finance)
label var highest_edu_13plus "Child wishes to complete Grade 13 or higher"

