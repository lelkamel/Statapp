* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
* 																	  *
* Project: Breakthrough (BT)     									  *
*                                                                	  *
* Purpose: Codifying "Other" responses				              	  *
*                  													  *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

**relation of respondent with the student**
replace relation_oth = "Aunt" if relation_oth == "Aunty"
replace relation_oth = "Aunt" if relation_oth == "ANTI"
replace relation_oth = "Aunt-Bua" if relation_oth == "BUA"
replace relation_oth = "Aunt-Bua" if relation_oth == "Bouy"
replace relation_oth = regexr(relation_oth, "^Bu.*$", "Aunt-Bua")
replace relation_oth = regexr(relation_oth, "^Bhu.*$", "Aunt-Bua")
replace relation_oth = "Aunt-Mami" if relation_oth == "MAMI"
replace relation_oth = "Aunt-Mami" if relation_oth == "Maami"
replace relation_oth = "Aunt-Mami" if relation_oth == "Mami"
replace relation_oth = "Aunt-Mami" if relation_oth == "Mami ji"
replace relation_oth = "Aunt-Mami" if relation_oth == "Mami7"
replace relation_oth = "Aunt-Mausi" if relation_oth == "Moch"
replace relation_oth = "Aunt-Mausi" if relation_oth == "Mosi"
replace relation_oth = "Aunt-Tai" if relation_oth == "Tai"
replace relation_oth = "Aunt-Chachi" if relation_oth == "Chachi"
replace relation_oth = "Uncle-Chacha" if relation_oth == "Chacha"
replace relation_oth = "Uncle-Mama" if relation_oth == "Maama"
replace relation_oth = regexr(relation_oth, "^Mama.*$", "Uncle-Mama")
replace relation_oth = "Uncle-Fufa" if relation_oth == "Phupha"
replace relation_oth = regexr(relation_oth, "^Fuf.*$", "Uncle-Fufa")
replace relation_oth = regexr(relation_oth, "^Ta.*$", "Uncle-Tau")
replace relation_oth = regexr(relation_oth, "^Ji.*$", "Brother in law")
replace relation_oth = "Uncle" if relation_oth == "UNCLE"
replace relation_oth = "Sister in law" if relation_oth == "Bhabhi"
replace relation_oth = "Brother" if relation_oth == "Bhai"
replace relation_oth = regexr(relation_oth, "^Nani.*$", "Maternal Grandmother")
replace relation_oth = regexr(relation_oth, "^Fuf.*$", "Uncle-Fufa")
replace relation_oth = "Maternal Grandmother" if relation_oth == "Nane"
replace relation_oth = "Maternal Grandmother" if relation_oth == "Naani"
replace relation_oth = "Maternal Grandmother" if relation_oth == "NANI JI"
replace relation_oth = "Maternal Grandmother" if relation_oth == "0"
replace relation_oth = "Paternal Grandmother" if relation_oth == "Grandmother"
replace relation_oth = "Paternal Grandmother" if relation_oth == "GRANDMOTHER"
replace relation_oth = regexr(relation_oth, "^Nana.*$", "Maternal Grandfather")
replace relation_oth = "Maternal Grandfather" if relation_oth == "Navada"
replace relation_oth = "Maternal Grandfather" if relation_oth == "NANA JI"
replace relation_oth = "Maternal Grandfather" if relation_oth == "Naana"
replace relation_oth = regexr(relation_oth, "^Dada.*$", "Paternal Grandfather")
replace relation_oth = regexr(relation_oth, "^Dadi.*$", "Paternal Grandmother")
replace relation_oth = "Paternal Grandmother" if relation_oth == "Daadi"
replace relation_oth = "Paternal Grandmother" if relation_oth == "DADI JI"
replace relation_oth = "Paternal Grandfather" if relation_oth == "GRANDFATHER"

**deci_cook others option**
replace deci_cook_oth = regexr(deci_cook_oth, "^Bac.*$", "Children")
replace deci_cook_oth = "Children" if deci_cook_oth == "bacche"
replace deci_cook_oth = "Children" if deci_cook_oth == "Balko ki margi se"
replace deci_cook_oth = "Children" if deci_cook_oth == "Beche"
replace deci_cook_oth = "Children" if deci_cook_oth == "Humare baccha"
replace deci_cook_oth = "Children" if deci_cook_oth == "Kids"
replace deci_cook_oth = "Children" if deci_cook_oth == "Vbacho ki marji se"
replace deci_cook_oth = "Children" if deci_cook_oth == "RBacho ki choice"
replace deci_cook_oth = "Children" if deci_cook_oth == "Bhacho"
replace deci_cook_oth = regexr(deci_cook_oth, "^BA.*$", "Children")
replace deci_cook_oth = "Children" if deci_cook_oth == "Choice of children"
replace deci_cook_oth = "Children" if deci_cook_oth == "Cildran"
replace deci_cook_oth = regexr(deci_cook_oth, "^Chi.*$", "Children")
replace deci_cook_oth = regexr(deci_cook_oth, "^CHI.*$", "Children")
replace deci_cook_oth = regexr(deci_cook_oth, "^All.*$", "All family members")
replace deci_cook_oth = regexr(deci_cook_oth, "^Sab.*$", "All family members")
replace deci_cook_oth = regexr(deci_cook_oth, "^Sb.*$", "All family members")
replace deci_cook_oth = regexr(deci_cook_oth, "^Fam.*$", "All family members")
replace deci_cook_oth = "All family members" if deci_cook_oth == "each member of family"
replace deci_cook_oth = "All family members" if deci_cook_oth == "Each membar of family"
replace deci_cook_oth = "All family members" if deci_cook_oth == "Total family member Choice"
replace deci_cook_oth = regexr(deci_cook_oth, "^Dadi.*$", "Paternal Grandmother")
replace deci_cook_oth = "Paternal Grandmother" if deci_cook_oth == "Aama je"
replace deci_cook_oth = "Paternal Grandmother" if deci_cook_oth == "DADI"
replace deci_cook_oth = "Paternal Grandmother" if deci_cook_oth == "Dedi"
replace deci_cook_oth = "Grandmother" if deci_cook_oth == "GRANDMOTHER"
replace deci_cook_oth = "Grandmother" if deci_cook_oth == "GRAND MOTHER"
replace deci_cook_oth = "Grandmother" if deci_cook_oth == "Grabdmother"
replace deci_cook_oth = "Grandmother" if deci_cook_oth == "Grand mother"
replace deci_cook_oth = "Paternal Grandmother" if deci_cook_oth == "EDadi"
replace deci_cook_oth = regexr(deci_cook_oth, "^Ladki.*$", "Daughter")
replace deci_cook_oth = "Elder Daughter" if deci_cook_oth == "BIG DAUGHTER"
replace deci_cook_oth = "Elder Daughter" if deci_cook_oth == "Badi beti"
replace deci_cook_oth = "Daughter" if deci_cook_oth == "Badi ladki"
replace deci_cook_oth = "Daughter" if deci_cook_oth == "Baiti"
replace deci_cook_oth = "Daughter" if deci_cook_oth == "Baite"
replace deci_cook_oth = "Elder Daughter" if deci_cook_oth == "Bari bati"
replace deci_cook_oth = "Daughter" if deci_cook_oth == "Bati"
replace deci_cook_oth = "Elder Daughter" if deci_cook_oth == "Bde wali ladki"
replace deci_cook_oth = "Daughter" if deci_cook_oth == "Beti"
replace deci_cook_oth = "Daughter" if deci_cook_oth == "Betiya"
replace deci_cook_oth = "Elder Daughter" if deci_cook_oth == "Big girl"
replace deci_cook_oth = "Elder Daughter" if deci_cook_oth == "Big girls"
replace deci_cook_oth = "Daughter" if deci_cook_oth == "Girl"
replace deci_cook_oth = "Daughter" if deci_cook_oth == "Girls"
replace deci_cook_oth = "Daughter" if deci_cook_oth == "LADKI"
replace deci_cook_oth = "Daughter" if deci_cook_oth == "Ladke"
replace deci_cook_oth = "Daughter" if deci_cook_oth == "Komal"
replace deci_cook_oth = "Daughter" if deci_cook_oth == "MY DAUGHTER"
replace deci_cook_oth = regexr(deci_cook_oth, "^.*ta$", "Son")
replace deci_cook_oth = "Son" if deci_cook_oth == "Mara ladka"
replace deci_cook_oth = "Son" if deci_cook_oth == "Raju"
replace deci_cook_oth = "Son" if deci_cook_oth == "S0n"
replace deci_cook_oth = "Son" if deci_cook_oth == "Bete ki"
replace deci_cook_oth = "Son" if deci_cook_oth == "Choice of boy"
replace deci_cook_oth = "Son" if deci_cook_oth == "Ladka"
replace deci_cook_oth = "Aunt-Badi Bua" if deci_cook_oth == "Badi bua"
replace deci_cook_oth = "Sister in law" if deci_cook_oth == "Bhabi"
replace deci_cook_oth = "Niece" if deci_cook_oth == "Bhan"
replace deci_cook_oth = "Niece" if deci_cook_oth == "Bhanji"
replace deci_cook_oth = "Daughter in law" if deci_cook_oth == "Bride"
replace deci_cook_oth = "Paternal Grandfather" if deci_cook_oth == "Daada"
replace deci_cook_oth = "Paternal Grandfather" if deci_cook_oth == "Dada"
replace deci_cook_oth = "Paternal Grandfather" if deci_cook_oth == "Dada ji"
replace deci_cook_oth = "Paternal Grandfather" if deci_cook_oth == "Dada je"
replace deci_cook_oth = "Paternal Grandfather, Paternal Grandmother" if deci_cook_oth == "Dada, dadi"
replace deci_cook_oth = "Paternal Grandfather, Paternal Grandmother" if deci_cook_oth == "G mother& g father"
replace deci_cook_oth = "Paternal Grandfather" if deci_cook_oth == "GRANDFATHER"
replace deci_cook_oth = "Paternal Grandfather" if deci_cook_oth == "Daada"
replace deci_cook_oth = "Paternal Grandfather, Paternal Grandmother" if deci_cook_oth == "GRANDPERSON"
replace deci_cook_oth = "Grandson" if deci_cook_oth == "GRANDSON"
replace deci_cook_oth = "Elder woman of the house" if deci_cook_oth == "Ghar ki old women"
replace deci_cook_oth = "Paternal Grandfather" if deci_cook_oth == "Grand father"
replace deci_cook_oth = "Paternal Grandfather, Mother" if deci_cook_oth == "Grand fatherb, mother"
replace deci_cook_oth = "Paternal Grandfather" if deci_cook_oth == "Grandfather of student"
replace deci_cook_oth = "Uncle-Chacha" if deci_cook_oth == "Kaaka"
replace deci_cook_oth = "Mother" if deci_cook_oth == "MATA JI"
replace deci_cook_oth = "Mother" if deci_cook_oth == "MERI MATA"
replace deci_cook_oth = "Mother" if deci_cook_oth == "MOTHER"
replace deci_cook_oth = "Father in law" if deci_cook_oth == "MY FATHER IN LOW"
replace deci_cook_oth = "Mother" if deci_cook_oth == "Ma"
replace deci_cook_oth = "Mother" if deci_cook_oth == "Maa"
replace deci_cook_oth = "Aunt-Mami" if deci_cook_oth == "Mami"
replace deci_cook_oth = "Father" if deci_cook_oth == "Mare papa ji"
replace deci_cook_oth = "Aunt-Mami" if deci_cook_oth == "Mari mamy"
replace deci_cook_oth = "Mother" if deci_cook_oth == "Mata ji"
replace deci_cook_oth = "Mother" if deci_cook_oth == "Meri mata ji"
replace deci_cook_oth = "Mother" if deci_cook_oth == "Mummi"
replace deci_cook_oth = "Mother" if deci_cook_oth == "Mummy"
replace deci_cook_oth = "Mother, Father" if deci_cook_oth == "Mata or pita ji"
replace deci_cook_oth = "Mother, Father" if deci_cook_oth == "Maa baap"
replace deci_cook_oth = "Maternal Grandmother" if deci_cook_oth == "Nani"
replace deci_cook_oth = "Father" if deci_cook_oth == "Papa"
replace deci_cook_oth = "Father" if deci_cook_oth == "Papa ji"
replace deci_cook_oth = "Father" if deci_cook_oth == "Pitaji"
replace deci_cook_oth = regexr(deci_cook_oth, "^SASU.*$", "Mother in law")
replace deci_cook_oth = regexr(deci_cook_oth, "^Sasur.*$", "Father in law")
replace deci_cook_oth = regexr(deci_cook_oth, "^Sasu.*$", "Mother in law")
replace deci_cook_oth = regexr(deci_cook_oth, "^Sas.*$", "Mother in law")
replace deci_cook_oth = "Mother in law" if deci_cook_oth == "Saas"
replace deci_cook_oth = "Mother in law, Father in law" if deci_cook_oth == "Saas, susar"
replace deci_cook_oth = "Aunt-Tai" if deci_cook_oth == "Tai"
replace deci_cook_oth = "Father" if deci_cook_oth == "Pitaji"
replace deci_cook_oth = "Daughter, Grandmother" if deci_cook_oth == "Tamanna, grand mother"
replace deci_cook_oth = "Mother" if deci_cook_oth == "mother"

