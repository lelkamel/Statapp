* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
* Project: Breakthrough (BT)                             			  *
* Purpose: Codifying "other" responses				                  *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 


** Other family members having a cell phone **

replace mem_cell_oth = regexr(mem_cell_oth, "^Bhai.*$", "Brother")
replace mem_cell_3 = 1 if mem_cell_oth == "Brother"
replace mem_cell_5 = 0 if mem_cell_oth == "Brother"
replace mem_cell_oth = ".s" if mem_cell_oth == "Brother"
replace mem_cell_oth = "A family member" if mem_cell_oth == "CUSION BROTHER"
replace mem_cell_oth = "A family member" if mem_cell_oth == "Hariparkash"
replace mem_cell_oth = "A family member" if mem_cell_oth == "Monika"
replace mem_cell_oth = "A family member" if mem_cell_oth == "Naveen"
replace mem_cell_oth = "A family member" if mem_cell_oth == "Parkash"
replace mem_cell_oth = "A family member" if mem_cell_oth == "Rajo"
replace mem_cell_oth = "A family member" if mem_cell_oth == "Shiv narayan"




replace mem_cell_oth = "Aunt" if mem_cell_oth == "Aunti"

replace mem_cell_oth = "Uncle" if mem_cell_oth == "Uncle ji" | mem_cell_oth == "Uncle k paas" | mem_cell_oth == "Uncle ke pas" | mem_cell_oth == "Uncle ke pass" 

replace mem_cell_oth = "Self" if mem_cell_oth == "Apne pass" | mem_cell_oth == "I" | mem_cell_oth == "SWAM KE PASS BHI HAI" | mem_cell_oth == "Self k liye" ///
	| mem_cell_oth == "Own" 
replace mem_cell_oth = regexr(mem_cell_oth, "^Mer.*$", "Self")

replace mem_cell_oth = "Sister-in-law" if mem_cell_oth == "BHABHI"
replace mem_cell_oth = regexr(mem_cell_oth, "^Bh.*$", "Sister-in-law")

replace mem_cell_oth = "Aunt-Bua" if mem_cell_oth == "BUA JI" | mem_cell_oth == "Bua" | mem_cell_oth == "Bua g" | mem_cell_oth == "Buaji" 

replace mem_cell_oth = "P. Grandfather" if mem_cell_oth == "Baba ji" | mem_cell_oth == "Baba ji ka pass" | mem_cell_oth == "Daada" | mem_cell_oth == "Daada ji" ///
	| mem_cell_oth == "Dadha"

replace mem_cell_oth = "Aunt-Chachi, Uncle-Chacha" if mem_cell_oth == "ANTI  UNCLE" | mem_cell_oth == "CHACHA, CHACHI" | mem_cell_oth == "Chacha , chaci ke pass hai" ///
	| mem_cell_oth == "Chacha Chachi" | mem_cell_oth =="Chacha chachi" | mem_cell_oth == "Chacha ji aur chachi ke pass" | mem_cell_oth == "Chacha, chachi" ///
	| mem_cell_oth == "Chacha, chahi"
replace mem_cell_oth = regexr(mem_cell_oth, "^CH.*A$", "Uncle-Chacha")
replace mem_cell_oth = regexr(mem_cell_oth, "^Chacha k.*$", "Uncle-Chacha")
replace mem_cell_oth = regexr(mem_cell_oth, "^Chacha ji k.*$", "Uncle-Chacha")
replace mem_cell_oth = "Uncle-Chacha" if mem_cell_oth == "Ankal" | mem_cell_oth == "Anncle" | mem_cell_oth == "Auncle" | mem_cell_oth == "Auncle," ///
	| mem_cell_oth == "Aunkle" | mem_cell_oth == "CHACHA" | mem_cell_oth == "Cacha" | mem_cell_oth == "Chaca ke pass" | mem_cell_oth == "Chach he ke pass" ///
	| mem_cell_oth == "Chach ke pass hai" | mem_cell_oth == "Chach," | mem_cell_oth == "Chacha" | mem_cell_oth == "Chacha," | mem_cell_oth == "Chachs" ///
	| mem_cell_oth == "Chaha" | mem_cell_oth == "Chcha ke pass" | mem_cell_oth == "Chhacha ji"
	
replace mem_cell_oth = "P. Grandfather, Uncle-Chacha, Aunt-Bua" if mem_cell_oth == "Bua, dada , chacha"
replace mem_cell_oth = "P. Grandfather, Aunt-Bua" if mem_cell_oth == "Buaa ke pass dada ke pass"

replace mem_cell_oth = "Uncle-Tau, Uncle-Chacha" if mem_cell_oth == "Chacha aur tau" | mem_cell_oth == "Tau aur Chacha k pass"
replace mem_cell_oth = "P. Grandfather, Uncle-Chacha, Aunt-Chachi" if mem_cell_oth == "Chacha, chachi, dada" | mem_cell_oth == "Dada g kaka g kaki g" | mem_cell_oth == "Chacha, Chachi, dada"
replace mem_cell_oth = "P. Grandfather, Uncle-Chacha, Uncle-Tau" if mem_cell_oth == "Chacha, tau ji, dada," | mem_cell_oth == "Dada chacha taue"

