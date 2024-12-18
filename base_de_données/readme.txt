Overview:

The contents in this replication package include the raw survey data and code used to construct the paper's analysis data, tables, and figures. One file (0_master_run.do) runs all the code to generate the 13 tables in the paper and the one figure and 28 tables in the online appendix. Figure 1 of the paper is made in ArcGIS; instructions for its creation are visible under 04d_figure1.txt.   


Data and Code Availability Statement:

All raw data (de-identified) and code used to produce the paper's analysis data, tables, and figures are available in this repository. The files provided for replication include...

data (raw data pre cleaning and analysis):
attrition.dta
baseline_census_cleaned.dta
baseline_iat_raw.dta
baseline_parent_raw.dta
baseline_school_cleaned.dta
baseline_student_raw.dta
endline1_iat_raw1.dta
endline1_iat_raw2.dta
endline1_student_raw.dta
endline2_revpref_petition.dta
endline2_revpref_scholarship.dta
endline2_student_raw.dta
endline2_student_raw_inter.dta
endline_school_board_cleaned.dta
endline_school_scert_raw.dta
2011_Dist.shp
school_gps_map.csv

code:
01a_bl_s_gen_vars.do
01b_bl_s_clean_oth.do
01c_bl_p_gen_vars.do
01d_bl_p_clean_oth.do
01e_bl_caste.do
01f_bl_iat.do
02a_el1_s_label.do
02b_el1_s_clean.do
02c_el1_s_clean_oth.do
02d_el1_s_gen_vars.do
02e_el1_sch_scert_clean.do
02f_el1_sch_merge.do
02g_el1_iat_clean.do
03a_el2_s_clean_oth.do
03b_el2_s_gen_vars.do
04a_merge_indices.do
04b_tables.do
04c_figures.do
04d_figure1.txt
0_master_run.do
sup_controls.do
corrmat.ado
lassoShooting.ado
xfill.ado

tex file:
paper_tables.tex

Computational requirements:

Software requirements
- Stata (code was last run with version 14), including commands
	- outreg2 
	- egenmore 
	- unique 
	- estout 
	- coefplot 
	- corrtex 
	- putexcel
(Note that the file 0_master_run.do should install all dependencies locally.) 

Memory and runtime requirements
Approximate time needed to reproduce the analyses on a standard (2021) desktop machine is 1-4 hours. The code was last run on a 8-core Intel i7 desktop with 16GB of RAM and Windows 10 Enterprise. Computation took 75 minutes. 

Description of programs/code:

0_master_run.do runs all the code in order. 01*.do creates and compiles analysis baseline data. 02*.do creates and compiles analysis endline 1 data. 03*.do creates and compiles analysis endline 2 data. 04a_merge_indices.do merges all data and creates our final analysis dataset. 04b_tables.do creates all paper and appendix tables. 04c_figures.do creates all paper and appendix figures other than paper figure 1. 04d_map.txt describes the creation of paper figure 1 in ArcGIS.

Instruction to replicators:

Please create a folder titled "Main Analysis and Paper". Within that folder construct the following structure of subfolders:

├───ad-hoc analysis
├───Analysis data
├───do_files
│   └───_ado
├───Figures
├───Paper
└───Tables
    ├───beamer_tables
    └───paper_tables

Insert all .do files into "Main Analysis and Paper/do_files". Insert all .ado files into "Main Analysis and Paper/do_files/_ado". Insert all data into "Main Analysis and Paper/Analysis data". Insert the paper_tables.tex file into "Main Analysis and Paper/Paper". Open "0_master_run.do" and edit line 19 to the your local directory where you've constructed the "Main Analysis and Paper" folder. Running "0_master_run.do" will compile all code in order and populate the folders appropriately. Afterwards compiling "paper_tables.tex" will produce a PDF with all paper tables (including appendix tables). 04d_figure1.txt provides instruction on how to create paper figure 1 in ArcGIS.  