**deci_tv others option**
replace deci_tv_oth = "All family members" if deci_tv_oth == "ALL MEMBERS"
replace deci_tv_oth = "All family members" if deci_tv_oth == "All mamber"
replace deci_tv_oth = "All family members" if deci_tv_oth == "Each membar of family"
replace deci_tv_oth = "All family members" if deci_tv_oth == "Family se puchkar"
replace deci_tv_oth = "All family members" if deci_tv_oth == "Sabhi"
replace deci_tv_oth = "All family members" if deci_tv_oth == "Pur0a pariwar"
replace deci_tv_oth = "All family members" if deci_tv_oth == "Sabhi ki"
replace deci_tv_oth = regexr(deci_tv_oth, "^Bac.*$", "Children")
replace deci_tv_oth = "Children" if deci_tv_oth == "BACHCHE"
replace deci_tv_oth = "Children" if deci_tv_oth == "Child"
replace deci_tv_oth = regexr(deci_tv_oth, "^CHILD.*$", "Children")
replace deci_tv_oth = "Brother" if deci_tv_oth == "Bhai"
replace deci_tv_oth = "Brother" if deci_tv_oth == "BROTHER"
replace deci_tv_oth = "Elder Daughter" if deci_tv_oth == "Badi larki"
replace deci_tv_oth = "Elder Daughter" if deci_tv_oth == "Bde wali ladki"
replace deci_tv_oth = regexr(deci_tv_oth, "^Beti.*$", "Daughter")
replace deci_tv_oth = regexr(deci_tv_oth, "^Ladki.*$", "Daughter")
replace deci_tv_oth = "Daughter" if deci_tv_oth == "Ladke"
replace deci_tv_oth = "Elder Son" if deci_tv_oth == "Bada ladka"
replace deci_tv_oth = "Son" if deci_tv_oth == "Beta"
replace deci_tv_oth = "Son" if deci_tv_oth == "MY SON"
replace deci_tv_oth = "Son" if deci_tv_oth == "Beta"
replace deci_tv_oth = "Son" if deci_tv_oth == "Mara bata"
replace deci_tv_oth = "Aunt-Badi Bua" if deci_tv_oth == "Badi bua"
replace deci_tv_oth = "Aunt-Mami" if deci_tv_oth == "Mari mamy"
replace deci_tv_oth = "Uncle-Chacha" if deci_tv_oth == "Chacha ji"
replace deci_tv_oth = "Uncle-Chacha" if deci_tv_oth == "Kaaka"
replace deci_tv_oth = "Uncle-Mama" if deci_tv_oth == "Rakhi ke mama"
replace deci_tv_oth = "Brother in law-Jeth" if deci_tv_oth == "Jeth"
replace deci_tv_oth = "Brother in law-Dewar" if deci_tv_oth == "DEWAR"
replace deci_tv_oth = "Brother in law" if deci_tv_oth == "HUSBAND's BROTHER"
replace deci_tv_oth = "Paternal Grandfather, Paternal Grandmother" if deci_tv_oth == "Dada , dadi"
replace deci_tv_oth = "Paternal Grandfather, Paternal Grandmother" if deci_tv_oth == "Dadi dada"
replace deci_tv_oth = regexr(deci_tv_oth, "^Dada.*$", "Paternal Grandfather")
replace deci_tv_oth = regexr(deci_tv_oth, "^Dadi.*$", "Paternal Grandmother")
replace deci_tv_oth = "Paternal Grandfather" if deci_tv_oth == "Daada"
replace deci_tv_oth = "Paternal Grandmother" if deci_tv_oth == "Daadi"
replace deci_tv_oth = "Paternal Grandmother" if deci_tv_oth == "GRANDMOTHER"
replace deci_tv_oth = "Paternal Grandmother" if deci_tv_oth == "GRAND MOTHER"
replace deci_tv_oth = "Paternal Grandfather, Paternal Grandmother" if deci_tv_oth == "G.mother& g father"
replace deci_tv_oth = "Paternal Grandfather, Paternal Grandmother" if deci_tv_oth == "GRANDPERSON"
replace deci_tv_oth = "Paternal Grandfather, Paternal Grandmother" if deci_tv_oth == "Grand mother, father"
replace deci_tv_oth = "Grandfather" if deci_tv_oth == "GRANDFATHER"
replace deci_tv_oth = "Grandfather" if deci_tv_oth == "Grand father"
replace deci_tv_oth = "Grandfather" if deci_tv_oth == "Grandfather of student"
replace deci_tv_oth = "Grandmother" if deci_tv_oth == "Grand mother"
replace deci_tv_oth = "Grandmother" if deci_tv_oth == "Grand mothet"
replace deci_tv_oth = "Elders of the house" if deci_tv_oth == "Ghar k bugurg"
replace deci_tv_oth = "Elders of the house" if deci_tv_oth == "Ghar k bujrg"
replace deci_tv_oth = "Elders of the house" if deci_tv_oth == "Ghar ke bade"
replace deci_tv_oth = "Elders of the house" if deci_tv_oth == "Old age person Choice"
replace deci_tv_oth = "Elder woman of the house" if deci_tv_oth == "Ghar ki badi"
replace deci_tv_oth = "Elder women of the house" if deci_tv_oth == "Old women"
replace deci_tv_oth = regexr(deci_tv_oth, "^Na.*$", "Maternal Grandfather")
replace deci_tv_oth = regexr(deci_tv_oth, "^Papa.*$", "Father")
replace deci_tv_oth = "Father" if deci_tv_oth == "FATHER"
replace deci_tv_oth = "Father" if deci_tv_oth == "Fater ki"
replace deci_tv_oth = "Father" if deci_tv_oth == "Mare father"
replace deci_tv_oth = "Father" if deci_tv_oth == "PITA JI"
replace deci_tv_oth = "Father" if deci_tv_oth == "Pita ji"
replace deci_tv_oth = "Father, Mother" if deci_tv_oth == "Father, mother"
replace deci_tv_oth = "Father, Mother" if deci_tv_oth == "Ma baap"
replace deci_tv_oth = "Father, Mother" if deci_tv_oth == "Mother, father"
replace deci_tv_oth = "Father, Mother" if deci_tv_oth == "Mam-papa"
replace deci_tv_oth = "Father, Mother" if deci_tv_oth == "Mummy papa"
replace deci_tv_oth = "Father, Mother" if deci_tv_oth == "My maa baap"
replace deci_tv_oth = "God's support" if deci_tv_oth == "God sport"
replace deci_tv_oth = regexr(deci_tv_oth, "^Mu.*$", "Mother")
replace deci_tv_oth = regexr(deci_tv_oth, "^Meri.*$", "Mother")
replace deci_tv_oth = "Mother" if deci_tv_oth == "MOTHER"
replace deci_tv_oth = "Mother" if deci_tv_oth == "MERI MATA"
replace deci_tv_oth = "Mother" if deci_tv_oth == "Ma"
replace deci_tv_oth = "Mother" if deci_tv_oth == "Maa"
replace deci_tv_oth = "Mother" if deci_tv_oth == "Mata ji"
replace deci_tv_oth = "Mother in law, Father in law" if deci_tv_oth == "in laws"
replace deci_tv_oth = "Mother in law, Father in law" if deci_tv_oth == "Sas sasur"
replace deci_tv_oth = "Mother in law, Father in law" if deci_tv_oth == "Sas, , Sasur"
replace deci_tv_oth = "Father in law" if deci_tv_oth == "MY FATHER IN LOW"
replace deci_tv_oth = regexr(deci_tv_oth, "^Sasur.*$", "Father in law")
replace deci_tv_oth = regexr(deci_tv_oth, "^Sa.*$", "Mother in law")

**deci_buy_new others option**
replace deci_buy_new_oth = "Brother" if deci_buy_new_oth == "BROTHER"
replace deci_buy_new_oth = "Brother" if deci_buy_new_oth == "Bhai"
replace deci_buy_new_oth = "Children" if deci_buy_new_oth == "Bachche"
replace deci_buy_new_oth = "Children" if deci_buy_new_oth == "Bache"
replace deci_buy_new_oth = "Elder Daughter" if deci_buy_new_oth == "Badi Beti"
replace deci_buy_new_oth = "Aunt-Badi bua" if deci_buy_new_oth == "Badi bua"
replace deci_buy_new_oth = "Aunt-Mami" if deci_buy_new_oth == "Mari mamy"
replace deci_buy_new_oth = "Daughter" if deci_buy_new_oth == "Beti"
replace deci_buy_new_oth = "Daughter" if deci_buy_new_oth == "Ladki"
replace deci_buy_new_oth = "Son" if deci_buy_new_oth == "Beta"
replace deci_buy_new_oth = "Uncle-Chacha" if deci_buy_new_oth == "Chacha ji"
replace deci_buy_new_oth = "Uncle-Mama" if deci_buy_new_oth == "Mama ji"
replace deci_buy_new_oth = "Uncle-Tau" if deci_buy_new_oth == "Tau"
replace deci_buy_new_oth = "Uncle-Mama" if deci_buy_new_oth == "Rakhi ke mama"
replace deci_buy_new_oth = "Paternal Grandfather" if deci_buy_new_oth == "Bache k Dada"
replace deci_buy_new_oth = "Paternal Grandfather" if deci_buy_new_oth == "Daada"
replace deci_buy_new_oth = "Paternal Grandfather" if deci_buy_new_oth == "Dada"
replace deci_buy_new_oth = "Paternal Grandfather" if deci_buy_new_oth == "Dada g"
replace deci_buy_new_oth = "Paternal Grandfather" if deci_buy_new_oth == "Dada ji"
replace deci_buy_new_oth = "Paternal Grandfather" if deci_buy_new_oth == "Dadaji"
replace deci_buy_new_oth = "Grandfather" if deci_buy_new_oth == "GRANDFATHER"
replace deci_buy_new_oth = "Grandfather" if deci_buy_new_oth == "Grand father"
replace deci_buy_new_oth = "Grandfather" if deci_buy_new_oth == "Grandfather of the students"
replace deci_buy_new_oth = "Grandmother" if deci_buy_new_oth == "GRANDMOTHER"
replace deci_buy_new_oth = "Paternal Grandmother" if deci_buy_new_oth == "Daadi"
replace deci_buy_new_oth = "Grandmother" if deci_buy_new_oth == "Grand mother"
replace deci_buy_new_oth = regexr(deci_buy_new_oth, "^Dadi.*$", "Paternal Grandmother")
replace deci_buy_new_oth = "Paternal Grandfather, Paternal Grandmother" if deci_buy_new_oth == "GRANDPERSON"
replace deci_buy_new_oth = "Paternal Grandfather, Paternal Grandmother" if deci_buy_new_oth == "Dada , dadi"
replace deci_buy_new_oth = "Paternal Grandfather, Paternal Grandmother" if deci_buy_new_oth == "Dada dadi"
replace deci_buy_new_oth = "Paternal Grandfather, Father" if deci_buy_new_oth == "Dada ji papa"
replace deci_buy_new_oth = "Elders of the house" if deci_buy_new_oth == "Ghar ke bade"
replace deci_buy_new_oth = "Elders of the house" if deci_buy_new_oth == "Ghar k bade"
replace deci_buy_new_oth = "Elders of the house" if deci_buy_new_oth == "Gharbke bade"
replace deci_buy_new_oth = "Elders of the house" if deci_buy_new_oth == "Old age person Choice"
replace deci_buy_new_oth = "Elders of the house" if deci_buy_new_oth == "Bde bujrg se"
replace deci_buy_new_oth = "Elders of the house" if deci_buy_new_oth == "Bdo se"
replace deci_buy_new_oth = "Elder woman of the house" if deci_buy_new_oth == "Ghar ki badi"
replace deci_buy_new_oth = "Elder woman of the house" if deci_buy_new_oth == "Old women"
replace deci_buy_new_oth = "All family members" if deci_buy_new_oth == "Each membar of family"
replace deci_buy_new_oth = "All family members" if deci_buy_new_oth == "Pura pariwar"
replace deci_buy_new_oth = "All family members" if deci_buy_new_oth == "Sabhi ki"
replace deci_buy_new_oth = regexr(deci_buy_new_oth, "^Family.*$", "All family members")
replace deci_buy_new_oth = "Brother in law-Dewar" if deci_buy_new_oth == "DEWAR"
replace deci_buy_new_oth = "Brother in law-Jeth" if deci_buy_new_oth == "Jeth"
replace deci_buy_new_oth = "Brother in law-Husband's Brother" if deci_buy_new_oth == "HUSBAND BROTHER"
replace deci_buy_new_oth = "Father" if deci_buy_new_oth == "FATHER"
replace deci_buy_new_oth = "Father" if deci_buy_new_oth == "Pita ji"
replace deci_buy_new_oth = regexr(deci_buy_new_oth, "^Papa.*$", "Father")
replace deci_buy_new_oth = regexr(deci_buy_new_oth, "^Sasur.*$", "Father in law")
replace deci_buy_new_oth = regexr(deci_buy_new_oth, "^Sasu.*$", "Mother in law")
replace deci_buy_new_oth = "Father in law" if deci_buy_new_oth == "Susur"
replace deci_buy_new_oth = "Father in law" if deci_buy_new_oth == "Mere sasur ji"
replace deci_buy_new_oth = "Father in law" if deci_buy_new_oth == "MY FATHER IN LOW"
replace deci_buy_new_oth = "Mother in law" if deci_buy_new_oth == "Sas"
replace deci_buy_new_oth = "Mother in law" if deci_buy_new_oth == "Saas"
replace deci_buy_new_oth = "Mother in law" if deci_buy_new_oth == "SASU JI"
replace deci_buy_new_oth = "Mother in law, Father in law" if deci_buy_new_oth == "in laws"
replace deci_buy_new_oth = "Mother in law, Father in law" if deci_buy_new_oth == "Sas sasur"
replace deci_buy_new_oth = "Father, Mother" if deci_buy_new_oth == "Father, mother"
replace deci_buy_new_oth = "Father, Mother" if deci_buy_new_oth == "Mother, father"
replace deci_buy_new_oth = "Father, Mother" if deci_buy_new_oth == "Mummy papa"
replace deci_buy_new_oth = "Father, Mother" if deci_buy_new_oth == "Mata or pita ji"
replace deci_buy_new_oth = "Father, Mother" if deci_buy_new_oth == "Mother father"
replace deci_buy_new_oth = regexr(deci_buy_new_oth, "^Ma.*$", "Mother")
replace deci_buy_new_oth = regexr(deci_buy_new_oth, "^Meri.*$", "Mother")
replace deci_buy_new_oth = "Mother" if deci_buy_new_oth == "MATA"
replace deci_buy_new_oth = "Mother" if deci_buy_new_oth == "MOTHER"
replace deci_buy_new_oth = "Mother" if deci_buy_new_oth == "Mothet"
replace deci_buy_new_oth = "Mother" if deci_buy_new_oth == "Mummi"
replace deci_buy_new_oth = "Paternal Grandfather" if deci_buy_new_oth == "Naana ji"
replace deci_buy_new_oth = "Do not own any agricultural land" if deci_buy_new_oth == "N0 agriculture land"
replace deci_buy_new_oth = "Do not own any agricultural land" if deci_buy_new_oth == "No agriculture land"
replace deci_buy_new_oth = regexr(deci_buy_new_oth, "^Na.*$", "Do not own any agricultural land or livestock")
replace deci_buy_new_oth = "Do not own any agricultural land or livestock" if deci_buy_new_oth == "Not at home"
replace deci_buy_new_oth = "Do not own any agricultural land or livestock" if deci_buy_new_oth == "Neih khirdat"
replace deci_buy_new_oth = "Do not own any agricultural land" if deci_buy_new_oth == "No any agriculture land"
replace deci_buy_new_oth = "Do not own any agricultural land or livestock" if deci_buy_new_oth == "No any agriculture land& animals"
replace deci_buy_new_oth = "Do not own any agricultural land or livestock" if deci_buy_new_oth == "No animals& agriculture land"
replace deci_buy_new_oth = "Do not own any livestock" if deci_buy_new_oth == "No any animals"
replace deci_buy_new_oth = "Do not own any agricultural land or livestock" if deci_buy_new_oth == "Hai nhai"
replace deci_buy_new_oth = "Do not have enough space" if deci_buy_new_oth == "Jagah nahi hai"