replace mem_cell_oth = "P. Grandfather, Uncle-Chacha" if mem_cell_oth == "Ankal and dada" | mem_cell_oth == "Chacha ji aur  dada ke pass" ///
	| mem_cell_oth == "Chacha,  dada" | mem_cell_oth == "Chacha, dada" | mem_cell_oth == "Chacha, dada," | mem_cell_oth == "Daada ji, kaaka" ///
	| mem_cell_oth == "Dada  ,  uncle" | mem_cell_oth == "Dada  chacha" | mem_cell_oth == "Dada  kaku" | mem_cell_oth == "Dada , chacha" | mem_cell_oth == "Dada chacha" ///
	| mem_cell_oth == "Dada ji , kaka ji" | mem_cell_oth == "Dada ji, chacha ke pass" | mem_cell_oth == "Dada kaka" | mem_cell_oth == "Dada n chacha k pas" ///
	| mem_cell_oth == "Dada, chacha" | mem_cell_oth == "Dada, kaka" | mem_cell_oth == "Dada, uncal" | mem_cell_oth == "Dada , uncle" | mem_cell_oth == "Kaka, Dada"
replace mem_cell_oth = regexr(mem_cell_oth, "^Ka.*$", "Uncle-Chacha")

	
replace mem_cell_oth = regexr(mem_cell_oth, "^Daa.*$", "P. Grandmother")
replace mem_cell_oth = "P. Grandmother, Uncle-Chacha" if mem_cell_oth == "Dadi  chacha" | mem_cell_oth == "Dadi chacha" | mem_cell_oth == "Dadi or uncle" ///
	| mem_cell_oth == "Dadi, chacha" | mem_cell_oth == "Dadi, uncle" | mem_cell_oth == "Aunkle and dadiji" | mem_cell_oth == "Chacha aur dadi"

replace mem_cell_oth = "Uncle-Chacha, Aunt-Mausi" if mem_cell_oth == "Chacha, mausi" | mem_cell_oth == "Chacha, mosi" 

replace mem_cell_oth = "Uncle-Mausa, Brother-in-law" if mem_cell_oth == "Jija& mausha"
replace mem_cell_oth = regexr(mem_cell_oth, "^J.*$", "Brother-in-law")

replace mem_cell_oth = "Uncle-Tau" if mem_cell_oth == "Auncle,  (tau)" | mem_cell_oth == "Uncle,tau" | mem_cell_oth == "Bade papa k paas" | mem_cell_oth == "Big father"
replace mem_cell_oth = regexr(mem_cell_oth, "^Taa.*$", "Uncle-Tau")


replace mem_cell_oth = "Uncle-Fufa, Aunt-Bua" if mem_cell_oth == "Bhus, fufaji" | mem_cell_oth == "Bhuaa or fafa g" | mem_cell_oth == "Bua , fuuffa" | mem_cell_oth == "Bua fufa" ///
	| mem_cell_oth == "Buha , , fufha" | mem_cell_oth == "Buha, fufha je ke pass" | mem_cell_oth == "Buva , fufa" | mem_cell_oth == "Fufa bua"
replace mem_cell_oth = "Uncle-Fufa" if mem_cell_oth == "FUFA JI KE PASS" | mem_cell_oth == "Fufg ji"  | mem_cell_oth == "Husband of bhua"
replace mem_cell_oth = "Uncle-Fufa, Brothers" if mem_cell_oth == "Fuffa, Brothers"
replace mem_cell_oth = regexr(mem_cell_oth, "^Fufa.*$", "Uncle-Fufa")
replace mem_cell_oth = regexr(mem_cell_oth, "^Fo.*$", "Uncle-Fufa")

replace mem_cell_oth = "Aunt-Chachi" if mem_cell_oth == "Chachi" | mem_cell_oth == "Chachi ji" 
	
replace mem_cell_oth = regexr(mem_cell_oth, "^DA.*$", "P. Grandfather")
replace mem_cell_oth = "P. Grandfather, P. Grandmother" if mem_cell_oth == "Dada , dadi" | mem_cell_oth == "Dada ,dadi" | mem_cell_oth == "Dada dadi" ///
	| mem_cell_oth == "Dada ji , dadi ji" | mem_cell_oth == "Dada aur daadi k pass" | mem_cell_oth == "Dada, dado" 
	
replace mem_cell_oth = "P. Grandfather, Uncle-Tau" if mem_cell_oth == "Dada ,tau" | mem_cell_oth == "Dada, tau" | mem_cell_oth == "Tau ji or Dada ji ka pass" ///
	| mem_cell_oth == "Dada , tau" | mem_cell_oth == "Dada , uncle"
replace mem_cell_oth = "P. Grandfather, P. Grandmother, Uncle-Chacha, Aunt-Chachi" if mem_cell_oth == "Dada, dadi, chacha, , Chachi"
replace mem_cell_oth = "P. Grandfather, Uncle-Tau, Aunt-Tai" if mem_cell_oth == "Dada, tau, tai,"

replace mem_cell_oth = regexr(mem_cell_oth, "^Dada.*adi$", "P. Grandfather, P. Grandmother")
replace mem_cell_oth = regexr(mem_cell_oth, "^Dada.*$", "P. Grandfather")
replace mem_cell_oth = regexr(mem_cell_oth, "^Dad.*$", "P. Grandmother")

