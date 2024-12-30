*********************************************************************************
*	 Project: Breakthrough (BT)
*
*	 Purpose: Figures for the Breakthrough RCT paper and presentation
*********************************************************************************

	
	clear all
	
	set more off
	cap log close
	pause on
	
	set matsize 11000
	set maxvar 5000
	
	set scheme s1color
	
local p1 = 0 // setting globals for controls

* run do-file that defines globals for basic and extended controls in regressions	
if `p1'==1 {
	do "$do/sup_controls"
	}

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
*	
*		Figure : Plotting coefficients for the treatment effect of the 
*				 primary outcomes
*
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

	
use "$finaldata", clear

	**1. ENDLINE 1 Coefficient Plot for Attitudes Index, Girls' Aspirations Index, and Pooled Behavior Index	

	eststo clear
	eststo gender: reg E_Sgender_index2 B_treat B_Sgender_index2 B_Sgender_index2_m district_gender_* gender_grade_* $el_gender_flag $bl_gender_flag if !mi(E_Steam_id) & attrition_el==0 , cluster(Sschool_id)

	eststo aspiration: reg E_Saspiration_index2 B_treat B_Saspiration_index2 B_Saspiration_index2_m gender_grade_* district_gender_* $el_aspiration_flag $bl_aspiration_flag if B_Sgirl==1 & !mi(E_Steam_id) & attrition_el==0, cluster(Sschool_id) 

	eststo behavior: reg E_Sbehavior_index2 B_treat B_Sbehavior_index2 B_Sbehavior_index2_m gender_grade_* district_gender_* $el_behavior_common_flag $bl_behavior_common_flag if !mi(E_Steam_id) & attrition_el==0, cluster(Sschool_id)
	
	coefplot gender aspiration behavior, keep (B_treat) vertical recast(bar) barwidth(0.15) fcolor(*.5) ///
	legend(on label(1 "Gender Attitudes Index") label(3 "Girls' Aspirations Index") label(5 "Self-reported Behavior Index")) ///
	ytitle("Standard deviations") coeflabels(B_treat = " ", notick) ylabel(,format(%9.2g)) yline(0, lcolor(gray) lpattern(dash)) ///
    ciopts(recast(rcap)) citop citype(normal) format(%9.2f) ///
   	addplot(scatter @b @at, ms(i) mlabel(@b) mlabpos(2) mlabcolor(black) mlabsize(medlarge))

	graph export "$figures/el1_coeff_plot.pdf", replace	
	
	**2. ENDLINE 2 Coefficient Plot for Attitudes Index, Girls' Aspirations Index, and Pooled Behavior Index	
	
	eststo clear
	eststo gender: reg E2_Sgender_index2 B_treat B_Sgender_index2 B_Sgender_index2_m district_gender_* gender_grade_* $el2_gender_flag $bl_gender_flag if !mi(E2_Steam_id) & attrition==0 , cluster(Sschool_id)

	eststo aspiration: reg E2_Saspiration_index2 B_treat B_Saspiration_index2 B_Saspiration_index2_m gender_grade_* district_gender_* $el2_aspiration_flag $bl_aspiration_flag if B_Sgirl==1 & !mi(E2_Steam_id) & attrition==0, cluster(Sschool_id) 

	eststo behavior: reg E2_Sbehavior_index2 B_treat B_Sbehavior_index2 B_Sbehavior_index2_m gender_grade_* district_gender_* $el2_behavior_common_flag $bl_behavior_common_flag if !mi(E2_Steam_id) & attrition==0, cluster(Sschool_id)
 
	coefplot gender aspiration behavior, keep (B_treat) vertical recast(bar) barwidth(0.15) fcolor(*.5) ///
	legend(on label(1 "Gender Attitudes Index") label(3 "Girls' Aspirations Index") label(5 "Self-reported Behavior Index")) ///
	ytitle("Standard deviations") coeflabels(B_treat = " ", notick) ylabel(,format(%9.2g)) yline(0, lcolor(gray) lpattern(dash)) ///
    ciopts(recast(rcap)) citop citype(normal) format(%9.2f) ///
   	addplot(scatter @b @at, ms(i) mlabel(@b) mlabpos(2) mlabcolor(black) mlabsize(medlarge))

	graph export "$figures/el2_coeff_plot.pdf", replace
	
	** NOT USING **  **2b. ENDLINE 2 Coefficient Plot for Attitudes Index, Girls' Aspirations Index, and Pooled Behavior Index	+ petition and scholarship
	
	eststo clear
	eststo gender: reg E2_Sgender_index2 B_treat B_Sgender_index2 B_Sgender_index2_m district_gender_* gender_grade_* $el2_gender_flag $bl_gender_flag if !mi(E2_Steam_id) & attrition==0 , cluster(Sschool_id)

	eststo aspiration: reg E2_Saspiration_index2 B_treat B_Saspiration_index2 B_Saspiration_index2_m gender_grade_* district_gender_* $el2_aspiration_flag $bl_aspiration_flag if B_Sgirl==1 & !mi(E2_Steam_id) & attrition==0, cluster(Sschool_id) 

	eststo behavior: reg E2_Sbehavior_index2 B_treat B_Sbehavior_index2 B_Sbehavior_index2_m gender_grade_* district_gender_* $el2_behavior_common_flag $bl_behavior_common_flag if !mi(E2_Steam_id) & attrition==0, cluster(Sschool_id)
 
	eststo petition: reg E2_Spetition_index2 B_treat district_gender_* gender_grade_* if !mi(E2_Steam_id) & attrition==0 , cluster(Sschool_id) 
	
	eststo scholar: reg E2_Sscholar_index2 B_treat district_gender_* gender_grade_* if !mi(E2_Steam_id) & attrition==0 , cluster(Sschool_id) 

	coefplot gender aspiration behavior petition scholar, keep (B_treat) vertical recast(bar) barwidth(0.15) fcolor(*.5) ///
	legend(on label(1 "Gender Attitudes Index") label(3 "Girls' Aspirations Index") label(5 "Self-reported Behavior Index") label(7 "Supported Petition") label(9 "Girls Applied to Scholarship")) ///
	ytitle("Coefficient on Treatment") coeflabels(B_treat = " ", notick) ylabel(,format(%9.2g)) yline(0, lcolor(gray) lpattern(dash)) ///
    ciopts(recast(rcap)) citop citype(normal) format(%9.2f) ///
   	addplot(scatter @b @at, ms(i) mlabel(@b) mlabpos(2) mlabcolor(black) mlabsize(medium))

	graph export "$figures/el2_coeff_plot_ps.pdf", replace
	
	preserve 
	local petition_lab "Supported Petition"
	local scholar_lab "Applied to Scholarship (Girls)"

	
	foreach var in petition scholar {
	use "$finaldata", clear
	collapse (mean) mean= E2_S`var'_index2 (sd) sd=E2_S`var'_index2 (count) n=E2_S`var'_index2, by(B_treat)
	
	if "`var'" == "petition" {
		local treat_color 107 76 154
		}
	if "`var'" == "scholar" {
		local treat_color 211 84 96
		}
	
	generate high = mean + invttail(n-1,0.025)*(sd / sqrt(n))
	generate low = mean - invttail(n-1,0.025)*(sd / sqrt(n))
	
	gen x = 0.095 if B_treat==0
	replace x = 0.205 if B_treat==1
	
	gen meandi = string(round(mean,.01))

	graph twoway (bar mean x if B_treat==0, barwidth(0.1)  fcolor(*.5) color("192 192 192")) ///
	(bar mean x if B_treat==1, mlabel(mean) barwidth(0.1) fcolor(*.5) color("`treat_color'") ) ///
	(rcap high low x if B_treat==0, lwidth(medium) lcol("192 192 192")) ///
	(rcap high low x if B_treat==1, lwidth(medium) lcol("`treat_color'")) ///
	(scatter mean x ,  ms(i) mlabel(meandi) mlabpos(2) mlabcolor(black) mlabsize(large)), ///
	legend( order(1 "Control" 2 "Treatment")) title("``var'_lab'", size(medlarge)) ///
	xscale(range(0 0.3)) xlabel(none) xtitle("") ytitle("Proportion", size(medlarge)) ///
	yscale(range(0 .5)) ylabel( 0 (0.1) .5, labsize(medsmall)  nogrid format(%9.2g)) ///
	graphregion(color(white) margin(l=1 r=1)) plotregion(style(outline) margin(b=0)) aspect(1.1) 

	graph export "$figures/el2_coeff_`var'.pdf", replace	

	}
	restore

	**3. Endline 1 Heterogeneity by Gender:  Coefficient Plot for Attitudes Index and Pooled Behavior Index	

	eststo clear
	
	local g 1
	local b 0
	
	foreach x in g b {
		eststo gender_`x': reg E_Sgender_index2 B_treat B_Sgender_index2 B_Sgender_index2_m district_gender_* gender_grade_* $el_gender_flag $bl_gender_flag if !mi(E_Steam_id) & attrition_el==0 & B_Sgirl==``x'', cluster(Sschool_id)
			local el1_att_`x': di %7.3f _b[B_treat]
		eststo behavior_`x': reg E_Sbehavior_index2 B_treat B_Sbehavior_index2 B_Sbehavior_index2_m gender_grade_* district_gender_* $el_behavior_common_flag $bl_behavior_common_flag if !mi(E_Steam_id) & attrition_el==0 & B_Sgirl==``x'', cluster(Sschool_id)
			local el1_beh_`x': di %7.3f _b[B_treat]
		}
		
	local max 0.4 // set max for yscale on bar graph
		
	** attitudes
	coefplot (gender_b, keep(B_treat) color(navy) lcol(navy) ciopts(recast(rcap) lwidth(thin) lcol(navy))) ///
	(gender_g, keep(B_treat) color(maroon) lcol(maroon) ciopts(recast(rcap) lwidth(thin) lcol(maroon))), ///
	vertical recast(bar) barwidth(0.30) bargap(20) fcolor(*.5)  ///
	legend(on label(1 "Boys") label(3 "Girls"))	title("Gender Attitudes Index", size(medlarge)) ///
	ytitle("Standard deviations", size(medium)) coeflabels(B_treat = " ", notick) yscale(range(0 `max')) ylabel( 0 (0.1) `max', labsize(medsmall)  nogrid format(%9.2g)) ///
    citop citype(normal) format(%9.2f) ///
   	addplot(scatter @b @at, ms(i) mlabel(@b) mlabpos(2) mlabcolor(black) mlabsize(medlarge)) ///
	graphregion(color(white) margin(l=1 r=1)) plotregion(style(outline) margin(b=0)) aspect(1.2) 

	graph export "$figures/el1_coeff_att_gender.pdf", replace	

	** behavior
	coefplot (behavior_b, keep(B_treat) color(navy) lcol(navy) ciopts(recast(rcap) lwidth(thin) lcol(navy))) ///
	(behavior_g, keep(B_treat) color(maroon) lcol(maroon) ciopts(recast(rcap) lwidth(thin) lcol(maroon))), ///
	vertical recast(bar) barwidth(0.30) bargap(20) fcolor(*.5)  ///
	legend(on label(1 "Boys") label(3 "Girls"))	title("Self-reported Behavior Index", size(medlarge)) ///
	ytitle("Standard deviations", size(medium)) coeflabels(B_treat = " ", notick) yscale(range(0 `max')) ylabel(0 (0.1) `max', labsize(medsmall)  nogrid format(%9.2g)) ///
    citop citype(normal) format(%9.2f) ///
   	addplot(scatter @b @at, ms(i) mlabel(@b) mlabpos(2) mlabcolor(black) mlabsize(medlarge)) ///
	graphregion(color(white) margin(l=1 r=1)) plotregion(style(outline) margin(b=0)) aspect(1.2) 

	graph export "$figures/el1_coeff_beh_gender.pdf", replace

	
	**4. Endline 2 Heterogeneity by Gender:  Coefficient Plot for Attitudes Index and Pooled Behavior Index	

	eststo clear
	
	local g 1
	local b 0
	
	foreach x in g b {
		eststo gender_`x': reg E2_Sgender_index2 B_treat B_Sgender_index2 B_Sgender_index2_m district_gender_* gender_grade_* $el2_gender_flag $bl_gender_flag if !mi(E2_Steam_id) & attrition==0 & B_Sgirl==``x'', cluster(Sschool_id)
			local el2_att_`x': di %7.3f _b[B_treat]
		eststo behavior_`x': reg E2_Sbehavior_index2 B_treat B_Sbehavior_index2 B_Sbehavior_index2_m gender_grade_* district_gender_* $el2_behavior_common_flag $bl_behavior_common_flag if !mi(E2_Steam_id) & attrition==0 & B_Sgirl==``x'', cluster(Sschool_id)
			local el2_beh_`x': di %7.3f _b[B_treat]
		}
		
	local max 0.4 // set max for yscale on bar graph
	
	** attitudes
	coefplot (gender_b, keep(B_treat) color(navy) lcol(navy) ciopts(recast(rcap) lwidth(thin) lcol(navy))) ///
	(gender_g, keep(B_treat) color(maroon) lcol(maroon) ciopts(recast(rcap) lwidth(thin) lcol(maroon))), ///
	vertical recast(bar) barwidth(0.30) bargap(20) fcolor(*.5)  ///
	legend(on label(1 "Boys") label(3 "Girls"))	title("Gender Attitudes Index", size(medlarge)) ///
	ytitle("Standard deviations", size(medium)) coeflabels(B_treat = " ", notick) yscale(range(0 `max')) ylabel( 0 (0.1) `max', labsize(medsmall)  nogrid format(%9.2g)) ///
    citop citype(normal) format(%9.2f) ///
   	addplot(scatter @b @at, ms(i) mlabel(@b) mlabpos(2) mlabcolor(black) mlabsize(medlarge)) ///
	graphregion(color(white) margin(l=1 r=1)) plotregion(style(outline) margin(b=0)) aspect(1.2) 

	graph export "$figures/el2_coeff_att_gender.pdf", replace	
				
	** behavior
	coefplot (behavior_b, keep(B_treat) color(navy) lcol(navy) ciopts(recast(rcap) lwidth(thin) lcol(navy))) ///
	(behavior_g, keep(B_treat) color(maroon) lcol(maroon) ciopts(recast(rcap) lwidth(thin) lcol(maroon))), ///
	vertical recast(bar) barwidth(0.30) bargap(20) fcolor(*.5)  ///
	legend(on label(1 "Boys") label(3 "Girls"))	title("Self-reported Behavior Index", size(medlarge)) ///
	ytitle("Standard deviations", size(medium)) coeflabels(B_treat = " ", notick) yscale(range(0 `max')) ylabel( 0 (0.1) `max', labsize(medsmall)  nogrid format(%9.2g)) ///
    citop citype(normal) format(%9.2f) ///
   	addplot(scatter @b @at, ms(i) mlabel(@b) mlabpos(2) mlabcolor(black) mlabsize(medlarge)) ///
	graphregion(color(white) margin(l=1 r=1)) plotregion(style(outline) margin(b=0)) aspect(1.2) 

	graph export "$figures/el2_coeff_beh_gender.pdf", replace


* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
*	
*	Estimates by gender (original format)
*
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

preserve 
 
forval p = 1/2 {

	clear 
	set scheme s1color
	set obs 4

	* question
	gen q1 = 1 if _n==1 | _n==2
	gen q2 = 1 if _n==3 | _n==4

	la var q1 "Gender Attitudes Index"
	la var q2 "Self-reported Behavior Index"

	* sex	
	gen sex = 1 if _n==1 | _n==3
	replace sex = 2 if _n==2 | _n==4

	la def sex 1 "Boys" 2 "Girls"
	la val sex sex

	* mean
	gen mean = `el`p'_att_b' if q1 ==1 & sex==1
	replace mean = `el`p'_att_g' if q1==1 & sex==2
	replace mean = `el`p'_beh_b' if q2==1 & sex==1
	replace mean= `el`p'_beh_g' if q2==1 & sex==2

	local 1 "att"
	local 2 "beh"
	
	local max 0.4 // set max for yscale on bar graph

	forval i = 1/2 {

		local l: variable label q`i' 

		graph bar mean if q`i'==1, over(sex) title("`l'", size(*1)) ytitle("Standard deviations") ///
			asyvars bar(1, color(navy*.5) lcolor(navy)) bar(2, color(maroon*.5) lcolor(maroon)) ///
			graphregion(color(white) margin(l=1 r=1)) plotregion(style(outline) margin(t=6)) aspect(1.3) ///
			yscale(range(0 `max')) ylabel( 0 (0.1) `max', labsize(small) nogrid format(%9.2g)) bargap (20)  outergap(*.8)  ///
			blabel(bar, position(outside) format(%12.3fc) size(medium)) name(q`i', replace)
		
		
		graph export "$figures/el`p'_``i''bar_gender.pdf", replace	
		
		}		
	}
	
restore

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
*	
*	Gender attitudes index: Treat vs control density
*
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

use "$finaldata", clear

**Kdensity plots

#delim ;
	twoway kdensity E_Sgender_index2 if B_treat==0, 
		aspectratio(0.6) color("209 144 140") lwidth(medthick)  
		legend(on order(1 "Control" 2 "Treatment")) 
		xtitle("") ytitle("Density") ||
	kdensity E_Sgender_index2 if B_treat==1, 
		color(navy) lwidth(medthick)  name(treat_kdensity, replace);
#delim cr

	gr display treat_kdensity
	graph export "$figures/kdensity_endline_treat.pdf", replace


**	Histogram
#delim ;
	twoway histogram E_Sgender_index2 if B_treat==0, 
		percent bcolor("142 88 89")  bfcolor("209 144 140") lwidth(medthick) 
		legend(on order(1 "Control" 2 "Treatment"))
		xtitle("") ytitle("") ||
	histogram E_Sgender_index2 if B_treat==1, 
		percent bfcolor(none) blcolor(navy) lwidth(medthick) name(treat_hist, replace);
#delim cr

	gr display treat_hist
	graph export "$figures/hist_endline_treat.pdf", replace


* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
*	
*	Heterogeneity of Attitude components by gender
*
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

use "$finaldata", clear

	#delimit ;
	  local gender 
		E_Swives_less_edu_n E_Select_woman_y E_Sboy_more_oppo_n E_Stown_studies_y 
		E_Sman_final_deci_n E_Swoman_viol_n E_Scontrol_daughters_n E_Swoman_role_home_n 
		E_Smen_better_suited_n E_Ssimilar_right_y /*E_Sshy E_Slaugh*/ 
		E_Smarriage_more_imp_n E_Steacher_suitable_n E_Sgirl_marriage_age_19 
		E_Smarriage_age_diff_m E_Sstudy_marry E_Sallow_work_y E_Sfertility;
	
	#delimit cr


local E_Swives_less_edu_n E2_Swives_less_edu_n
local E_Select_woman_y E2_Select_woman_y
local E_Sboy_more_oppo_n E2_Sboy_more_oppo_n
local E_Stown_studies_y E2_Stown_studies_y
local E_Sman_final_deci_n E2_Sman_final_deci_n
local E_Swoman_viol_n E2_Swoman_viol_n
local E_Scontrol_daughters_n E2_Scontrol_daughters_n
local E_Swoman_role_home_n E2_Swoman_role_home_n
local E_Smen_better_suited_n E2_Smen_better_suited_n
local E_Ssimilar_right_y E2_Ssimilar_right_y 
local E_Smarriage_more_imp_n E2_Smarriage_more_imp_n
local E_Steacher_suitable_n E2_Steacher_suitable_n
local E_Sgirl_marriage_age_19 E2_Sgirl_marriage_age_19
local E_Smarriage_age_diff_m E2_Smarriage_age_diff_m
local E_Sstudy_marry E2_Sstudy_marry
local E_Sallow_work_y E2_Sallow_work
local E_Sfertility E2_Sfertility

matrix graph_data = J(17, 2, .)
local i = 1 

foreach var in `gender'  {

		local varlab: variable label `var'	
	
		reg `var' B_treat B_Sgirl treat_girl B_Sgender_index2 B_Sgender_index2_m ///
			district_gender_* gender_grade_* ${bl_gender_flag} if !mi(E_Steam_id) & attrition_el==0 & `var'_flag==0, cluster(Sschool_id)
			
			* storing coefs		
			local el1_b2: di %7.3fc _b[treat_girl]

			* girls control mean
			su `var' if B_treat==0 & !mi(E2_Steam_id) & attrition==0 & B_Sgirl==1
				local el1_girl_mean: di %7.3fc r(mean)	

		reg ``var'' B_treat B_Sgirl treat_girl B_Sgender_index2 B_Sgender_index2_m ///
			district_gender_* gender_grade_* ${bl_gender_flag} if !mi(E_Steam_id) & attrition_el==0 & `var'_flag==0, cluster(Sschool_id)
			
			* storing coefs		
			local el2_b2: di %7.3fc _b[treat_girl]

			* girls control mean
			su ``var'' if B_treat==0 & !mi(E2_Steam_id) & attrition==0 & B_Sgirl==1
				local el2_girl_mean: di %7.3fc r(mean)	

		local beta_diff = `el2_b2' - `el1_b2'
		local mean_diff = `el2_girl_mean' - `el1_girl_mean'

		mat graph_data[`i', 1] = `mean_diff'
		mat graph_data[`i', 2] = `beta_diff' 		
		local i = `i' + 1
	}

clear
svmat graph_data
la var graph_data1 "Difference in mean of outcome among girls in control group (EL2-EL1)"
la var graph_data2 "Difference in Treat*girl coefficient (EL2-EL1)"
twoway scatter graph_data2 graph_data1 || lfit graph_data2 graph_data1
graph export "$figures/het_att_scatter.png", replace
corr graph_data2 graph_data1


* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
*	R&R GRAPHS
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

use "$finaldata", clear

**	Histogram
sum B_Ssocial_scale, d
local SD_med =  r(p50)
local text = `SD_med' - .1

#delim ;
	twoway histogram B_Ssocial_scale if B_Sgirl==0, 
		percent bcolor("142 88 89")  bfcolor("209 144 140") lwidth(medthick) 
		legend(on order(1 "Boys" 2 "Girls"))
		xtitle("Social desirability score") xlab(-6(2)2) start(-5) width(1) ||
	histogram B_Ssocial_scale if B_Sgirl==1, 
		percent bfcolor(none) blcolor(navy) lwidth(medthick) xlab(-6(2)2) start(-5) width(1); 
#delim cr

graph export "$figures/gender_SD_hist.png", replace

#delim ;
	twoway histogram B_Ssocial_scale, 
		percent bcolor("142 88 89")  bfcolor("209 144 140") lwidth(medthick) 
		xtitle("Social desirability score") xlab(-6(2)2) legend(on order(1 "Percent")) width(1);
#delim cr

graph export "$figures/combined_SD_hist.png", replace


sum B_Ssocial_scale_int_imp, d
local SD_med =  r(p50)
local text = `SD_med' - .1

#delim ;
	twoway histogram B_Ssocial_scale_int_imp if B_Sgirl==0, 
		percent bcolor("142 88 89")  bfcolor("209 144 140") lwidth(medthick) 
		legend(on order(1 "Boys" 2 "Girls"))
		xtitle("Social desirability score") xlab(0(1)13) width(1) ||
	histogram B_Ssocial_scale_int_imp if B_Sgirl==1, 
		percent bfcolor(none) blcolor(navy) lwidth(medthick) width(1);
#delim cr

graph export "$figures/gender_SDcount_hist.png", replace

#delim ;
	twoway histogram B_Ssocial_scale_int_imp, 
		percent bcolor("142 88 89")  bfcolor("209 144 140") lwidth(medthick) 
		xtitle("Social desirability score") xlab(0(1)13) legend(on order(1 "Percent")) width(1);
#delim cr

graph export "$figures/combined_SDcount_hist.png", replace

#delim ;
	twoway histogram B_Ssocial_scale if B_Sgirl==0, 
		percent bcolor("142 88 89")  bfcolor("209 144 140") lwidth(medthick) 
		legend(on order(1 "Boys" 2 "Girls"))
		xtitle("Social desirability score") xlab(-6(2)2) start(-5) width(1) ||
	histogram B_Ssocial_scale if B_Sgirl==1, 
		percent bfcolor(none) blcolor(navy) lwidth(medthick) xlab(-6(2)2) start(-5) width(1) name(SD_graph1) title("Normalized score", size(med)); 
#delim cr

#delim ;
	twoway histogram B_Ssocial_scale_int_imp if B_Sgirl==0, 
		percent bcolor("142 88 89")  bfcolor("209 144 140") lwidth(medthick) 
		legend(on order(1 "Boys" 2 "Girls"))
		xtitle("Social desirability score") xlab(0(1)13) width(1) ||
	histogram B_Ssocial_scale_int_imp if B_Sgirl==1, 
		percent bfcolor(none) blcolor(navy) lwidth(medthick) width(1) name(SD_graph2) title("Raw score", size(med));
#delim cr

graph combine SD_graph1 SD_graph2

graph export "$figures/SDcount_hist_panels.png", replace

graph drop _all 