**deci_child_sch others option**
replace deci_child_sch_oth = "According to family's condition" if deci_child_sch_oth == "Apne ghar ka hisab dekh kr."
replace deci_child_sch_oth = "Uncle-Tau" if deci_child_sch_oth == "Bache ka taya"
replace deci_child_sch_oth = regexr(deci_child_sch_oth, "^Bac.*$", "Children")
replace deci_child_sch_oth = "Children" if deci_child_sch_oth == "Baache khud"
replace deci_child_sch_oth = "Uncle-Tau" if deci_child_sch_oth == "Bde tau ji"
replace deci_child_sch_oth = "Aunt-Badi bua" if deci_child_sch_oth == "Badi bua"
replace deci_child_sch_oth = "Brother" if deci_child_sch_oth == "Bhai"
replace deci_child_sch_oth = "Son" if deci_child_sch_oth == "Boys choice"
replace deci_child_sch_oth = "Children" if deci_child_sch_oth == "CHILD"
replace deci_child_sch_oth = "Children" if deci_child_sch_oth == "CHILDREN"
replace deci_child_sch_oth = "Children" if deci_child_sch_oth == "Child"
replace deci_child_sch_oth = "Parental Grandfather" if deci_child_sch_oth == "Daada"
replace deci_child_sch_oth = "Parental Grandfather" if deci_child_sch_oth == "Dada"
replace deci_child_sch_oth = "Parental Grandfather" if deci_child_sch_oth == "Dada ji"
replace deci_child_sch_oth = "Grandfather" if deci_child_sch_oth == "GRANDFATHER"
replace deci_child_sch_oth = "Parental Grandmother" if deci_child_sch_oth == "Daadi"
replace deci_child_sch_oth = "Elder Parental Grandmother" if deci_child_sch_oth == "Ghar ki badi dadi"
replace deci_child_sch_oth = "Grandmother" if deci_child_sch_oth == "GRANDMOTHER"
replace deci_child_sch_oth = "Grandmother" if deci_child_sch_oth == "Grand mother"
replace deci_child_sch_oth = "Grandmother" if deci_child_sch_oth == "Grand mothrr"
replace deci_child_sch_oth = "Maternal Grandmother" if deci_child_sch_oth == "Nani"
replace deci_child_sch_oth = "Maternal Grandfather" if deci_child_sch_oth == "Nana ji"
replace deci_child_sch_oth = regexr(deci_child_sch_oth, "^Dadi.*$", "Paternal Grandmother")
replace deci_child_sch_oth = "Grandfather, Grandmother" if deci_child_sch_oth == "GRANDPERSON"
replace deci_child_sch_oth = "Grandfather, Grandmother" if deci_child_sch_oth == "Grand mother father"
replace deci_child_sch_oth = "Paternal Grandfather, Paternal Grandmother" if deci_child_sch_oth == "Dada dadi"
replace deci_child_sch_oth = "All family members" if deci_child_sch_oth == "Each membar of family"
replace deci_child_sch_oth = "All family members" if deci_child_sch_oth == "Family"
replace deci_child_sch_oth = "All family members" if deci_child_sch_oth == "Family decision"
replace deci_child_sch_oth = "All family members" if deci_child_sch_oth == "Ghar ke sab milke"
replace deci_child_sch_oth = "All family members" if deci_child_sch_oth == "Sabhi milkr"
replace deci_child_sch_oth = "All family members" if deci_child_sch_oth == "Sabhi ki"
replace deci_child_sch_oth = "Father" if deci_child_sch_oth == "Dad"
replace deci_child_sch_oth = "Father" if deci_child_sch_oth == "PITA JI"
replace deci_child_sch_oth = "Father" if deci_child_sch_oth == "Sheetal Ka papa"
replace deci_child_sch_oth = "Father" if deci_child_sch_oth == "Papa"
replace deci_child_sch_oth = "Father" if deci_child_sch_oth == "Papa ji"
replace deci_child_sch_oth = "Elders of the house" if deci_child_sch_oth == "Ghar ke bade"
replace deci_child_sch_oth = "Teacher's advice" if deci_child_sch_oth == "Govt . school teacher Advice"
replace deci_child_sch_oth = "Teacher's advice" if deci_child_sch_oth == "Teacher advice"
replace deci_child_sch_oth = "Brother in law-Jeth" if deci_child_sch_oth == "Jeth"
replace deci_child_sch_oth = "Uncle-Mama" if deci_child_sch_oth == "Mama ji"
replace deci_child_sch_oth = "Aunt-Mami" if deci_child_sch_oth == "Mari mamy"
replace deci_child_sch_oth = "Uncle-Mama" if deci_child_sch_oth == "Rakhi ke mama"
replace deci_child_sch_oth = regexr(deci_child_sch_oth, "^Need.*$", "According to family's condition")
replace deci_child_sch_oth = regexr(deci_child_sch_oth, "^Meri.*$", "Mother")
replace deci_child_sch_oth = regexr(deci_child_sch_oth, "^Ma.*$", "Mother")
replace deci_child_sch_oth = "Daughter" if deci_child_sch_oth == "Ladki"
replace deci_child_sch_oth = "Son" if deci_child_sch_oth == "Inka beta"
replace deci_child_sch_oth = "Father, Mother" if deci_child_sch_oth == "Mummy papa"
replace deci_child_sch_oth = "Father in law" if deci_child_sch_oth == "MY FATHER IN LOW"
replace deci_child_sch_oth = "Father in law" if deci_child_sch_oth == "father in law"
replace deci_child_sch_oth = "Father in law" if deci_child_sch_oth == "Saur ji"
replace deci_child_sch_oth = "Father in law, Mother in law" if deci_child_sch_oth == "in laws"
replace deci_child_sch_oth = regexr(deci_child_sch_oth, "^Sa.*$", "Mother in law")

**deci_spend_edu others option**
replace deci_spend_edu_oth = "Paternal Grandfather" if deci_spend_edu_oth == "Bache k Dada"
replace deci_spend_edu_oth = "Uncle-Tau" if deci_spend_edu_oth == "Bache kay taya"
replace deci_spend_edu_oth = "Aunt-Badi bua" if deci_spend_edu_oth == "Badi bua"
replace deci_spend_edu_oth = "Uncle-Tau" if deci_spend_edu_oth == "Bde tau ji"
replace deci_spend_edu_oth = "Paternal Grandfather" if deci_spend_edu_oth == "Daada"
replace deci_spend_edu_oth = "Paternal Grandfather" if deci_spend_edu_oth == "Dada"
replace deci_spend_edu_oth = "Paternal Grandfather" if deci_spend_edu_oth == "Dada ji"
replace deci_spend_edu_oth = "Paternal Grandfather, Paternal Grandmother" if deci_spend_edu_oth == "Dada dadi"
replace deci_spend_edu_oth = "Paternal Grandfather, Paternal Grandmother" if deci_spend_edu_oth == "Dada , dadi"
replace deci_spend_edu_oth = "Paternal Grandmother" if deci_spend_edu_oth == "Daadi"
replace deci_spend_edu_oth = regexr(deci_spend_edu_oth, "^Dadi.*$", "Paternal Grandmother")
replace deci_spend_edu_oth = regexr(deci_spend_edu_oth, "^Sab.*$", "All family members")
replace deci_spend_edu_oth = "All family members" if deci_spend_edu_oth == "Each membar of family"
replace deci_spend_edu_oth = regexr(deci_spend_edu_oth, "^Papa.*$", "Father")
replace deci_spend_edu_oth = regexr(deci_spend_edu_oth, "^Sasur.*$", "Father in law")
replace deci_spend_edu_oth = "Grandfather" if deci_spend_edu_oth == "GRANDFATHER"
replace deci_spend_edu_oth = "Grandfather" if deci_spend_edu_oth == "Grand father"
replace deci_spend_edu_oth = "Grandfather, Grandmother" if deci_spend_edu_oth == "GRANDPERSON"
replace deci_spend_edu_oth = "Grandmother" if deci_spend_edu_oth == "Grand mother"
replace deci_spend_edu_oth = "Grandmother" if deci_spend_edu_oth == "Grandmothrr"
replace deci_spend_edu_oth = "Elders of the house" if deci_spend_edu_oth == "Ghar ke bade"
replace deci_spend_edu_oth = "Son" if deci_spend_edu_oth == "Inka beta"
replace deci_spend_edu_oth = "Brother in law-Jeth" if deci_spend_edu_oth == "Jeth"
replace deci_spend_edu_oth = "Grandmother" if deci_spend_edu_oth == "Grandmothrr"
replace deci_spend_edu_oth = "Daughter" if deci_spend_edu_oth == "Ladki"
replace deci_spend_edu_oth = "Father in law" if deci_spend_edu_oth == "MY FATHER IN LOW"
replace deci_spend_edu_oth = "Uncle-Mama" if deci_spend_edu_oth == "Mama ji"
replace deci_spend_edu_oth = "Aunt-Mami" if deci_spend_edu_oth == "Mari mamy"
replace deci_spend_edu_oth = "Father, Mother" if deci_spend_edu_oth == "Mummy papa"
replace deci_spend_edu_oth = "Maternal Grandmother" if deci_spend_edu_oth == "Nani"
replace deci_spend_edu_oth = "Uncle-Mama" if deci_spend_edu_oth == "Rakhi ke mama"
replace deci_spend_edu_oth = "Father" if deci_spend_edu_oth == "Sheetal Ka papa"
replace deci_spend_edu_oth = "Father" if deci_spend_edu_oth == "PITA JI"
replace deci_spend_edu_oth = "Father" if deci_spend_edu_oth == "Pita ji"
replace deci_spend_edu_oth = regexr(deci_spend_edu_oth, "^Ma.*$", "Mother")
replace deci_spend_edu_oth = regexr(deci_spend_edu_oth, "^Sa.*$", "Mother in law")
replace deci_spend_edu_oth = "Father in law, Mother in law" if deci_spend_edu_oth == "in laws"
replace deci_spend_edu_oth = "Father in law" if deci_spend_edu_oth == "Mere sasur ji"
replace deci_spend_edu_oth = regexr(deci_spend_edu_oth, "^Meri.*$", "Mother")
replace deci_spend_edu_oth = regexr(deci_spend_edu_oth, "^Jitna.*$", "According to children")

**deci_taken_dr others option**
replace deci_taken_dr_oth = "Children themselves" if deci_taken_dr_oth == "Apne aap"
replace deci_taken_dr_oth = regexr(deci_taken_dr_oth, "^Ba.*$", "Children themselves")
replace deci_taken_dr_oth = "Mother in law" if deci_taken_dr_oth == "Asu maa"
replace deci_taken_dr_oth = "Brother" if deci_taken_dr_oth == "Bhai"
replace deci_taken_dr_oth = regexr(deci_taken_dr_oth, "^So.*$", "Son")
replace deci_taken_dr_oth = "Paternal Grandfather, Paternal Grandmother" if deci_taken_dr_oth == "Dada , dadi"
replace deci_taken_dr_oth = regexr(deci_taken_dr_oth, "^Dada.*$", "Paternal Grandfather")
replace deci_taken_dr_oth = regexr(deci_taken_dr_oth, "^Dadi.*$", "Paternal Grandmother")
replace deci_taken_dr_oth = "Doctor himself" if deci_taken_dr_oth == "Dr.himself"
replace deci_taken_dr_oth = "Grandmother" if deci_taken_dr_oth == "GRAND MOTHER"
replace deci_taken_dr_oth = "Grandmother" if deci_taken_dr_oth == "GRANDMOTHER"
replace deci_taken_dr_oth = "Grandmother" if deci_taken_dr_oth == "Garnd mother"
replace deci_taken_dr_oth = "Grandmother" if deci_taken_dr_oth == "Grand mother"
replace deci_taken_dr_oth = "Grandfather" if deci_taken_dr_oth == "GRANDFATHER"
replace deci_taken_dr_oth = "Grandfather, Grandmother" if deci_taken_dr_oth == "GRANDPERSON"
replace deci_taken_dr_oth = "Grandfather" if deci_taken_dr_oth == "Grand father"
replace deci_taken_dr_oth = "Son" if deci_taken_dr_oth == "Ladka"
replace deci_taken_dr_oth = "Daughter" if deci_taken_dr_oth == "Ladki"
replace deci_taken_dr_oth = "Elders of the house" if deci_taken_dr_oth == "Ghar ke bade"
replace deci_taken_dr_oth = "All family members" if deci_taken_dr_oth == "Ghar me sab milke"
replace deci_taken_dr_oth = "All family members" if deci_taken_dr_oth == "Sabhi ki"
replace deci_taken_dr_oth = "Elder woman of the house" if deci_taken_dr_oth == "Old women"
replace deci_taken_dr_oth = "Father in law" if deci_taken_dr_oth == "MY FATHER IN LOW"
replace deci_taken_dr_oth = regexr(deci_taken_dr_oth, "^Sasu.*$", "Father in law")
replace deci_taken_dr_oth = regexr(deci_taken_dr_oth, "^Sa.*$", "Mother in law")
replace deci_taken_dr_oth = "Father in law, Mother in law" if deci_taken_dr_oth == "in laws"
replace deci_taken_dr_oth = "Uncle-Tau" if deci_taken_dr_oth == "Tau"
replace deci_taken_dr_oth = "Uncle-Mama" if deci_taken_dr_oth == "Mama ji"
replace deci_taken_dr_oth = "Aunt-Mami" if deci_taken_dr_oth == "Mari mamy"
replace deci_taken_dr_oth = "Uncle-Mama, Aunt-Mausi" if deci_taken_dr_oth == "Mama, mosi"
replace deci_taken_dr_oth = "Father" if deci_taken_dr_oth == "PITA JI"
replace deci_taken_dr_oth = "Father" if deci_taken_dr_oth == "Pita ji"
replace deci_taken_dr_oth = "Maternal Grandmother" if deci_taken_dr_oth == "Nani"
replace deci_taken_dr_oth = "Mother" if deci_taken_dr_oth == "Mummi"
replace deci_taken_dr_oth = "Father, Mother" if deci_taken_dr_oth == "Mummy papa"
replace deci_taken_dr_oth = "Father, Mother" if deci_taken_dr_oth == "Ma,i pap"
replace deci_taken_dr_oth = regexr(deci_taken_dr_oth, "^Ma.*$", "Mother")
replace deci_taken_dr_oth = regexr(deci_taken_dr_oth, "^Meri.*$", "Mother")
replace deci_taken_dr_oth = regexr(deci_taken_dr_oth, "^Papa.*$", "Father")