replace mem_cell_oth = regexr(mem_cell_oth, "^Grand.*other$", "Grandmother")
replace mem_cell_oth = "Grandmomther" if mem_cell_oth == "GRANDMOTHER"
replace mem_cell_oth = "Grandfather" if mem_cell_oth == "G. Father" | mem_cell_oth == "GRANDFATHER" | mem_cell_oth == "Grand father"
replace mem_cell_oth = "Grandfather, Uncle" if mem_cell_oth == "Grand father , auncle" | mem_cell_oth == "Grandfather,      Uncle"
replace mem_cell_oth = "Grandfather, Grandmother" if mem_cell_oth == "Grandmother, grandfather"

replace mem_cell_oth = "Not at home" if mem_cell_oth == "Gharvpar phone nahi h" | mem_cell_oth == "Mobile nahi rakhte" | mem_cell_oth == "NAHI HAI"
replace mem_cell_oth = regexr(mem_cell_oth, "^GHAR.*$", "At home")
replace mem_cell_oth = regexr(mem_cell_oth, "^Ghar.*$", "At home")
replace mem_cell_oth = regexr(mem_cell_oth, "^Hom.*$", "At home")
replace mem_cell_oth = regexr(mem_cell_oth, "^Hous.*$", "At home")
replace mem_cell_oth = "At home" if mem_cell_oth == "Dher per h" | mem_cell_oth == "Ek phone Ghar mein rehata h" | mem_cell_oth == "Gar par" ///			
	| mem_cell_oth == "Gher per bhi hai" | mem_cell_oth == "In the house" | mem_cell_oth == "Khar" | mem_cell_oth == "Khar mai" | mem_cell_oth == "Mobile is in house"
	
replace mem_cell_oth = regexr(mem_cell_oth, "^Kh.*$", "Self")

replace mem_cell_oth = regexr(mem_cell_oth, "^Mama.*mi$", "Uncle-Mama, Aunt-Mami")
replace mem_cell_oth = "Uncle-Mama, Aunt-Mami" if mem_cell_oth == "MAMA, MAMI" | mem_cell_oth == "Maama, maami ji" | mem_cell_oth == "Mama g and mami g" ///
	| mem_cell_oth == "Mama ji , maami ji k paas" | mem_cell_oth == "Mama mamai" | mem_cell_oth == "Mama mami  2 mami ke pass" | mem_cell_oth == "Mama mami ma"
replace mem_cell_oth = regexr(mem_cell_oth, "^Mama ji k.*$", "Uncle-Mama")
replace mem_cell_oth = regexr(mem_cell_oth, "^Mama k.*$", "Uncle-Mama")
replace mem_cell_oth = "Uncle-Mama" if mem_cell_oth == "MAMA" | mem_cell_oth == "MAMA JI" | mem_cell_oth == "Maama" | mem_cell_oth == "Mama" | mem_cell_oth == "Mama g" ///
	| mem_cell_oth == "Mama j7" | mem_cell_oth == "Mama je" | mem_cell_oth == "Mama ji" | mem_cell_oth == "Mamaji" | mem_cell_oth == "Mama n ghar k liye" ///
	| mem_cell_oth == "Mamq ke pas" | mem_cell_oth == "Msma ji" 
	
replace mem_cell_oth = "M. Grandmother, Uncle-Mama" if mem_cell_oth == "Mama and nani" | mem_cell_oth == "Mama nani" | mem_cell_oth == "Mama, nani" ///
	| mem_cell_oth == "Nani mama" | mem_cell_oth == "Nani, mama" 
replace mem_cell_oth = "Uncle-Mama, Aunt-Mausi" if mem_cell_oth == "Mama nd mosi" 
replace mem_cell_oth = "Uncle-Mama, Brother" if mem_cell_oth == "Mama, bhai" 
replace mem_cell_oth = "Unlce-Mama, Aunt-Mami, Cousin brother" if mem_cell_oth == "Mama, mami, cozan brother" 
replace mem_cell_oth = "Unlce-Mama, Cousin brother" if mem_cell_oth == "Mama, chachera bhai" 
replace mem_cell_oth = "M. Grandfather, M. Grandmother, Uncle-Mama, Aunt-Mausi" if mem_cell_oth == "Mama, nana, nani , mosi"

replace mem_cell_oth = "M. Grandfather, Uncle-Mama, Aunt-Mami" if mem_cell_oth == "MAMA MAMI AND NANA" | mem_cell_oth == "Mama ji and mami ji aur nana ke pass" ///
	| mem_cell_oth == "Mama mami nana" | mem_cell_oth == "Mama, mami, nana" 
replace mem_cell_oth = " Aunt-Mami" if mem_cell_oth == "Mami" | mem_cell_oth == " Mami ke pass" 

replace mem_cell_oth = regexr(mem_cell_oth, "^Mama.*$", "M. Grandfather, Uncle-Mama")
replace mem_cell_oth = "M. Grandfather, Uncle-Mama" if mem_cell_oth == "MAMA JI or NANA JI"

replace mem_cell_oth = regexr(mem_cell_oth, "^UN.*Y$", "Aunt, Uncle")
replace mem_cell_oth = regexr(mem_cell_oth, "^UN.*$", "Uncle")





gen mem_cell_uncle = strpos(mem_cell_oth, "Uncle")
gen mem_cell_gf = strpos(mem_cell_oth, "Grandfather")
replace mem_cell_oth = "Uncle & Grandfather" if mem_cell_uncle > 0 & mem_cell_gf > 0




*replace mem_cell_dummy = mem_cell_oth + 1 if get_water_dummy > 0























replace mem_cell_oth = "Self and Grandmother" if mem_cell_oth == "Mere pass, nani kee pass" 
replace mem_cell_oth = regexr(mem_cell_oth, "^Mer.*$", "Self")
replace mem_cell_oth = regexr(mem_cell_oth, "^Khud.*$", "Self")
replace mem_cell_oth = "Self" if mem_cell_oth == "Own" | mem_cell_oth == "Self k liye" | mem_cell_oth == "Apne pass" | ///
	mem_cell_oth == "Khd ke pass hai" | mem_cell_oth == "SWAM KE PASS BHI HAI" |mem_cell_oth == "I"

replace mem_cell_oth = regexr(mem_cell_oth, "^Aunc.*$", "Uncle")
replace mem_cell_oth = "Uncle" if mem_cell_oth == "Ankal" | mem_cell_oth == "Anncle" | mem_cell_oth == "Aunkle" | mem_cell_oth == "Bade papa k paas" ///
	| mem_cell_oth == "Big father" 
	

replace mem_cell_oth = "Aunt" if mem_cell_oth == "Aunti" | mem_cell_oth == "BUA JI" | mem_cell_oth == "Bua" | mem_cell_oth == "Bua g" | mem_cell_oth == "Buaji"
replace mem_cell_oth = "Aunt, Grandfather & Uncle" if mem_cell_oth == "Bua, dada , chacha"
replace mem_cell_oth = "Aunt, Grandfather" if mem_cell_oth == "Buaa ke pass dada ke pass"


replace mem_cell_oth = "Aunt & Uncle" if mem_cell_oth == "ANTI  UNCLE" | mem_cell_oth == "Buha , , fufha" | mem_cell_oth == "Buha, fufha je ke pass"

replace mem_cell_oth = regexr(mem_cell_oth, "^Bhu.*$", "Aunt & Uncle")
replace mem_cell_oth = regexr(mem_cell_oth, "^Bu.*fa$", "Aunt & Uncle")

replace mem_cell_oth = regexr(mem_cell_oth, "^Bhab.*$", "Sister-in-law")
replace mem_cell_oth = "Sister-in-law" if mem_cell_oth == "BHABHI"

replace mem_cell_oth = "Grandfather" if mem_cell_oth == "Baba ji" | mem_cell_oth == "Baba ji ka pass"

replace mem_cell_oth = "No phone at home" if mem_cell_oth == "Gharvpar phone nahi h" 
replace mem_cell_oth = regexr(mem_cell_oth, "^Ghar.*$", "At home")
replace mem_cell_oth = regexr(mem_cell_oth, "^Ho.*$", "At home")

replace mem_cell_oth = regexr(mem_cell_oth, "^UNCLE.*$", "Aunt/Uncle")
replace mem_cell_oth = regexr(mem_cell_oth, "^Ch.*$", "Aunt/Uncle") 
replace mem_cell_oth = regexr(mem_cell_oth, "^CH.*$", "Aunt/Uncle") 
replace mem_cell_oth = regexr(mem_cell_oth, "^Ma.*$", "Aunt/Uncle")
replace mem_cell_oth = regexr(mem_cell_oth, "^Mos.*$", "Aunt/Uncle")

replace mem_cell_oth = regexr(mem_cell_oth, "^Fuf.*$", "Aunt/Uncle")
replace mem_cell_oth = regexr(mem_cell_oth, "^MAMA.*$", "Aunt/Uncle")
replace mem_cell_oth = regexr(mem_cell_oth, "^Ancle.*$", "Aunt/Uncle")
replace mem_cell_oth = regexr(mem_cell_oth, "^Auncle.*$", "Aunt/Uncle")
replace mem_cell_oth = regexr(mem_cell_oth, "^Aunkle.*$", "Aunt/Uncle")
replace mem_cell_oth = regexr(mem_cell_oth, "^Ankal.*$", "Aunt/Uncle")
replace mem_cell_oth = regexr(mem_cell_oth, "^Bhua.*$", "Aunt/Uncle")
replace mem_cell_oth = regexr(mem_cell_oth, "^Ta.*$", "Aunt/Uncle")
replace mem_cell_oth = regexr(mem_cell_oth, "^Bu.*$", "Aunt/Uncle")
replace mem_cell_oth = regexr(mem_cell_oth, "^F.*$", "Aunt/Uncle")
replace mem_cell_oth = regexr(mem_cell_oth, "^Ka.*$", "Aunt/Uncle")

replace mem_cell_oth = "Aunt/Uncle" if mem_cell_oth == "ANTI  UNCLE" | mem_cell_oth == "Anncle" | mem_cell_oth == "Aunti" | ///
	mem_cell_oth == "BUA JI" | mem_cell_oth == "Thau" 