**deci_child_cloth others option**
replace deci_child_cloth_oth = "Grandfather" if deci_child_cloth_oth == "Bache k Dada"
replace deci_child_cloth_oth = "Uncle" if deci_child_cloth_oth == "Bacho kay maama"
replace deci_child_cloth_oth = "Children" if deci_child_cloth_oth == "Apne ap bache"
replace deci_child_cloth_oth = regexr(deci_child_cloth_oth, "^Bac.*$", "Children")
replace deci_child_cloth_oth = regexr(deci_child_cloth_oth, "^CHILD.*$", "Children")
replace deci_child_cloth_oth = "Children" if deci_child_cloth_oth == "Child k uper"
replace deci_child_cloth_oth = "Aunt-Bua" if deci_child_cloth_oth == "Bua ji"
replace deci_child_cloth_oth = "Aunt-Bua" if deci_child_cloth_oth == "Badi bua"
replace deci_child_cloth_oth = regexr(deci_child_cloth_oth, "^B.*$", "Brother")
replace deci_child_cloth_oth = "Aunt-Mami" if deci_child_cloth_oth == "Mari mamy"
replace deci_child_cloth_oth = "Aunt-Mami" if deci_child_cloth_oth == "Mami"
replace deci_child_cloth_oth = "Aunt-Tai" if deci_child_cloth_oth == "Tai"
replace deci_child_cloth_oth = "Uncle-Chacha" if deci_child_cloth_oth == "Chacha"
replace deci_child_cloth_oth = "Uncle-Tau" if deci_child_cloth_oth == "Tau"
replace deci_child_cloth_oth = "Uncle-Chacha, Paternal Grandmother" if deci_child_cloth_oth == "Mama, nani"
replace deci_child_cloth_oth = "Brother in law-Jeth" if deci_child_cloth_oth == "Jeth"
replace deci_child_cloth_oth = "Paternal Grandfather" if deci_child_cloth_oth == "Daada"
replace deci_child_cloth_oth = "Paternal Grandmother" if deci_child_cloth_oth == "Daadi"
replace deci_child_cloth_oth = "Paternal Grandfather, Paternal Grandmother" if deci_child_cloth_oth == "Dada dadi"
replace deci_child_cloth_oth = "Paternal Grandfather, Paternal Grandmother" if deci_child_cloth_oth == "Dadi, dada"
replace deci_child_cloth_oth = regexr(deci_child_cloth_oth, "^Dada.*$", "Paternal Grandfather")
replace deci_child_cloth_oth = regexr(deci_child_cloth_oth, "^Dadi.*$", "Paternal Grandmother")
replace deci_child_cloth_oth = "Paternal Grandmother" if deci_child_cloth_oth == "Dafi"
replace deci_child_cloth_oth = "Grandfather" if deci_child_cloth_oth == "GRANDFATHER"
replace deci_child_cloth_oth = "Grandmother" if deci_child_cloth_oth == "GRANDMOTHER"
replace deci_child_cloth_oth = "Grandfather, Grandmother" if deci_child_cloth_oth == "GRANDPERSON"
replace deci_child_cloth_oth = "Grandfather" if deci_child_cloth_oth == "Grand father"
replace deci_child_cloth_oth = "Grandmother" if deci_child_cloth_oth == "Grand mother"
replace deci_child_cloth_oth = "Grandfather, Grandmother" if deci_child_cloth_oth == "Grand father, mother"
replace deci_child_cloth_oth = "Any family member who goes to the market" if deci_child_cloth_oth == "Ghar me jo b jate h"
replace deci_child_cloth_oth = "Daughter" if deci_child_cloth_oth == "Ladki"
replace deci_child_cloth_oth = "Father in law" if deci_child_cloth_oth == "MY FATHER IN LOW"
replace deci_child_cloth_oth = "Son" if deci_child_cloth_oth == "MY SON"
replace deci_child_cloth_oth = regexr(deci_child_cloth_oth, "^Mama.*$", "Uncle-Mama")
replace deci_child_cloth_oth = regexr(deci_child_cloth_oth, "^Ma.*$", "Mother")
replace deci_child_cloth_oth = regexr(deci_child_cloth_oth, "^Meri.*$", "Mother")
replace deci_child_cloth_oth = "Mother in law" if deci_child_cloth_oth == "Motger in law"
replace deci_child_cloth_oth = "Maternal Grandmother" if deci_child_cloth_oth == "Nani"
replace deci_child_cloth_oth = "Maternal Grandfather" if deci_child_cloth_oth == "Nana"
replace deci_child_cloth_oth = "Father, Mother" if deci_child_cloth_oth == "Mummy papa"
replace deci_child_cloth_oth = "Father" if deci_child_cloth_oth == "PITA JI"
replace deci_child_cloth_oth = "Father" if deci_child_cloth_oth == "Pita ji"
replace deci_child_cloth_oth = "Father in law, Mother in law" if deci_child_cloth_oth == "in laws"
replace deci_child_cloth_oth = "Elder woman of the house" if deci_child_cloth_oth == "Old women"
replace deci_child_cloth_oth = regexr(deci_child_cloth_oth, "^Sab.*$", "All family members")
replace deci_child_cloth_oth = regexr(deci_child_cloth_oth, "^Sasur.*$", "Father in law")
replace deci_child_cloth_oth = regexr(deci_child_cloth_oth, "^Sasu.*$", "Mother in law")
replace deci_child_cloth_oth = regexr(deci_child_cloth_oth, "^Sa.*$", "Mother in law")

**deci_child_books others option**
replace deci_child_books_oth = "Children" if deci_child_books_oth == "Apne ap bache"
replace deci_child_books_oth = "Uncle" if deci_child_books_oth == "Aunkle"
replace deci_child_books_oth = "Paternal Grandfather" if deci_child_books_oth == "Bache k Dada"
replace deci_child_books_oth = "Uncle-Tau" if deci_child_books_oth == "Bacho kay taya"
replace deci_child_books_oth = regexr(deci_child_books_oth, "^Bac.*$", "Children")
replace deci_child_books_oth = "Aunt-Bua" if deci_child_books_oth == "Badi bua"
replace deci_child_books_oth = "Son" if deci_child_books_oth == "Beta"
replace deci_child_books_oth = "Brother" if deci_child_books_oth == "Bhai"
replace deci_child_books_oth = "Children" if deci_child_books_oth == "Bhche khud"
replace deci_child_books_oth = regexr(deci_child_books_oth, "^Big.*$", "Elder boy, Books provided by the school")
replace deci_child_books_oth = regexr(deci_child_books_oth, "^Child self.*$", "Books provided by the school, Children")
replace deci_child_books_oth = "Books provided by the school" if deci_child_books_oth == "Book provide in school"
replace deci_child_books_oth = "Cousin brother" if deci_child_books_oth == "Child cojjan brother"
replace deci_child_books_oth = "Grandfather" if deci_child_books_oth == "Child's grandfather"
replace deci_child_books_oth = regexr(deci_child_books_oth, "^Chil.*$", "Children")
replace deci_child_books_oth = "Books provided by the school" if deci_child_books_oth == "Given by school"
replace deci_child_books_oth = "Paternal Grandfather, Paternal Grandmother" if deci_child_books_oth == "Dada , dadi"
replace deci_child_books_oth = "Paternal Grandfather, Paternal Grandmother" if deci_child_books_oth == "Dada, dadi"
replace deci_child_books_oth = regexr(deci_child_books_oth, "^Dadi.*$", "Paternal Grandmother")
replace deci_child_books_oth = regexr(deci_child_books_oth, "^Dada.*$", "Paternal Grandfather")
replace deci_child_books_oth = "Books provided by the school" if deci_child_books_oth == "Few Book provide in school"
replace deci_child_books_oth = "Grandfather" if deci_child_books_oth == "GRANDFATHER"
replace deci_child_books_oth = "Grandfather, Grandmother" if deci_child_books_oth == "GRANDPERSON"
replace deci_child_books_oth = "Grandfather" if deci_child_books_oth == "Grand father"
replace deci_child_books_oth = "Grandfather" if deci_child_books_oth == "Grand farher"
replace deci_child_books_oth = "Grandmother" if deci_child_books_oth == "Grand mother"
replace deci_child_books_oth = "Brother in law" if deci_child_books_oth == "HUSBAND BROTHER"
replace deci_child_books_oth = "Brother in law-Jeth" if deci_child_books_oth == "Jeth"
replace deci_child_books_oth = "Any family member who gets time" if deci_child_books_oth == "Jise time ho wo le aate h"
replace deci_child_books_oth = "Son" if deci_child_books_oth == "Ladka"
replace deci_child_books_oth = "Daughter" if deci_child_books_oth == "Ladki"
replace deci_child_books_oth = "Son" if deci_child_books_oth == "Ldka"
replace deci_child_books_oth = "Father in law" if deci_child_books_oth == "MY FATHER IN LOW"
replace deci_child_books_oth = "Uncle-Mama, Aunt-Mausi" if deci_child_books_oth == "Mama, mosi"
replace deci_child_books_oth = "Aunt-Mami" if deci_child_books_oth == "Mari mamy"
replace deci_child_books_oth = "Father in law" if deci_child_books_oth == "Mere sasur ji"
replace deci_child_books_oth = regexr(deci_child_books_oth, "^Mama.*$", "Uncle-Mama")
replace deci_child_books_oth = regexr(deci_child_books_oth, "^Ma.*$", "Mother")
replace deci_child_books_oth = regexr(deci_child_books_oth, "^Meri.*$", "Mother")
replace deci_child_books_oth = regexr(deci_child_books_oth, "^Self.*$", "Children")
replace deci_child_books_oth = "Father, Mother" if deci_child_books_oth == "Mummy papa"
replace deci_child_books_oth = "Paternal Grandmother" if deci_child_books_oth == "Nani"
replace deci_child_books_oth = "Elder woman of the house" if deci_child_books_oth == "Old women"
replace deci_child_books_oth = "Father" if deci_child_books_oth == "PITA JI"
replace deci_child_books_oth = "Father" if deci_child_books_oth == "Pita ji"
replace deci_child_books_oth = "Father" if deci_child_books_oth == "Papa"
replace deci_child_books_oth = "Books provided by the school" if deci_child_books_oth == "Provied by school"
replace deci_child_books_oth = "Uncle-Mama" if deci_child_books_oth == "Rakhi ke mama"
replace deci_child_books_oth = "Father" if deci_child_books_oth == "Sheetal Ka papa"
replace deci_child_books_oth = "All family members" if deci_child_books_oth == "Sabhi ki"
replace deci_child_books_oth = "Father in law, Mother in law" if deci_child_books_oth == "Sas, Sasur"
replace deci_child_books_oth = regexr(deci_child_books_oth, "^Sasur.*$", "Father in law")
replace deci_child_books_oth = regexr(deci_child_books_oth, "^Sa.*$", "Mother in law")
replace deci_child_books_oth = "Father in law, Mother in law" if deci_child_books_oth == "in laws"
replace deci_child_books_oth = "Uncle-Tau" if deci_child_books_oth == "Taugi"
replace deci_child_books_oth = "Uncle-Chacha" if deci_child_books_oth == "Chacha"
replace deci_child_books_oth = "Aunt-Tai" if deci_child_books_oth == "Tai"

**deci_have_child others option**
replace deci_have_child_oth = "According to doctor's advice" if deci_have_child_oth == "Advice of doctor"
replace deci_have_child_oth = "Aunt-Bua" if deci_have_child_oth == "Badi bua"
replace deci_have_child_oth = "Elders' choice" if deci_have_child_oth == "Bado ki marji se"
replace deci_have_child_oth = "Upto God" if deci_have_child_oth == "Bagwqn k uppar"
replace deci_have_child_oth = regexr(deci_have_child_oth, "^Bha.*$", "Upto God")
replace deci_have_child_oth = "Girl's choice" if deci_have_child_oth == "Choice of one girl"
replace deci_have_child_oth = regexr(deci_have_child_oth, "^Choi.*$", "Boy's choice")
replace deci_have_child_oth = regexr(deci_have_child_oth, "^Ghar w.*$", "Family's choice")
replace deci_have_child_oth = regexr(deci_have_child_oth, "^Ghar.*$", "Elders' choice")
replace deci_have_child_oth = "Family's choice" if deci_have_child_oth == "Family k upar"
replace deci_have_child_oth = "Paternal Grandmother" if deci_have_child_oth == "Dadi"
replace deci_have_child_oth = regexr(deci_have_child_oth, "^Dada.*$", "Paternal Grandfather")
replace deci_have_child_oth = "Father in law" if deci_have_child_oth == "Father-in-law"
replace deci_have_child_oth = "Grandmother" if deci_have_child_oth == "G mother"
replace deci_have_child_oth = "Grandmother" if deci_have_child_oth == "Grand mother"
replace deci_have_child_oth = "Mother" if deci_have_child_oth == "MOTHER"
replace deci_have_child_oth = "Father, Mother" if deci_have_child_oth == "Maa baap"
replace deci_have_child_oth = "Uncle-Mama" if deci_have_child_oth == "Mama ji"
replace deci_have_child_oth = "Mother in law" if deci_have_child_oth == "Mother in  law"
replace deci_have_child_oth = "Mother in law" if deci_have_child_oth == "Mother's choice"
replace deci_have_child_oth = "Paternal Grandmother" if deci_have_child_oth == "Dadi"
replace deci_have_child_oth = regexr(deci_have_child_oth, "^Pari.*$", "Family's choice")
replace deci_have_child_oth = "Refused to answer" if deci_have_child_oth == "Neglect"
replace deci_have_child_oth = "We were unaware about it" if deci_have_child_oth == "Pata hi nahi tha"
replace deci_have_child_oth = "Mother in law, Myself" if deci_have_child_oth == "Sas, self"
replace deci_have_child_oth = "Husband is not there" if deci_have_child_oth == "Pati nhi h"
replace deci_have_child_oth = "Father in law, Mother in law" if deci_have_child_oth == "Sas sasur"
replace deci_have_child_oth = "Father in law" if deci_have_child_oth == "Sasur ji"
replace deci_have_child_oth = "Father in law, Mother in law" if deci_have_child_oth == "Sasur or sas"
replace deci_have_child_oth = regexr(deci_have_child_oth, "^Sa.*$", "Mother in law")
replace deci_have_child_oth = "I was very small when I got married" if deci_have_child_oth == "Shadi k tlme kam umar thi"
replace deci_have_child_oth = "Mother in law" if deci_have_child_oth == "Shashu mother interfaior"
replace deci_have_child_oth = "The question was not asked because the respondent was old" if deci_have_child_oth == "Umar jada hone ki wjh se nhi pucha"
replace deci_have_child_oth = "Wife is not there" if deci_have_child_oth == "Wife nhi h"
replace deci_have_child_oth = regexr(deci_have_child_oth, "^Ye.*$", "The respondent is step-father and he does not have any children with the students mother")
replace deci_have_child_oth = "Mother in law" if deci_have_child_oth == "Meri saas ne"
replace deci_have_child_oth = regexr(deci_have_child_oth, "^Ma.*$", "Mother")