replace mem_cell_oth = "Aunt/Uncle" if mem_cell_oth == "Bade papa k paas" | mem_cell_oth == "Big father" | mem_cell_oth == "Cacha" | ///
	mem_cell_oth == "Husband of bhua" 
replace mem_cell_oth = "Aunt/Uncle" if mem_cell_oth == "Moosi" | mem_cell_oth == "Msma ji" | mem_cell_oth == "TAU" | ///
	mem_cell_oth == "TTU" | mem_cell_oth == "Unkal" 

replace mem_cell_oth = regexr(mem_cell_oth, "^Grand.*$", "Grandparents")
replace mem_cell_oth = regexr(mem_cell_oth, "^Dad.*$", "Grandparents")
replace mem_cell_oth = regexr(mem_cell_oth, "^DAD.*$", "Grandparents")
replace mem_cell_oth = regexr(mem_cell_oth, "^Daad.*$", "Grandparents")
replace mem_cell_oth = regexr(mem_cell_oth, "^Nan.*$", "Grandparents")
replace mem_cell_oth = regexr(mem_cell_oth, "^Naan.*$", "Grandparents")
replace mem_cell_oth = regexr(mem_cell_oth, "^NAN.*$", "Grandparents")
replace mem_cell_oth = regexr(mem_cell_oth, "^GRAND.*$", "Grandparents")
replace mem_cell_oth = "Grandparents" if mem_cell_oth == "G. Father" | mem_cell_oth == "Nwna nani" | mem_cell_oth == "dada , nani k pas" | ///
	mem_cell_oth == "Baba ji" | mem_cell_oth == "Baba ji ka pass"

replace mem_cell_oth = regexr(mem_cell_oth, "^Ghar.*$", "At home")
replace mem_cell_oth = regexr(mem_cell_oth, "^Hom.*$", "At home")
replace mem_cell_oth = regexr(mem_cell_oth, "^Hous.*$", "At home")
replace mem_cell_oth = "At home" if mem_cell_oth == "Dher per h" | mem_cell_oth == "Ek phone Ghar mein rehata h" | mem_cell_oth == "GHAR PAR H" | ///
	mem_cell_oth == "GHAR PER BHI HAI" | mem_cell_oth == "Mobile is in house"
replace mem_cell_oth = "At home" if mem_cell_oth == "Gar par" | mem_cell_oth == "Gher per bhi hai" | mem_cell_oth == "In the house" | ///
	mem_cell_oth == "Khar" | mem_cell_oth == "Khar mai"

replace mem_cell_oth = regexr(mem_cell_oth, "^Jija.*$", "Brother-in-law")
replace mem_cell_oth = "Brother-in-law" if mem_cell_oth == "JIJA JI" | mem_cell_oth == "Jeeja"


replace mem_cell_oth = "No cell phone" if mem_cell_oth == "Mobile nahi rakhte" | mem_cell_oth == "NAHI HAI" | mem_cell_oth == "Nahi hai" | ///
	mem_cell_oth == "Phone nahi h." | mem_cell_oth == "Lad line"
replace cellphone_house = 2 if mem_cell_oth == "No cell phone"
replace access_mobile = .s if mem_cell_oth == "No cell phone"
replace mem_cell = ".s" if mem_cell_oth == "No cell phone"
replace mem_cell_5 = 0 if mem_cell_oth == "No cell phone"
replace mem_cell_oth = ".s" if mem_cell_oth == "No cell phone"

** talk_health_oth **

replace talk_health_oth = regexr(talk_health_oth, "^Ta.*$", "Aunt/Uncle")
replace talk_health_oth = regexr(talk_health_oth, "^Bhua.*$", "Aunt/Uncle")
replace talk_health_oth = regexr(talk_health_oth, "^Bua.*$", "Aunt/Uncle")
replace talk_health_oth = regexr(talk_health_oth, "^Cha.*$", "Aunt/Uncle")
replace talk_health_oth = regexr(talk_health_oth, "^Ka.*$", "Aunt/Uncle")
replace talk_health_oth = regexr(talk_health_oth, "^Maa.*$", "Aunt/Uncle")
replace talk_health_oth = regexr(talk_health_oth, "^Mam.*$", "Aunt/Uncle")
replace talk_health_oth = regexr(talk_health_oth, "^Mas.*$", "Aunt/Uncle")
replace talk_health_oth = regexr(talk_health_oth, "^Mos.*$", "Aunt/Uncle")
replace talk_health_oth = regexr(talk_health_oth, "^Aunt.*$", "Aunt/Uncle")
replace talk_health_oth = regexr(talk_health_oth, "^Booa.*$", "Aunt/Uncle")
replace talk_health_oth = regexr(talk_health_oth, "^Bu.*$", "Aunt/Uncle")

replace talk_health_oth = "Aunt/Uncle" if talk_health_oth == "AUNTY" | talk_health_oth == "BUA JI" | talk_health_oth == "BZUA" | ///
	talk_health_oth == "Bawa" | talk_health_oth == "Fufa ji and dadi ji"
replace talk_health_oth = "Aunt/Uncle" if talk_health_oth == "MOUSI JI" | talk_health_oth == "Uncle" | talk_health_oth == "Unty" | ///
	talk_health_oth == "Anath ashram uncle"

replace talk_health_oth = "Teacher" if talk_health_oth == "Apni madam se" | talk_health_oth == "TEACHERS" | talk_health_oth == "Teacher"

replace talk_health_oth = regexr(talk_health_oth, "^Da.*$", "Grandparent")
replace talk_health_oth = regexr(talk_health_oth, "^Grand.*$", "Grandparent")
replace talk_health_oth = regexr(talk_health_oth, "^DAD.*$", "Grandparent")

replace talk_health_oth = regexr(talk_health_oth, "^NAN.*$", "Grandparent")
replace talk_health_oth = regexr(talk_health_oth, "^Naan.*$", "Grandparent")
replace talk_health_oth = regexr(talk_health_oth, "^Nan.*$", "Grandparent")


replace talk_health_oth = regexr(talk_health_oth, "^Kis.*$", "No one")
replace talk_health_oth = regexr(talk_health_oth, "^Nahi.*$", "No one")
replace talk_health_oth = regexr(talk_health_oth, "^KISI.*$", "No one")
replace talk_health_oth = regexr(talk_health_oth, "^Self.*$", "No one")
replace talk_health_oth = "No one" if talk_health_oth == "Kese ko na"
replace talk_health_oth = "No one" if talk_health_oth == "Koi mre par viswas nhi karta"

replace talk_health_oth = regexr(talk_health_oth, "^Bha.*$", "Sister-in-law")
replace talk_health_oth = "Brother-in-law" if talk_health_oth == "Jijja ji"
replace talk_health_oth = "Mother & father" if talk_health_oth == "Mumy papa" | talk_health_oth == "Papa mumy" 
replace talk_health_oth = "A family member" if talk_health_oth == "Any one" | talk_health_oth == "Any person in house" | ///
	talk_health_oth == "Cosion sister" | talk_health_oth == "Cousin" | talk_health_oth == "Monika" | talk_health_oth == "Azad"

replace talk_health = 5 if talk_health_oth == "Grandparent"
replace talk_health_oth = ".s" if talk_health_oth == "Grandparent"
replace talk_health = 6 if talk_health_oth == "Friend"
replace talk_health_oth = ".s" if talk_health_oth == "Friend"
replace talk_health = 4 if talk_health_oth == "Didi"
replace talk_health_oth = ".s" if talk_health_oth == "Didi"
replace talk_health = 1 if talk_health_oth == "Ma, I"
replace talk_health_oth = ".s" if talk_health_oth == "Ma, I"

** help_reason variables **

replace help_cook_reason = "No reason" if help_cook_reason == "Nahi hai"
replace help_clean_reason = "No reason" if help_clean_reason == "Nahi hai"
replace help_clean_home_reason = "No reason" if help_clean_home_reason == "Nahi hai"
replace help_laundry_reason = "Have washing machine" if help_laundry_reason == "Machin m dhote h" | help_laundry_reason == "Maseen h"


replace help_get_water_reason = regexr(help_get_water_reason, "^Ghar.*$", "Water comes at home")
replace help_get_water_reason = regexr(help_get_water_reason, "^Gar.*$", "Water comes at home")
replace help_get_water_reason = regexr(help_get_water_reason, "^Lana.*$", "Water comes at home")
gen get_water_dummy = strpos(help_get_water_reason, "ghar")
replace help_get_water_reason = "Water comes at home" if get_water_dummy > 0
replace help_get_water_reason = "Water comes at home" if help_get_water_reason == "Available at home" | help_get_water_reason == "Hgar me hai" | ///
	help_get_water_reason == "In home" | help_get_water_reason == "From tap"
replace help_get_water_reason = "Water comes at home" if help_get_water_reason == "Not required" | ///
	help_get_water_reason == "WATER AVAILABLE AT HOME" | help_get_water_reason == "Yahi aata hai"
replace help_get_water_reason = "No reason" if help_get_water_reason == "Na" | help_get_water_reason == "Nahi hai" | ///
	help_get_water_reason == "Nahi hen" | help_get_water_reason == "Nhi h"
drop get_water_dummy

replace help_care_child_reason = regexr(help_care_child_reason, "^Ba.*$", "No child at home")
replace help_care_child_reason = "No child at home" if help_care_child_reason == "BACHCHE NAHI HAI" | help_care_child_reason == "Jo child" | ///
	help_care_child_reason == "Mhi h" | help_care_child_reason == "Mo little child" 
replace help_care_child_reason = "No child at home" if help_care_child_reason == "Bhai bhar rehta h" | help_care_child_reason == "Sath nhi rahta" | ///
	help_care_child_reason == "Bhai bahan bade hai" 
replace help_care_child_reason = regexr(help_care_child_reason, "^C.*$", "No child at home")
replace help_care_child_reason = regexr(help_care_child_reason, "^Gh.*$", "No child at home")
replace help_care_child_reason = regexr(help_care_child_reason, "^K.*$", "No child at home")
replace help_care_child_reason = regexr(help_care_child_reason, "^N.*$", "No child at home")
replace help_care_child_reason = regexr(help_care_child_reason, "^H.*$", "No child at home")