**girl_help_cook_reason**
replace girl_help_cook_reason = regexr(girl_help_cook_reason, "^AB.*$", "The girl is too young to help")
replace girl_help_cook_reason = regexr(girl_help_cook_reason, "^CH.*$", "The girl is too young to help")
replace girl_help_cook_reason = regexr(girl_help_cook_reason, "^Ch.*$", "The girl is too young to help")
replace girl_help_cook_reason = regexr(girl_help_cook_reason, "^La.*$", "The girl is too young to help")
replace girl_help_cook_reason = "Girls are married" if girl_help_cook_reason == "All girls are already married"
replace girl_help_cook_reason = "Girls are married" if girl_help_cook_reason == "Girls married"
replace girl_help_cook_reason = "Girls are married" if girl_help_cook_reason == "Nahi hai shaadi ho chuki hai"
replace girl_help_cook_reason = "Girls are not there" if girl_help_cook_reason == "Nahi hai"
replace girl_help_cook_reason = "Girls are married" if girl_help_cook_reason == "Shadi ho gyi"
replace girl_help_cook_reason = "The girl is too young to help" if girl_help_cook_reason == "Small child"
replace girl_help_cook_reason = "We dont want them to help" if girl_help_cook_reason == "Karwata nahi"
replace girl_help_cook_reason = "Girls are married" if girl_help_cook_reason == "Nahi karvana chate"

**girl_help_clean_reason**
replace girl_help_clean_reason = "Girls are married" if girl_help_clean_reason == "All girls are already married"
replace girl_help_clean_reason = "The girl is too young to help" if girl_help_clean_reason == "CHILD IS VERY SMALL"
replace girl_help_clean_reason = "The girl is too young to help" if girl_help_clean_reason == "Small child"
replace girl_help_clean_reason = "The girl is too young to help" if girl_help_clean_reason == "Choti ha"
replace girl_help_clean_reason = "Girls are married" if girl_help_clean_reason == "Girls married"
replace girl_help_clean_reason = "Girls are not there" if girl_help_clean_reason == "Nahi hai"

**girl_help_clean_home_reason**
replace girl_help_clean_home_reason = "Girls are married" if girl_help_clean_home_reason == "All girls are already married"
replace girl_help_clean_home_reason = "The girl is too young to help" if girl_help_clean_home_reason == "CHILD IS VERY SMALL"
replace girl_help_clean_home_reason = "The girl is too young to help" if girl_help_clean_home_reason == "Small child"
replace girl_help_clean_home_reason = "Girls are not there" if girl_help_clean_home_reason == "Nahi hai"
replace girl_help_clean_home_reason = "Girls are not there" if girl_help_clean_home_reason == "No any girls"
     
**girl_help_laundry_reason**                    
replace girl_help_laundry_reason = "Girls are married" if girl_help_laundry_reason == "All girls are already married"
replace girl_help_laundry_reason = "The girl is too young to help" if girl_help_laundry_reason == "CHILD IS VERY SMALL"
replace girl_help_laundry_reason = "The girl is too young to help" if girl_help_laundry_reason == "Small child"
replace girl_help_laundry_reason = "The girl is too young to help" if girl_help_laundry_reason == "Choti ha"
replace girl_help_laundry_reason = "Girls are not there" if girl_help_laundry_reason == "Nahi hai"            
replace girl_help_laundry_reason = "Girls are not there" if girl_help_laundry_reason == "No any girls"            
                 
**girl_help_get_water_reason**
replace girl_help_get_water_reason = "Girls are married" if girl_help_get_water_reason == "All girls are already married"
replace girl_help_get_water_reason = regexr(girl_help_get_water_reason, "^Ghar.*$", "We have a water connection")
replace girl_help_get_water_reason = regexr(girl_help_get_water_reason, "^P.*$", "We have a water connection")
replace girl_help_get_water_reason = regexr(girl_help_get_water_reason, "^Lana.*$", "We have a water connection")
replace girl_help_get_water_reason = regexr(girl_help_get_water_reason, "^Water.*$", "We have a water connection")
replace girl_help_get_water_reason = "The girl is too young to help" if girl_help_get_water_reason == "CHILD IS VERY SMALL"
replace girl_help_get_water_reason = "The girl is too young to help" if girl_help_get_water_reason == "Small child"
replace girl_help_get_water_reason = "We have a water connection" if girl_help_get_water_reason == "Nhi ghar par"
replace girl_help_get_water_reason = "We have a water connection" if girl_help_get_water_reason == "ghar me hi h"            
replace girl_help_get_water_reason = "Boy brings water" if girl_help_get_water_reason == "Ladka lata h"            
replace girl_help_get_water_reason = regexr(girl_help_get_water_reason, "^Nahi.*$", "Girls are not there")
replace girl_help_get_water_reason = regexr(girl_help_get_water_reason, "^Nhi.*$", "Girls are not there")
replace girl_help_get_water_reason = "Girls are not there" if girl_help_get_water_reason == "No any girls"            
replace girl_help_get_water_reason = "Girls are married" if girl_help_get_water_reason == "Girls married"
replace girl_help_get_water_reason = "We have a water connection" if girl_help_get_water_reason == "WATER AVAILABLE AT HOME"            

**girl_help_care_child_reason**
replace girl_help_care_child_reason = "Girls are married" if girl_help_care_child_reason == "All girls are already married"
replace girl_help_care_child_reason = "The girl is too young to help" if girl_help_care_child_reason == "Itself small"
replace girl_help_care_child_reason = "The girl is too young to help" if girl_help_care_child_reason == "Small child"
replace girl_help_care_child_reason = "Girls are not there" if girl_help_care_child_reason == "No any girls"
replace girl_help_care_child_reason = regexr(girl_help_care_child_reason, "^B.*$", "No kids to look after")
replace girl_help_care_child_reason = regexr(girl_help_care_child_reason, "^C.*$", "No kids to look after")
replace girl_help_care_child_reason = regexr(girl_help_care_child_reason, "^Gh.*$", "No kids to look after")
replace girl_help_care_child_reason = regexr(girl_help_care_child_reason, "^H.*$", "No kids to look after")
replace girl_help_care_child_reason = regexr(girl_help_care_child_reason, "^M.*$", "No kids to look after")
replace girl_help_care_child_reason = regexr(girl_help_care_child_reason, "^K.*$", "No kids to look after")
replace girl_help_care_child_reason = regexr(girl_help_care_child_reason, "^N.*$", "No kids to look after")
replace girl_help_care_child_reason = regexr(girl_help_care_child_reason, "^na.*$", "No kids to look after")
replace girl_help_care_child_reason = "No kids to look after" if girl_help_care_child_reason == "Pani ghar mein aata hai"