replace help_care_old_reason = "No old people at home" if help_care_old_reason != ".s" & help_care_old_reason != ""

replace help_care_cattle_reason = "No cattle at home" if help_care_cattle_reason != ".s" & help_care_cattle_reason != ""

replace help_farming_reason = "Too young to work" if help_farming_reason == "Abhi choti hu"  
replace help_farming = 1 if help_farming_reason == "Yes"
replace help_farming_reason = ".s" if help_farming_reason == "Yes"

replace help_farming_reason = "No land" if help_farming_reason != ".s" & help_farming_reason != "" & help_farming_reason != "Too young to work" 

replace help_get_groce_reason = "No reason" if help_get_groce_reason == "Nahi hai" | help_get_groce_reason == "Nehi hai" | help_get_groce_reason == "Nhi h." 
replace help_get_groce_reason = "Field not available" if help_get_groce_reason == "FIELD NOT AVAILABLE" | help_get_groce_reason == "Khet nhi h" | ///
	help_get_groce_reason == "Not available" 
replace help_get_groce_reason = "Parents get it" if help_get_groce_reason == "Mummy apne aap le aati h" | help_get_groce_reason == "Papa lete hai"  

replace deci_cook_oth = regexr(deci_cook_oth, "^Ma.*$", "Aunt/Uncle")
replace deci_cook_oth = regexr(deci_cook_oth, "^T.*$", "Aunt/Uncle")
replace deci_cook_oth = regexr(deci_cook_oth, "^Cha.*$", "Aunt/Uncle")
replace deci_cook_oth = "Aunt/Uncle" if deci_cook_oth == "AUNTY" | deci_cook_oth == "Anti" | deci_cook_oth == "Anut" | ///
	deci_cook_oth == "Aunti" | deci_cook_oth == "Aunty" | deci_cook_oth == "Booa ji" | deci_cook_oth == "CHACHA" | deci_cook_oth == "MAMA  MAMI"
replace deci_cook_oth = regexr(deci_cook_oth, "^BUA.*$", "Aunt/Uncle")
replace deci_cook_oth = regexr(deci_cook_oth, "^Bu.*$", "Aunt/Uncle")
replace deci_cook_oth = regexr(deci_cook_oth, "^Bhu.*$", "Aunt/Uncle")
replace deci_cook_oth = regexr(deci_cook_oth, "^Kak.*$", "Aunt/Uncle")
replace deci_cook_oth = regexr(deci_cook_oth, "^Mos.*$", "Aunt/Uncle")
replace deci_cook_oth = regexr(deci_cook_oth, "^Fuf.*$", "Aunt/Uncle")
replace deci_cook_oth = regexr(deci_cook_oth, "^U.*$", "Aunt/Uncle")

replace deci_cook_oth = regexr(deci_cook_oth, "^Na.*$", "Grandparent")
replace deci_cook_oth = regexr(deci_cook_oth, "^Da.*$", "Grandparent")
replace deci_cook_oth = "Grandparent" if deci_cook_oth == "DADA" | deci_cook_oth == "Grandmother" | deci_cook_oth == "NAANI G" | deci_cook_oth == "NANI" 

replace deci_cook_oth = regexr(deci_cook_oth, "^Bac.*$", "Children")
replace deci_cook_oth = "Children" if deci_cook_oth == "BACHCHE" | deci_cook_oth == "Becho se puche ker" | deci_cook_oth == "Bhacho ki" | ///
	deci_cook_oth == "Bhcho ki pasnd ka" | deci_cook_oth == "CHILDREN" | deci_cook_oth == "Child" | deci_cook_oth == "Childern" | ///
	deci_cook_oth == "Ghar me sabhi bacche" | deci_cook_oth == "Sab bache" | deci_cook_oth == "Ham bhai bhan" | deci_cook_oth == "We" | ///
	deci_cook_oth == "Me, and  sister" | deci_cook_oth == "Meri or bhai ki marji se" | deci_cook_oth == "Self nd brother" | deci_cook_oth == "Self, Sister"
	
replace deci_cook_oth = "Everyone in family" if deci_cook_oth == "All family member" | deci_cook_oth == "Family members" | ///
	deci_cook_oth == "Sabh ki" | deci_cook_oth == "Sabi family mamber" | deci_cook_oth == "Sabi ki"

replace deci_cook_oth = "Anyone in family" if deci_cook_oth == "Koe bhi le leta h" | deci_cook_oth == "Koy b family mamber me se" 

replace deci_cook_oth = regexr(deci_cook_oth, "^Apne.*$", "Self")
replace deci_cook_oth = regexr(deci_cook_oth, "^Khud.*$", "Self")
replace deci_cook_oth = "Self" if deci_cook_oth == "I" | deci_cook_oth == "MYSELF" | deci_cook_oth == "Kud" | deci_cook_oth == "Myself" | ///
	deci_cook_oth == "Me" | deci_cook_oth == "Me khud"