**girl_help_care_old_reason**
replace girl_help_care_old_reason = "Girls are married" if girl_help_care_old_reason == "All girls are already married"
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^Al.*$", "They do not live with us")
replace girl_help_care_old_reason = "They do not live with us" if girl_help_care_old_reason == "Bujurg saath nhi rahata"
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^Bu.*$", "They are not there")
replace girl_help_care_old_reason = "They live with my uncle-Chacha" if girl_help_care_old_reason == "Chacha ke ghar rahte hai"
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^Sa.*$", "They do not live with us")
replace girl_help_care_old_reason = "They live with my uncle-Tau" if girl_help_care_old_reason == "Dada dadi taubke pass rahte hai"
replace girl_help_care_old_reason = "They live with my uncle-Tau" if girl_help_care_old_reason == "Taou ke pass rahti hai"
replace girl_help_care_old_reason = "They live with my uncle-Kaka" if girl_help_care_old_reason == "Kaka ke ghar rahti hai"
replace girl_help_care_old_reason = "They live with my uncle-Kaka" if girl_help_care_old_reason == "Kaka ke ghar rahte hai" 
replace girl_help_care_old_reason = "The girl is too young to help" if girl_help_care_old_reason == "Choti ha"
replace girl_help_care_old_reason = "The girl is too young to help" if girl_help_care_old_reason == "Small child"
replace girl_help_care_old_reason = "Girls are not there" if girl_help_care_old_reason == "No any girls"  
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^E.*$", "They have expired")
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^Da.*$", "They are not there")
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^Gh.*$", "They are not there")
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^Ha.*$", "They are not there")
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^NA.*$", "They are not there")
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^Na.*$", "They are not there")
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^NO.*$", "They are not there")
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^No.*$", "They are not there")
replace girl_help_care_old_reason = "They do not live with us" if girl_help_care_old_reason == "Nhi dusre ghar me rahte h"
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^Nh.*$", "They are not there")
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^Nj.*$", "They are not there")
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^OL.*$", "They are not there")
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^na.*$", "They are not there")
replace girl_help_care_old_reason = regexr(girl_help_care_old_reason, "^DA.*$", "They are not there")
replace girl_help_care_old_reason = "They do not live with us" if girl_help_care_old_reason == "Gaon me h"

 **girl_help_care_cattle**
 replace girl_help_care_cattle_reason = "Girls are married" if girl_help_care_cattle_reason == "All girls are already married"
 replace girl_help_care_cattle_reason = " They do not have cattle" if  girl_help_care_cattle_reason == "ANIMALS NAHI HAI"
 replace girl_help_care_cattle_reason = regexr( girl_help_care_cattle_reason, "^An.*$", "They do not have cattle")
 replace girl_help_care_cattle_reason = regexr( girl_help_care_cattle_reason, "^Bh.*$", "They do not have cattle")
 replace girl_help_care_cattle_reason = "The girl is too young to help" if girl_help_care_cattle_reason == "CHILD IS VERY SMALL"
 replace girl_help_care_cattle_reason = "The girl is too young to help" if girl_help_care_cattle_reason == "Choti hai"
 replace girl_help_care_cattle_reason = "They do not have cattle" if girl_help_care_cattle_reason == "Dangar nahi h"
 replace girl_help_care_cattle_reason = regexr(girl_help_care_cattle_reason, "^Gh.*$", "They do not have cattle")
 replace girl_help_care_cattle_reason = "They do not have cattle" if girl_help_care_cattle_reason == "H Nahi"
 replace girl_help_care_cattle_reason = "They do not have cattle" if girl_help_care_cattle_reason == "H nhi"
 replace girl_help_care_cattle_reason = regexr(girl_help_care_cattle_reason, "^Ha.*$", "They do not have cattle")
 replace girl_help_care_cattle_reason = "They do not have cattle" if girl_help_care_cattle_reason =="Hhar mein passu neih hai"
 replace girl_help_care_cattle_reason = regexr(girl_help_care_cattle_reason, "^JA.*$", "They do not have cattle")
 replace girl_help_care_cattle_reason = regexr(girl_help_care_cattle_reason, "^Ja.*$", "They do not have cattle")
 replace girl_help_care_cattle_reason = regexr(girl_help_care_cattle_reason, "^Ko.*$", "They do not have cattle")
 replace girl_help_care_cattle_reason = "They do not have cattle" if girl_help_care_cattle_reason == "NAHI HAI"
 replace girl_help_care_cattle_reason = regexr(girl_help_care_cattle_reason, "^NO.*$", "They do not have cattle")
 replace girl_help_care_cattle_reason = regexr(girl_help_care_cattle_reason, "^Na.*$", "They do not have cattle")
 replace girl_help_care_cattle_reason = regexr(girl_help_care_cattle_reason, "^Ne.*$", "They do not have cattle")
 replace girl_help_care_cattle_reason = regexr(girl_help_care_cattle_reason, "^Nh.*$", "They do not have cattle")
 replace girl_help_care_cattle_reason = "They do not have cattle" if girl_help_care_cattle_reason == "No"
 replace girl_help_care_cattle_reason = "They do not have cattle" if girl_help_care_cattle_reason == "No Animal"
 replace girl_help_care_cattle_reason = regexr(girl_help_care_cattle_reason, "^animal.*$", "They do not have cattle")
 replace girl_help_care_cattle_reason = "Girls are not there" if girl_help_care_cattle_reason == "No any girls"
 replace girl_help_care_cattle_reason = "Girls are not there" if girl_help_care_cattle_reason == "No child"
 replace girl_help_care_cattle_reason = "They do not have cattle" if girl_help_care_cattle_reason == "No at home"
 replace girl_help_care_cattle_reason = regexr(girl_help_care_cattle_reason, "^avail.*$", "They do not have cattle")
 replace girl_help_care_cattle_reason = "They do not have cattle" if girl_help_care_cattle_reason == "Not avelebal"
 replace girl_help_care_cattle_reason = "They do not have cattle" if girl_help_care_cattle_reason == "Not present"
 replace girl_help_care_cattle_reason = "They do not have cattle" if girl_help_care_cattle_reason == "Nshi hai"
 replace girl_help_care_cattle_reason = "They do not have cattle" if girl_help_care_cattle_reason == "Nwhi h"
 replace girl_help_care_cattle_reason = "They do not have cattle" if girl_help_care_cattle_reason == "Passu neih hai"
 replace girl_help_care_cattle_reason = regexr(girl_help_care_cattle_reason, "^Pasu.*$", "They do not have cattle")
 replace girl_help_care_cattle_reason = "They do not have cattle" if girl_help_care_cattle_reason == "Rakhte nhi h"
 replace girl_help_care_cattle_reason = "The girl is too young to help" if girl_help_care_cattle_reason == "Small child"
 replace girl_help_care_cattle_reason = regexr(girl_help_care_cattle_reason, "^nahin.*$", "They do not have cattle")
 
 **girl_help_farming_reason**
 replace girl_help_farming_reason = "They do not have land" if girl_help_farming_reason =="ANahi he"
 replace girl_help_farming_reason = "Girls are married" if girl_help_farming_reason == "All girls are already married"
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^Bh.*$","They do not have land")
 replace girl_help_farming_reason = "The girl is too young to help" if girl_help_farming_reason == "CHILD IS VERY SMALL"
 replace girl_help_farming_reason = "The girl is too young to help" if girl_help_farming_reason == "Choti h"
 replace girl_help_farming_reason = "Girls are not here" if girl_help_farming_reason == "Gaon me h"
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^Ghar.*$","They do not have land")
 replace girl_help_farming_reason = "Girls are not there" if girl_help_farming_reason == "Ghar par nahi hai"
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^H.*$","They do not have land")
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^Ha.*$","They do not have land")
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^J.*$","They do not have land")
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^KH.*$","They do not cultivate")
 replace girl_help_farming_reason = "Girls do not work" if girl_help_farming_reason == "Kaam nahi karti"
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^Ka.*$","They do not cultivate")
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^Kha.*$","They do not cultivate")
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^Khet.*$","They do not have land")
 replace girl_help_farming_reason = "They do not cultivate" if girl_help_farming_reason == "Khte nhe he"
 replace girl_help_farming_reason = "They do not cultivate" if girl_help_farming_reason == " Kjati neih hai"
 replace girl_help_farming_reason = "They do not have land" if girl_help_farming_reason == "Maho hai"
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^NAHI.*$","They do not have land")
 replace girl_help_farming_reason = "They do not have land" if girl_help_farming_reason == "NHI HAI"
 replace girl_help_farming_reason = "They do not have land" if girl_help_farming_reason == "NOT AVAILABLE"
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^Na.*$","They do not have land")
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^Ne.*$","They do not have land")
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^Nh.*$","They do not have land")
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^No.*$","They do not have land")
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^Not.*$","They do not have land")
 replace girl_help_farming_reason = "Girls are not here" if girl_help_farming_reason == "Not at home"
 replace girl_help_farming_reason = "They do not have land" if girl_help_farming_reason == "Nshi ha"
 replace girl_help_farming_reason = "They do not have land" if girl_help_farming_reason == "Nui hai"
 replace girl_help_farming_reason = "They do not have land" if girl_help_farming_reason == "Nyi h"
 replace girl_help_farming_reason = "The girl is too young to help" if girl_help_farming_reason == "Small child"
 replace girl_help_farming_reason = regexr(girl_help_farming_reason,"^nahin.*$","They do not have land")
 
 **girl_help_get_groce_reason**
 replace girl_help_get_groce_reason = "Girls are married" if girl_help_care_cattle_reason == "All girls are already married"
 replace girl_help_get_groce_reason = "Girls do not get groce" if girl_help_get_groce_reason == "Have own shop"
 replace girl_help_get_groce_reason = "Girls are not here" if girl_help_get_groce_reason == "Nahi hai"
 replace girl_help_get_groce_reason = "Girls do not get groce" if girl_help_get_groce_reason == "Shop pe ni jane dete"
 replace girl_help_get_groce_reason = "The girl is too young to help" if girl_help_get_groce_reason == "Small child"
 
 **boy_help_cook_reason**
 replace boy_help_cook_reason = "The boy is too young to help" if boy_help_cook_reason == "1 year"
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^ABHI.*$", "The boy is too young to help")
 replace boy_help_cook_reason = "The boy is too young to help" if boy_help_cook_reason == "Aata nahi"
 replace boy_help_cook_reason = "The boy is too young to help" if boy_help_cook_reason == "Abhi chote h"
 replace boy_help_cook_reason = "We dont want them to help" if boy_help_cook_reason == "Age kam h"
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^Baccha.*$", "The boy is too young to help")
 replace boy_help_cook_reason = "The boy is too young to help" if boy_help_cook_reason == "Bachha h abhi"
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^Bahar.*$", "The boy lives somewhere else")
 replace boy_help_cook_reason = " We do not have son" if boy_help_cook_reason == "Beta neih hai"
 replace boy_help_cook_reason = " The boy is too young to help" if boy_help_cook_reason == "Boy is small"
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^CHHOTA.*$", "The boy is too young to help")
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^Ch0te.*$", "The boy is too young to help")
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^Chhota.*$", "The boy is too young to help")
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^Chhote.*$", "The boy is too young to help")
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^Choota.*$", "The boy is too young to help")
 replace boy_help_cook_reason = "The boy is too young to help" if boy_help_cook_reason == "Chot h"
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^Chota.*$", "The boy is too young to help")
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^Chote.*$", "The boy is too young to help")
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^He.*$", "The boy is too young to help")
 replace boy_help_cook_reason = "We dont want them to help" if boy_help_cook_reason == "Karwata nahi"
 replace boy_help_cook_reason = " The boy is too young to help" if boy_help_cook_reason == "Kyonki bachha chota h"
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^Ladaka.*$", "The boy is too young to help")
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^Ladka.*$", "The boy is too young to help")
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^Ladke.*$", "The boy is too young to help")
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^Na.*$", "We do not have son")
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^SMALL.*$", "The boy is too young to help")
 replace boy_help_cook_reason = regexr(boy_help_cook_reason,"^Very.*$", "The boy is too young to help")
 
 **boy_help_clean_reason**
 replace boy_help_clean_reason = "The boy is too young to help" if boy_help_clean_reason == "ABHI CHOTE HAI"
 replace boy_help_clean_reason = "We dont want them to help" if boy_help_clean_reason == "Age kam h"
 replace boy_help_clean_reason = "The boy is too young to help" if boy_help_clean_reason == "Boy is small"
 replace boy_help_clean_reason = regexr(boy_help_clean_reason, "^Ba.*$", "The boy is too young to help")
 replace boy_help_clean_reason = "The boy is too young to help" if boy_help_clean_reason == "CHHOTE HAI"
 replace boy_help_clean_reason = regexr(boy_help_clean_reason, "^Chhota.*$", "The boy is too young to help")
 replace boy_help_clean_reason = "The boy is too young to help" if boy_help_clean_reason == "Chhote hain"
 replace boy_help_clean_reason = "The boy is too young to help" if boy_help_clean_reason == "Choota hai"
 replace boy_help_clean_reason = regexr(boy_help_clean_reason, "^Chota.*$", "The boy is too young to help")
 replace boy_help_clean_reason = regexr(boy_help_clean_reason, "^Chote.*$", "The boy is too young to help")
 replace boy_help_clean_reason = "No girl child to help" if boy_help_clean_reason == "Girl nhi h"
 replace boy_help_clean_reason = regexr(boy_help_clean_reason, "^H.*$", "No girl child to help")
 replace boy_help_clean_reason = "No girl child to help" if boy_help_clean_reason == "Hahi ha"
 replace boy_help_clean_reason = "We dont want them to help" if boy_help_clean_reason == "Karwata nahi ha"
 replace boy_help_clean_reason = regexr(boy_help_clean_reason, "^Ladka.*$", "The boy is too young to help")
 replace boy_help_clean_reason = regexr(boy_help_clean_reason, "^Ladke.*$", "The girl is too young to help")
 replace boy_help_clean_reason = regexr(boy_help_clean_reason, "^Ladki.*$", "No girl child to help")
 replace boy_help_clean_reason = regexr(boy_help_clean_reason, "^Ladkiya.*$", "No girl child to help")
 replace boy_help_clean_reason = "No girl child to help" if boy_help_clean_reason == "Larki nahi hai"
 replace boy_help_clean_reason = "No girl child to help" if boy_help_clean_reason == "NAHI HAI"
 replace boy_help_clean_reason = "No girl child to help" if boy_help_clean_reason == "NOT A GIRL AT HOME"
 replace boy_help_clean_reason = "No girl child to help" if boy_help_clean_reason == "Na ha"
 replace boy_help_clean_reason = regexr(boy_help_clean_reason, "^Nahi.*$", "No girl child to help")
 replace boy_help_clean_reason = "No girl child to help" if boy_help_clean_reason == "Nai h"
 replace boy_help_clean_reason = "No girl child to help" if boy_help_clean_reason == "Nehi hai"
 replace boy_help_clean_reason = regexr(boy_help_clean_reason, "^Nhi.*$", "No girl child to help")
 replace boy_help_clean_reason = "No girl child to help" if boy_help_clean_reason == "No any girls"
 replace boy_help_clean_reason = "No girl child to help" if boy_help_clean_reason == "Not avelebal"
 replace boy_help_clean_reason = regexr(boy_help_clean_reason, "^SMALL.*$", "The boy is too young to help")
 
 ** boy_help_clean_home_reason**
 replace boy_help_clean_home_reason = "The boy is too young to help" if boy_help_clean_home_reason == "ABI CHOTE  HAI"
 replace boy_help_clean_home_reason = "No boy child to help" if boy_help_clean_home_reason == "ANAHI HAI"
 replace boy_help_clean_home_reason = "We dont want them to help" if boy_help_clean_home_reason == "Age kam h"
 replace boy_help_clean_home_reason = "The boy is too young to help" if boy_help_clean_home_reason == "Boy is small"
 replace boy_help_clean_home_reason = "The boy is too young to help" if boy_help_clean_home_reason == "Chote hai"
 replace boy_help_clean_home_reason = "The boy is too young to help" if boy_help_clean_home_reason == "Choota hai"
 replace boy_help_clean_home_reason = regexr(boy_help_clean_home_reason, "^Chhota.*$", "The boy is too young to help")
 replace boy_help_clean_home_reason = regexr(boy_help_clean_home_reason, "^Chhote.*$", "The boy is too young to help")
 replace boy_help_clean_home_reason = "The boy is too young to help" if boy_help_clean_home_reason == "Choota"
 replace boy_help_clean_home_reason = regexr(boy_help_clean_home_reason, "^Chota.*$", "The boy is too young to help")
 replace boy_help_clean_home_reason = "The boy is too young to help" if boy_help_clean_home_reason == "Chote"
 replace boy_help_clean_home_reason = "No girl child to help" if boy_help_clean_home_reason == "Girl nhi h"
 replace boy_help_clean_home_reason = "We dont want them to help" if boy_help_clean_home_reason == "Kam nahi hai"
 replace boy_help_clean_home_reason = "The boy is too young to help" if boy_help_clean_home_reason == "Ladaka chota hai"
 replace boy_help_clean_home_reason = "The boy is too young to help" if boy_help_clean_home_reason == "Ladka chota u"
 replace boy_help_clean_home_reason = regexr(boy_help_clean_home_reason, "^Ladki.*$", "No girl child to help")
 replace boy_help_clean_home_reason = regexr(boy_help_clean_home_reason, "^Ladkiya.*$", "No girl child to help")
 replace boy_help_clean_home_reason = regexr(boy_help_clean_home_reason, "^Larki.*$", "No girl child to help")
 replace boy_help_clean_home_reason = "No girl child to help" if boy_help_clean_home_reason == "NAHI HAI"
 replace boy_help_clean_home_reason = "No girl child to help" if boy_help_clean_home_reason == "NHI HAI"
 replace boy_help_clean_home_reason = "No girl child to help" if boy_help_clean_home_reason == "NOY A GIRL AT HOME"
 replace boy_help_clean_home_reason = "No girl child to help" if boy_help_clean_home_reason == "Na ha"
 replace boy_help_clean_home_reason = regexr(boy_help_clean_home_reason, "^Nahi.*$", "No girl child to help")
 replace boy_help_clean_home_reason = regexr(boy_help_clean_home_reason, "^Nai.*$", "No girl child to help")
 replace boy_help_clean_home_reason = regexr(boy_help_clean_home_reason, "^Nehi.*$", "No girl child to help")
 replace boy_help_clean_home_reason = regexr(boy_help_clean_home_reason, "^Nhi.*$", "No girl child to help")
 replace boy_help_clean_home_reason = "No girl child to help" if boy_help_clean_home_reason == "No any girls"
 replace boy_help_clean_home_reason = "No girl child to help" if boy_help_clean_home_reason == "Not avelebal"
 replace boy_help_clean_home_reason = regexr(boy_help_clean_home_reason, "^SMALL.*$", "The boy is too young to help")
 
 **boy_help_laundry_reason**
 replace boy_help_laundry_reason = "The boy is too young to help" if boy_help_laundry_reason == "ABHI CHOTA HAI"
 replace boy_help_laundry_reason = "We dont want them to help" if boy_help_clean_home_reason == "Age kam h"
 replace boy_help_laundry_reason = "The boy is too young to help" if boy_help_laundry_reason == "Baccha aabhi chhota hai"
 replace boy_help_laundry_reason = "The boy is too young to help" if boy_help_laundry_reason == "Boy is small"
 replace boy_help_laundry_reason = "The boy is too young to help" if boy_help_laundry_reason == "Cgoota hai"
 replace boy_help_laundry_reason = regexr(boy_help_laundry_reason,"^Chh.*$", "The boy is too young to help")
 replace boy_help_laundry_reason = regexr(boy_help_laundry_reason,"^Ch.*$", "The boy is too young to help")
 replace boy_help_laundry_reason = "No girl child to help" if boy_help_laundry_reason == "Girl nhi h"
 replace boy_help_laundry_reason = "The boy is too young to help" if boy_help_laundry_reason == "Ladka chota hai"
 replace boy_help_laundry_reason = regexr(boy_help_laundry_reason,"^Ladki.*$", "No girl child to help")
 replace boy_help_laundry_reason = regexr(boy_help_laundry_reason,"^Lakdi.*$", "No girl child to help")
 replace boy_help_laundry_reason = regexr(boy_help_laundry_reason,"^Larki.*$", "No girl child to help")
 replace boy_help_laundry_reason = "No girl child to help" if boy_help_laundry_reason == "NAHI HAI"
 replace boy_help_laundry_reason = "No girl child to help" if boy_help_laundry_reason == "NOT A GIRL AT HOME"
 replace boy_help_laundry_reason = regexr(boy_help_laundry_reason,"^Na.*$", "No girl child to help")
 replace boy_help_laundry_reason = regexr(boy_help_laundry_reason,"^Ne.*$", "No girl child to help")
 replace boy_help_laundry_reason = regexr(boy_help_laundry_reason,"^Nh.*$", "No girl child to help")
 replace boy_help_laundry_reason = regexr(boy_help_laundry_reason,"^No.*$", "No girl child to help")
 replace boy_help_laundry_reason = regexr(boy_help_laundry_reason,"^SMALL.*$", "The boy is too young to help")
 
 **boy_help_get_water_reason**
 replace boy_help_get_water_reason = "The boy is too young to help" if boy_help_get_water_reason == "ABHI CHOTA HAI"
 replace boy_help_get_water_reason = "We dont want them to help" if boy_help_get_water_reason == "Age kam h"
 replace boy_help_get_water_reason = "The boy is too young to help" if boy_help_get_water_reason == "Baccha aabhi chhota hai"
 replace boy_help_get_water_reason = regexr(boy_help_get_water_reason,"^Ch.*$", "The boy is too young to help")
 replace boy_help_get_water_reason = regexr(boy_help_get_water_reason,"^Gh.*$", "We have a water connection")
 replace boy_help_get_water_reason = "No girl child to help" if boy_help_get_water_reason == "Girl nhi h"
 replace boy_help_get_water_reason = "The boy is too young to help" if boy_help_get_water_reason == "Ladka chota hai"
 replace boy_help_get_water_reason = regexr(boy_help_get_water_reason,"^Ladki.*$", "No girl child to help")
 replace boy_help_get_water_reason = regexr(boy_help_get_water_reason,"^Lana.*$", "We have a water connection")
 replace boy_help_get_water_reason = "No girl child to help" if boy_help_get_water_reason == "Larki nahi hai"
 replace boy_help_get_water_reason = "No girl child to help" if boy_help_get_water_reason == "Ldki nhi hai"
 replace boy_help_get_water_reason = regexr(boy_help_get_water_reason,"^N.*$", "No girl child to help")
 replace boy_help_get_water_reason = regexr(boy_help_get_water_reason,"^Pani.*$", "We have a water connection")
 replace boy_help_get_water_reason = regexr(boy_help_get_water_reason,"^S.*$", "The boy is too young to help")
 replace boy_help_get_water_reason = regexr(boy_help_get_water_reason,"^Water.*$", "We have a water connection")
 
 ** boy_help_care_child_reason**
  replace boy_help_care_child_reason = "The boy is too young to help" if boy_help_care_child_reason == "Abi choota hai"
  replace boy_help_care_child_reason = "We dont want them to help" if boy_help_care_child_reason == "Age kam h"
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason, "^BA.*$", "No kids to look after")
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason, "^Ba.*$", "No kids to look after")
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason, "^Bc.*$", "No kids to look after")
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason, "^CH.*$", "No kids to look after")
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason, "^Ch.*$", "No kids to look after")
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason, "^Gh.*$", "No kids to look after")
  replace boy_help_care_child_reason = "No girl child to help" if boy_help_care_child_reason == "Girl nhi h"
  replace boy_help_care_child_reason = "No kids to look after" if boy_help_care_child_reason =="Hai nahi"
  replace boy_help_care_child_reason = "No kids to look after" if boy_help_care_child_reason =="Isse chhota nhi hai"
  replace boy_help_care_child_reason = "The boy is too young to help" if boy_help_care_child_reason == "Khud Chota h"
  replace boy_help_care_child_reason = "The boy is too young to help" if boy_help_care_child_reason == "Ladaka chota hai"
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason, "^Ladki.*$", "No girl child to help")
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason, "^Larki.*$", "No girl child to help")
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason, "^Ldki.*$", "No girl child to help")
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason, "^NA.*$", "No kids to look after")
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason, "^NOT.*$", "No kids to look after")
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason, "^Na.*$", "No kids to look after")
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason, "^Ne.*$", "No kids to look after")
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason, "^Nh.*$", "No kids to look after")
  replace boy_help_care_child_reason = "No girl child to help" if boy_help_care_child_reason == "No any girls"
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason,"^No.*$", "No kids to look after")
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason,"^Not.*$", "No kids to look after")
  replace boy_help_care_child_reason = "No kids to look after" if boy_help_care_child_reason =="Nshi hai"
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason,"^SMALL.*$", "The boy is too young to help")
  replace boy_help_care_child_reason = "The boy is too young to help" if boy_help_care_child_reason == "Sabse choota ladka hi hai"
  replace boy_help_care_child_reason = "The boy is too young to help" if boy_help_care_child_reason == "Small child"
  replace boy_help_care_child_reason = "The boy is too young to help" if boy_help_care_child_reason == "Whi chota h"
  replace boy_help_care_child_reason =regexr(boy_help_care_child_reason,"^nahin.*$", "No kids to look after")
  
  **boy_help_care_old_reason**
  replace boy_help_care_old_reason = "The boy is too young to help" if boy_help_care_old_reason == "ABHI CHOTA HAI"
  replace boy_help_care_old_reason = "We dont want them to work" if boy_help_care_old_reason =="Age kam h"
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^Al.*$", "They do not live with us")
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^Bu.*$", "They are not there")
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^Ch.*$", "The boy is too young to help")
  replace boy_help_care_old_reason = "They do not live with us" if boy_help_care_old_reason =="Dusre ghsr rhte h"
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^E.*$", "They have expired")
  replace boy_help_care_old_reason = "They do not live with us" if boy_help_care_old_reason == "Gaon me h"
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^Gh.*$", "They are not there")
  replace boy_help_care_old_reason = "No girl child to help" if boy_help_care_old_reason == "Girl nhi h"
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^Ha.*$", "They are not there")
  replace boy_help_care_old_reason = "They live with my uncle-Kaka" if boy_help_care_old_reason == "Kaka ke"
  replace boy_help_care_old_reason = "The boy is too young to help" if boy_help_care_old_reason == "Ladka chota hai"
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^Ladki.*$", "No girl child to help")
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^Larki.*$", "No girl child to help")
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^NAHI.*$", "They are not there")
  replace boy_help_care_old_reason = "No girl child to help" if boy_help_care_old_reason == "NOT A GIRL AT HOME"
  replace boy_help_care_old_reason = "They are not there" if  boy_help_care_old_reason == "NOT A GRANDPERSON"
  replace boy_help_care_old_reason = "They are not there" if  boy_help_care_old_reason == "NOT GRAND PERSON AT HOME"
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^Na.*$", "They are not there")
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^Ne.*$", "They are not there")
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^Nh.*$", "They are not there")
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^No.*$", "They are not there")
  replace boy_help_care_old_reason = "They are not there" if  boy_help_care_old_reason == "Nui"
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^SMALL.*$", "The boy is too young to help")
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^Sa.*$", "They do not live with us")
  replace boy_help_care_old_reason = "The boy is too young to help" if boy_help_care_old_reason == "Small child"
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^Ta.*$","They live with my uncle-Tau") 
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^Ya.*$", "They do not live with us")
  replace boy_help_care_old_reason = regexr(boy_help_care_old_reason,"^na.*$", "They do not live with us") 
  
  **boy_help_care_cattle_reason**
  replace boy_help_care_cattle_reason = "We dont want them to work" if  boy_help_care_cattle_reason == "Age kam h"
  replace boy_help_care_cattle_reason = regexr(boy_help_care_cattle_reason,"^An.*$", "They do not have cattle")
  replace boy_help_care_cattle_reason = "They do not have cattle" if boy_help_care_cattle_reason == "Bhes neih hai"
  replace boy_help_care_cattle_reason = regexr(boy_help_care_cattle_reason,"^Ch.*$", "The boy is too young to help")
  replace boy_help_care_cattle_reason = "They do not have cattle" if boy_help_care_cattle_reason == "Dangar nahi h"
  replace boy_help_care_cattle_reason = "They do not have cattle" if boy_help_care_cattle_reason == "GNo any animals"
  replace boy_help_care_cattle_reason = regexr(boy_help_care_cattle_reason,"^Ghar.*$", "They do not have cattle")
  replace boy_help_care_cattle_reason = "No girl child to help" if boy_help_care_cattle_reason == "Girl nhi h"
  replace boy_help_care_cattle_reason = regexr(boy_help_care_cattle_reason,"^H.*$", "They do not have cattle")
  replace boy_help_care_cattle_reason = regexr(boy_help_care_cattle_reason,"^JA.*$", "They do not have cattle")
  replace boy_help_care_cattle_reason = regexr(boy_help_care_cattle_reason,"^Ja.*$", "They do not have cattle")
  replace boy_help_care_cattle_reason = "We dont want them to work" if boy_help_care_cattle_reason == "Karwata nahi"
  replace boy_help_care_cattle_reason = "We dont want them to work" if boy_help_care_cattle_reason == "Khet nahi hai"
  replace boy_help_care_cattle_reason = "The boy is too young to help" if boy_help_care_cattle_reason == "Ladaka chota hai"
  replace boy_help_care_cattle_reason = regexr(boy_help_care_cattle_reason,"^Ladki.*$", "No girl child to help")
  replace boy_help_care_cattle_reason = regexr(boy_help_care_cattle_reason,"^Larki.*$", "No girl child to help")
  replace boy_help_care_cattle_reason = "They do not have cattle" if boy_help_care_cattle_reason == "NAHI HAI"
  replace boy_help_care_cattle_reason = "No girl child to help" if boy_help_care_cattle_reason == "NOT A GIRL AT HOME"
  replace boy_help_care_cattle_reason = "They do not have cattle" if boy_help_care_cattle_reason == "NOT AT HOME"
  replace boy_help_care_cattle_reason = "They do not have cattle" if boy_help_care_cattle_reason == "NOT AVAILABLE"
  replace boy_help_care_cattle_reason = regexr(boy_help_care_cattle_reason,"^Na.*$", "They do not have cattle")
  replace boy_help_care_cattle_reason = regexr(boy_help_care_cattle_reason,"^Ne.*$", "They do not have cattle")
  replace boy_help_care_cattle_reason = regexr(boy_help_care_cattle_reason,"^Nh.*$", "They do not have cattle")
  replace boy_help_care_cattle_reason = regexr(boy_help_care_cattle_reason,"^No.*$", "They do not have cattle")
  replace boy_help_care_cattle_reason = regexr(boy_help_care_cattle_reason,"^P.*$", "They do not have cattle")
  replace boy_help_care_cattle_reason = regexr(boy_help_care_cattle_reason,"^S.*$", "The boy is too young to help")
  replace boy_help_care_cattle_reason = regexr(boy_help_care_cattle_reason,"^n.*$", "They do not have cattle")
  
  ** boy_help_farming_reason**
  