replace deci_cook_oth = regexr(deci_cook_oth, "^Sis.*$", "Sister")
replace deci_cook_oth = regexr(deci_cook_oth, "^Big.*$", "Sister")
replace deci_cook_oth = "Sister" if deci_cook_oth == "SISTER" | deci_cook_oth == "Sisters" | deci_cook_oth == "Sistet" | ///
	deci_cook_oth == "Sistrr" | deci_cook_oth == "BAHAN" | deci_cook_oth == "Bahan" | deci_cook_oth == "Bahen" | deci_cook_oth == "Ban" | ///
	deci_cook_oth == "Behan" | deci_cook_oth == "Bhan" | deci_cook_oth == "Bhn" | deci_cook_oth == "Elder sister" 
gen deci_cook_dummy = strpos(deci_cook_oth, "idi")
replace deci_cook_oth = "Sister" if deci_cook_dummy > 0
drop deci_cook_dummy
replace deci_cook_oth = "Sister" if deci_cook_oth == "Pooja" // after checking in the sibling roster
replace deci_cook_oth = "Sister" if deci_cook_oth == "Sashi" // after checking in the sibling roster

replace deci_cook_oth = regexr(deci_cook_oth, "^Bada.*$", "Brother")
replace deci_cook_oth = "Brother" if deci_cook_oth == "Bhai" | deci_cook_oth == "Big brother" | deci_cook_oth == "Borther" | ///
	deci_cook_oth == "BROTHER" | deci_cook_oth == "Brothers" | deci_cook_oth == "Chhota bhai" 

replace deci_cook_oth = "Siblings" if deci_cook_oth == "Bhai bhan" | deci_cook_oth == "Bhai or bhan" | deci_cook_oth == "Bhai or m" | ///
	deci_cook_oth == "Bhan bhi" | deci_cook_oth == "Brother sister" 

replace deci_cook_oth = "Sister-in-law" if deci_cook_oth == "Babi" | deci_cook_oth == "Bhabe je" | deci_cook_oth == "Bhabhi" | deci_cook_oth == "Bhabi"

replace deci_cook_2 = 1 if deci_cook_oth == "Asha"
replace deci_cook_oth = ".s" if deci_cook_oth == "Asha"

replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^Fu.*$", "Aunt/Uncle")
replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^Bu.*$", "Aunt/Uncle")
replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^Bhu.*$", "Aunt/Uncle")
replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^Ma.*$", "Aunt/Uncle")
replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^T.*$", "Aunt/Uncle")
replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^U.*$", "Aunt/Uncle")
replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^Mos.*$", "Aunt/Uncle")
replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^Cha.*$", "Aunt/Uncle")
replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^Ka.*$", "Aunt/Uncle")
replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^MA.*$", "Aunt/Uncle")
replace deci_buy_tv_oth = "Aunt/Uncle" if deci_buy_tv_oth == "AUNTY" | deci_buy_tv_oth == "AUNTY" | deci_buy_tv_oth == "Anti" | ///
	deci_buy_tv_oth == "Auncle" | deci_buy_tv_oth == "BUA JI" | deci_buy_tv_oth == "CHACHA" | deci_buy_tv_oth == "FUFA JI" | ///
	deci_buy_tv_oth == "Foofa ji" | deci_buy_tv_oth == "Husband of bhua" | deci_buy_tv_oth == "2Mama"

replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^Na.*$", "Grandparent")
replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^NA.*$", "Grandparent")
replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^DA.*$", "Grandparent")
replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^Da.*$", "Grandparent") 
replace deci_buy_tv_oth = "Grandparent" if deci_buy_tv_oth == "Grandfather"

replace deci_buy_tv_oth = "Sister" if deci_buy_tv_oth == "Didi" | deci_buy_tv_oth == "SISTER" | deci_buy_tv_oth == "Sister, jija"

replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^Bhai.*$", "Brother")
replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^Bro.*$", "Brother")
gen deci_tv_dummy = strpos(deci_buy_tv_oth, "hai")
replace deci_buy_tv_oth = "Brother" if deci_tv_dummy > 0
drop deci_tv_dummy
replace deci_buy_tv_oth = "Brother" if deci_buy_tv_oth == "BHAI" | deci_buy_tv_oth == "BROTHER" | deci_buy_tv_oth == "Bahi" | ///
	deci_buy_tv_oth == "Bhiya" | deci_buy_tv_oth == "Big brother" | deci_buy_tv_oth == "Older brother"

replace deci_buy_tv_oth = regexr(deci_buy_tv_oth, "^Jij.*$", "Brother-in-law")
replace deci_buy_tv_oth = "Sister-in-law" if deci_buy_tv_oth == "Bhabhi"

replace deci_buy_tv_oth = "Everyone in family" if deci_buy_tv_oth == "All family member" | deci_buy_tv_oth == "All members" | ///
	deci_buy_tv_oth == "Ghar ke dbi member" | deci_buy_tv_oth == "Hum sabka" | deci_buy_tv_oth == "SABKI SAHMATI HOTI HAI" | ///
	deci_buy_tv_oth == "Sabhi" | deci_buy_tv_oth == "Sare"
	
replace deci_buy_tv_1 = 1 if deci_buy_tv_oth == "Father &mother" 
replace deci_buy_tv_2 = 1 if deci_buy_tv_oth == "Father &mother" 
replace deci_buy_tv_oth = ".s" if deci_buy_tv_oth == "Father &mother"