replace boy_help_farming_reason = "We dont want them to work" if  boy_help_farming_reason == "Age kam h"
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^Bh.*$", "They do not have land")
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^Ch.*$", "The boy is too young to help")
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^Small.*$", "The boy is too young to help")
replace boy_help_farming_reason = "They do not have land" if boy_help_farming_reason == "FIELDS ARE NOT AVAILABLE"
replace boy_help_farming_reason = "We dont want them to work" if  boy_help_farming_reason == "Gaon me h"
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^Gh.*$", "They do not cultivate")
replace boy_help_farming_reason = "Girls are not there" if boy_help_farming_reason == "Girl nhi h"
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^H.*$", "They do not cultivate")
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^K.*$", "They do not cultivate")
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^Ladka.*$", "The boy is too young to help")
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^Ladki.*$", "Girls are not there")
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^Larki.*$", "Girls are not there")
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^M.*$", "They do not cultivate")
replace boy_help_farming_reason = "They do not cultivate" if boy_help_farming_reason == "N"
replace boy_help_farming_reason = "They do not cultivate" if boy_help_farming_reason == "NAHI HAI"
replace boy_help_farming_reason = "They do not cultivate" if boy_help_farming_reason == "NHI HAI"
replace boy_help_farming_reason = "Girls are not there" if boy_help_farming_reason == "NOT A GIRL AT HOME"
replace boy_help_farming_reason = "They do not cultivate" if boy_help_farming_reason == "NOT AVAILABLE"
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^Na.*$", "They do not cultivate")
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^Ne.*$", "They do not cultivate")
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^Nh.*$", "They do not cultivate")
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^No.*$", "They do not have land")
replace boy_help_farming_reason = "They do not cultivate" if boy_help_farming_reason == "Nshi hai"
replace boy_help_farming_reason = "They do not cultivate" if boy_help_farming_reason == "Nui"
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^SMALL.*$", "The boy is too young to help")
replace boy_help_farming_reason = "They do not cultivate" if boy_help_farming_reason == "TNahi hai"
replace boy_help_farming_reason = "We dont want them to work" if  boy_help_farming_reason == "Uspa karwata nahi"
replace boy_help_farming_reason = regexr(boy_help_farming_reason, "^nahin.*$", "They do not cultivate")


**boy_help_get_groce_reason**
replace boy_help_get_groce_reason = "The boy is too young to help" if boy_help_get_groce_reason == "ABHI CHOTA HAI"
replace boy_help_get_groce_reason = "The boy is too young to help" if boy_help_get_groce_reason == "Abhi chotta h . Isle ni bhejte."
replace boy_help_get_groce_reason = "We dont want them to work" if boy_help_get_groce_reason == "Age kam h"
replace boy_help_get_groce_reason = regexr(boy_help_get_groce_reason, "^B.*$", "The boy is too young to help")
replace boy_help_get_groce_reason = regexr(boy_help_get_groce_reason, "^Ch.*$", "The boy is too young to help")
replace boy_help_get_groce_reason = "No girl child to help" if  boy_help_get_groce_reason == "Girl nhi h"
replace boy_help_get_groce_reason = regexr(boy_help_get_groce_reason, "^Ladaka.*$", "The boy is too young to help")
replace boy_help_get_groce_reason = regexr(boy_help_get_groce_reason, "^Ladka.*$", "The boy is too young to help")
replace boy_help_get_groce_reason = regexr(boy_help_get_groce_reason, "^Ladkha.*$", "The boy is too young to help")
replace boy_help_get_groce_reason = regexr(boy_help_get_groce_reason, "^Ladki.*$", "No girl child to help")
replace boy_help_get_groce_reason = regexr(boy_help_get_groce_reason, "^Larki.*$", "No girl child to help")
replace boy_help_get_groce_reason = regexr(boy_help_get_groce_reason, "^Ldki.*$", "No girl child to help")
replace boy_help_get_groce_reason = "No girl child to help" if boy_help_get_groce_reason == "Girl nhi h"
replace boy_help_get_groce_reason = regexr(boy_help_get_groce_reason, "^Na.*$", "Boys do not get groce")
replace boy_help_get_groce_reason = regexr(boy_help_get_groce_reason, "^Ne.*$", "Boys do not get groce")
replace boy_help_get_groce_reason = regexr(boy_help_get_groce_reason, "^Nh.*$", "Boys do not get groce")
replace boy_help_get_groce_reason = "No girl child to help" if boy_help_get_groce_reason == "No any girls"
replace boy_help_get_groce_reason = "No girl child to help" if boy_help_get_groce_reason == "Not avelebal"
replace boy_help_get_groce_reason = regexr(boy_help_get_groce_reason, "^S.*$", "The boy is too young to help")

**parent_khap_work_oth**

replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^!.*$", "Important decisions and help in farming")
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Agar.*$", "Resolve disputes not decided by court regarding gotra")
replace parent_khap_work_oth = "Panchayat of many villages" if parent_khap_work_oth == "12village ki panchayat hoti hai"
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^1 g.*$", "Avoid same gotra marriage and same village")
replace parent_khap_work_oth = "" if parent_khap_work_oth == "1 gotr or 1 village me koi shadi nahi k"
replace parent_khap_work_oth = "Achieve specific result" if parent_khap_work_oth == "ACHIVE A SPECIFIC RESULT"
replace parent_khap_work_oth = "Avoid same gotra marriage" if parent_khap_work_oth == "Aapna gothor ma sadhi krna hota h"
replace parent_khap_work_oth = "About gotra matters" if parent_khap_work_oth == "About Gotra matter"
replace parent_khap_work_oth = "Abolish Dowry" if parent_khap_work_oth == "Against dowry"
replace parent_khap_work_oth = "Give judgement in cases not given by court" if parent_khap_work_oth == "Agar koi fasla cort se nahi ho raha h t"
replace parent_khap_work_oth = "Avoid same gotra marriage" if parent_khap_work_oth == "Alag got mai shadi hi krna apne got mai ni krna"
replace parent_khap_work_oth = "Decisions about own gotra" if parent_khap_work_oth == "Ane gt ko lekr"
replace parent_khap_work_oth = "Oversee social work" if parent_khap_work_oth == "Any Social work jaj krna."
replace parent_khap_work_oth = "Decisions about same gotra marriage" if parent_khap_work_oth == "Apne got mai shadi ke faisle"
replace parent_khap_work_oth = "Decisions related own gotra" if parent_khap_work_oth == "Apne got se related fesle"
replace parent_khap_work_oth = "Resolve disputes regarding own gotra and gives diktat" if parent_khap_work_oth == "Apne goter m hi sabhi jhagdo ka niptara karna or un sab ko rokne k lee a  farman jari karna"
replace parent_khap_work_oth = "Make rules about own community" if parent_khap_work_oth == "Apne samuday ke bare me niyam banati h"
replace parent_khap_work_oth = "Take decisions regarding own caste" if parent_khap_work_oth == "Apni jaati se samndit faisle lena"
replace parent_khap_work_oth = "To increase brotherhood" if parent_khap_work_oth == "Bhai chara bhadti h"
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Bhut.*$", "Panchayat of many villages for cooperation")
replace parent_khap_work_oth = "Ensure marriage in same caste and different gotra" if parent_khap_work_oth == "Caste mai shadi aur got se alg shadi krwana"
replace parent_khap_work_oth = "Ban use of DJ and dowry" if parent_khap_work_oth == "D.j band kro, dahej na do"
replace parent_khap_work_oth = "Ban use of DJ" if parent_khap_work_oth == "DJ BAN"
replace parent_khap_work_oth = "Ban use of DJ" if parent_khap_work_oth == "DJ PAR BAN"
replace parent_khap_work_oth = "Ban use of DJ" if parent_khap_work_oth == "D.j band kro, dahej na do,"
replace parent_khap_work_oth = "Ban Dowry and oversee good social work" if parent_khap_work_oth == "Dhej pe rok lagana, social works as buriya dur karti h"
replace parent_khap_work_oth = "Ban use of DJ" if parent_khap_work_oth == "Dj band karwana ka kam kerta h"
replace parent_khap_work_oth = "Panchayat gives decisons and union of many villages" if parent_khap_work_oth == "Ek gauo ki panchyat se fansla nahi hota to 12 gaou ya 27 gauo ki panchyat uska fansla karti h jo fansla kati h vo manana padata"
replace parent_khap_work_oth = "Avoid same gotra marriage" if parent_khap_work_oth == "Ek gotr m shadi p rok lgati h"
replace parent_khap_work_oth = "Decisions on same gotra marriage" if parent_khap_work_oth == "Ek gotr mai shadi ke faisle"
replace parent_khap_work_oth = "Decisions on same gotra marriage" if parent_khap_work_oth == "Faisla krna ek got"
replace parent_khap_work_oth = "Gives Diktat" if parent_khap_work_oth == "Farman sunana"
replace parent_khap_work_oth = "Takes decisions" if parent_khap_work_oth == "Fasle karti h"
replace parent_khap_work_oth = "Ban girl killings" if parent_khap_work_oth == "GIRLS KE DEATH PAR BAN"
replace parent_khap_work_oth = "Achieve specific result" if parent_khap_work_oth == "GO TO A SPECIFIC RESULT"
replace parent_khap_work_oth = "Achieve specific result" if parent_khap_work_oth == "GO TO SPECIFIC RESULT"
replace parent_khap_work_oth = "Resolve  disputes" if parent_khap_work_oth == "Gaav m jagde juljati h"
replace parent_khap_work_oth = "Maintaince of village " if parent_khap_work_oth == "Gaav m sudar krna"
replace parent_khap_work_oth = "Ban inter caste marriages" if parent_khap_work_oth == "Gair biradri m shadi ni hone dete, jat se gira dete h, gnv se bahar nikal dete h."
replace parent_khap_work_oth = "Ban inter caste marriages" if parent_khap_work_oth == "Gair biradri m shadi p rok lgati h"
replace parent_khap_work_oth = "To raise awareness on right and wrong" if parent_khap_work_oth == "Galat sahi kam ki pehchan karate hai"
replace parent_khap_work_oth = "To build concrete rooms,surface and lane" if parent_khap_work_oth == "Gali , paras banana aur kamre bnana"
replace parent_khap_work_oth = "Maintainance of lanes and chopal" if parent_khap_work_oth == "Gali chopal thik karwana"
replace parent_khap_work_oth = "Help in build housing for poor and lanes " if parent_khap_work_oth == "Gali or grib logo k mkan bnwane m shayta"
replace parent_khap_work_oth = "To check happening of wrong things" if parent_khap_work_oth == "Galt kam rokne ka hota h"
replace parent_khap_work_oth = "Takes decisions related to village " if parent_khap_work_oth == "Gaon k fasle karwati h"
replace parent_khap_work_oth = "Help on resolving disputes" if parent_khap_work_oth == "Gaon k h Jhagde suljhane me madad karti h"
replace parent_khap_work_oth = "To restrain growth of poor people" if parent_khap_work_oth == "Garibo ko dabane ki koshish karte hai."
replace parent_khap_work_oth = "Resolve atrocities against girl and marriage disputes" if parent_khap_work_oth == "Girls k saath ya kisi ghar m jhagda ho raha h to solution karti h"
replace parent_khap_work_oth = "Gotra related issues" if parent_khap_work_oth == "Got se related"
replace parent_khap_work_oth = "Resolve gotra related disputes" if parent_khap_work_oth == "Gotra vivad ko samapapt ker ti hai"
replace parent_khap_work_oth = "Responsibility of social work but does not do it" if parent_khap_work_oth == "Inka kam samaj mai ache kam karna hai but vo ye kam ksrti nahi hai"
replace parent_khap_work_oth = "Decisions on inter-cast marriage" if parent_khap_work_oth == "Inter cast marriage krne pr faisla krna, kisi vishesh masle ko suljhane k lee a khaap panchayat bulayi jati h"
replace parent_khap_work_oth = "Resolve disputes" if parent_khap_work_oth == "JAGHDO KA SULAH KRATI  HAI"
replace parent_khap_work_oth = "Resolve disputes" if parent_khap_work_oth == "JHAGHADO KA SULAH KARWATI HAI"
replace parent_khap_work_oth = "Resolve disputes" if parent_khap_work_oth == "Jhado ka niptara kerna"
replace parent_khap_work_oth = "Resolve disputes" if parent_khap_work_oth == "Jhagdo ka niptara kerte h"
replace parent_khap_work_oth = "Resolve disputes" if parent_khap_work_oth == "Jhado ka fala krwati hai"
replace parent_khap_work_oth = "Resolves disputes in own caste" if parent_khap_work_oth == "Jaati k ander hone wali problem ka fesla karna"
replace parent_khap_work_oth = "To judge work" if parent_khap_work_oth == "Jaj any Work"
replace parent_khap_work_oth = "To judge work" if parent_khap_work_oth == "Jaj ka kaam"
replace parent_khap_work_oth = "To judge work" if parent_khap_work_oth == "Jaj krna any problam"
replace parent_khap_work_oth = "Works for development of own caste like marriage" if parent_khap_work_oth == "Jati ke hak ke lia kam karti hai jaise marrige"
replace parent_khap_work_oth = "To increase brotherhood in own caste " if parent_khap_work_oth == "Jatti wad main badhawa dena"
replace parent_khap_work_oth = "Takes responsible decisions " if parent_khap_work_oth == "Jayaj fasle karte hai"
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^JH.*$", "Resolve disputes")
replace parent_khap_work_oth = "Resolve bigger issues not handled by panchayat" if parent_khap_work_oth == "Jo decision choti panchayat nhi kr pati, wo matter solve out karti hai"
replace parent_khap_work_oth = "Gives correct decisions" if parent_khap_work_oth == "Khaap acha decision deti hai"
replace parent_khap_work_oth = "Gives decisions" if parent_khap_work_oth == "Khaap apnay decision deti h"
replace parent_khap_work_oth = "Gives decisions" if parent_khap_work_oth == "Khaap decision deti h"
replace parent_khap_work_oth = "Gives decisions" if parent_khap_work_oth == "Khaap decision deti hai"
replace parent_khap_work_oth = "Gives decisions" if parent_khap_work_oth == "Khaap decision detihai"
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Khaap.*$", "Gives decisions")
replace parent_khap_work_oth = "Controls socities" if parent_khap_work_oth == "Khaap samaj ko control karti h gala"
replace parent_khap_work_oth = "Panchayat of one caste" if parent_khap_work_oth == "Khap I jati panchyat hoti hai jo ke jati ke maslo ka niptar karti hai"
replace parent_khap_work_oth = "Gives decisions" if parent_khap_work_oth == "Khap decision deti h"
replace parent_khap_work_oth = "Gives decisions" if parent_khap_work_oth == "Khap nirnay deti hai"
replace parent_khap_work_oth = "Reslove disputes of own caste" if parent_khap_work_oth == "Khap panchyat 1 jati ke panchyat hoti hai jo ke apni jati ke masle siljhati hai"
replace parent_khap_work_oth = "Panchayat of one caste and resolve issues" if parent_khap_work_oth == "Khap panchyat 1 jati ke panchyat hoti hai jo 4-5 villages ko mala kar banti hai ye panchyat apni he jati ke problems ko solv karti hai"
replace parent_khap_work_oth = "Gives decisions" if parent_khap_work_oth == "Khhap decision deti h"
replace parent_khap_work_oth = "Gives solution of a problem" if parent_khap_work_oth == "Kisi problam ka solution karne ka kaam"
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Kisi.*$","Gives solutions")
replace parent_khap_work_oth = "No Work done" if parent_khap_work_oth == "Koi kaam nahi kr rakha"
replace parent_khap_work_oth = "Resolves disputes" if parent_khap_work_oth == "Ladai jagde niptate hai"
replace parent_khap_work_oth = "Resolves disputes " if parent_khap_work_oth == "Ladayi ka faisla"
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Ladki.*$","Resolves issues of marriage")
replace parent_khap_work_oth = "Resolves disputes" if parent_khap_work_oth == "Ldayi jhgde k niptara"
replace parent_khap_work_oth = "Decisions on love marriage in same caste" if parent_khap_work_oth == "Love mariage k lie same caste me"
replace parent_khap_work_oth = "Resolves issues on same gotra marriage" if parent_khap_work_oth == "Marriage gottra solution"
replace parent_khap_work_oth = "Decisons related to marriage" if parent_khap_work_oth == "Marriage related"
replace parent_khap_work_oth = "Resolves disputes regarding marriage, dowry and gotra" if parent_khap_work_oth == "Marrrige , Dowary System  , GOTAR KE JHADO KE FAISLE ETC."
replace parent_khap_work_oth = "Solution to murder cases" if parent_khap_work_oth == "Mudder case solution"
replace parent_khap_work_oth = "Interfere in personal matters" if parent_khap_work_oth == "Niji mmamlo me dhakal karti"
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Objection.*$","Raises objections if love marriage")
replace parent_khap_work_oth = "Does honour killing" if parent_khap_work_oth == "Onour killing ka kam karti h"
replace parent_khap_work_oth = "Ensures marriage in other gotra" if  parent_khap_work_oth == "Other gotr me marrige karna"
replace parent_khap_work_oth = "Gives decisions" if parent_khap_work_oth == "Panchati fasla"
replace parent_khap_work_oth = "Gives decisions" if parent_khap_work_oth == "Panchati fasla"
replace parent_khap_work_oth = "Gives decisions" if parent_khap_work_oth == "Pax mkam krti h"
replace parent_khap_work_oth = "Gives decisons" if parent_khap_work_oth == "Phasle sunana"
replace parent_khap_work_oth = "Helps in matrimonials" if parent_khap_work_oth == "Riste karwana"
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Road.*$","Oversee development work") 
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Sal.*$", "Resolve disputes")
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Samaj.*$", "Makes socities better")
replace parent_khap_work_oth = "Resolves issues" if  parent_khap_work_oth == "Samsaao ko suljhane me madat krti hai"
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Samuhek.*$", "Does community work and resolve disputes")
replace parent_khap_work_oth = "Works on social development" if parent_khap_work_oth == "Smajik kam m help,"
replace parent_khap_work_oth = "Works on building cow shelters" if parent_khap_work_oth == "Social wark as a cow sala  banene ka"
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Sol.*$", "Resolves disputes")
replace parent_khap_work_oth = "Ban use of DJ" if  parent_khap_work_oth == "Stoped dj and other"
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Su.*$", "Resolves disputes")
replace parent_khap_work_oth = "Social work and judgement on individual panchayat" if parent_khap_work_oth == "Social work n judgement on the lower panchayat court like panchayat"
replace parent_khap_work_oth = "Achieve specific result" if parent_khap_work_oth == "TO ACHIVE A SPECIFIC RESULT"
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^They.*$", "Gives solutions to villagers problems")
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Sbi.*$", "Does larger community work")
replace parent_khap_work_oth = "Gives decisions" if parent_khap_work_oth == "Thik fashla lathi h"
replace parent_khap_work_oth = "Solves problems" if parent_khap_work_oth == "To solve all problems of villages"
replace parent_khap_work_oth = "Takes decisions if anything wrong happening" if parent_khap_work_oth == "Village mai agar galat kaam ho rha ho t"
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Vpo.*$", "Resolves disputes and maintain peace")
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^WO SIRF.*$", "Encourages violence and honour killings")
replace parent_khap_work_oth = "Helps in matrimonials" if parent_khap_work_oth == "Wedding"
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Wo samaj.*$", "Social development and caretaker") 
replace parent_khap_work_oth = "Gives decisions" if parent_khap_work_oth == "faisle karti hai"
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^gohter.*$", "Works for own gotra")
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^khaap.*$", "Everyone has to abide by khap decisions") 
replace parent_khap_work_oth = regexr(parent_khap_work_oth, "^Village.*$", "Stop any wrong happening in village")  
 

