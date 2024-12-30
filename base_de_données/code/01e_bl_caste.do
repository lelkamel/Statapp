* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
* 																	  *
* Project: Breakthrough (BT)     									  *
*                                                                	  *
* Purpose:												              *
*                  													  *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

**Correcting Scaste_oth variable**
replace Scaste_oth = "Don't know" if Scaste_oth == "0"
replace Scaste_oth = "Don't know" if Scaste_oth == "6"
replace Scaste_oth = "Don't know" if Scaste_oth == "999"

replace Scaste_oth = "Od" if Scaste_oth == "AUD"

replace Scaste_oth = "Abbase" if Scaste_oth == "Abasi"

replace Scaste_oth = "Ad Dharmi" if Scaste_oth == "Ad"

replace Scaste_oth = "Ahir" if Scaste_oth == "Ahir"
replace Scaste_oth = "Ahir" if Scaste_oth == "Ahirwaal"

replace Scaste_oth = regexr(Scaste_oth, "^Ans.*$", "Ansari")
replace Scaste_oth = regexr(Scaste_oth, "^Black.*$", "Ansari")

replace Scaste_oth = "Backward Class" if Scaste_oth == "B.c"
replace Scaste_oth = "Backward Class" if Scaste_oth == "Bc"

replace Scaste_oth = regexr(Scaste_oth, "^Ber.*$", "Bairagi")
replace Scaste_oth = regexr(Scaste_oth, "^Bir.*$", "Bairagi")
replace Scaste_oth = "Bairagi" if Scaste_oth == "BAIRAGI"
replace Scaste_oth = "Bairagi" if Scaste_oth == "BERAGI"
replace Scaste_oth = "Bairagi" if Scaste_oth == "Baragi"
replace Scaste_oth = "Bairagi" if Scaste_oth == "Bragi"
replace Scaste_oth = "Bairagi" if Scaste_oth == "VEGRI"
replace Scaste_oth = "Bairagi" if Scaste_oth == "VAGRI"
replace Scaste_oth = "Bairagi" if Scaste_oth == "VAREGI"
replace Scaste_oth = "Bairagi" if Scaste_oth == "Varaghi"
replace Scaste_oth = "Bairagi" if Scaste_oth == "Veragi"
replace Scaste_oth = "Bairagi" if Scaste_oth == "Viragi"
replace Scaste_oth = "Bairagi" if Scaste_oth == "Virai"

replace Scaste_oth = regexr(Scaste_oth, "^Bav.*$", "Bawariya")
replace Scaste_oth = regexr(Scaste_oth, "^Baw.*$", "Bawariya")
replace Scaste_oth = "Bawariya" if Scaste_oth == "BAWARIA"
replace Scaste_oth = "Bawariya" if Scaste_oth == "Bevra"

replace Scaste_oth = "Balmiki" if Scaste_oth == "BALMIKI" 
replace Scaste_oth = "Balmiki" if Scaste_oth == "Baalmiki"
replace Scaste_oth = "Balmiki" if Scaste_oth == "Vaalmiki"
replace Scaste_oth = "Balmiki" if Scaste_oth == "Bilmik"
replace Scaste_oth = "Balmiki" if Scaste_oth == "Vamiki"
replace Scaste_oth = "Balmiki" if Scaste_oth == "Walmiki"
replace Scaste_oth = regexr(Scaste_oth, "^Bal.*$", "Balmiki")
replace Scaste_oth = regexr(Scaste_oth, "^Val.*$", "Balmiki")

replace Scaste_oth = "Bhardwaj" if Scaste_oth == "BHARDWAS"

replace Scaste_oth = "Bharbhuja" if Scaste_oth == "BHARGUE"
replace Scaste_oth = "Bharbhuja" if Scaste_oth == "Bhdbhuje"
replace Scaste_oth = "Bharbhuja" if Scaste_oth == "Bhhadbujja"
replace Scaste_oth = regexr(Scaste_oth, "^Badb.*$", "Bharbhuja")
replace Scaste_oth = regexr(Scaste_oth, "^Bhad.*$", "Bharbhuja")

replace Scaste_oth = "Brahmin" if Scaste_oth == "BHARMAN"
replace Scaste_oth = "Brahmin" if Scaste_oth == "Bharhman"
replace Scaste_oth = "Brahmin" if Scaste_oth == "Bhraman"
replace Scaste_oth = "Brahmin" if Scaste_oth == "Brhaman"
replace Scaste_oth = regexr(Scaste_oth, "^Bar.*$", "Brahmin")
replace Scaste_oth = regexr(Scaste_oth, "^Brah.*$", "Brahmin")
replace Scaste_oth = "Brahmin" if Scaste_oth == "Nagar"

replace Scaste_oth = "Badi" if Scaste_oth == "Baadi"
replace Scaste_oth = "Badi" if Scaste_oth == "Badhi"
replace Scaste_oth = "Badi" if Scaste_oth == "Baddi"

replace Scaste_oth = "Baniya" if Scaste_oth == "Baaniya"
replace Scaste_oth = regexr(Scaste_oth, "^Bani.*$", "Baniya")

replace Scaste_oth = "Bangali" if Scaste_oth == "Bangoli"

replace Scaste_oth = "Banjara" if Scaste_oth == "Banjare"

replace Scaste_oth = "Byas" if Scaste_oth == "Bayas"
replace Scaste_oth = "Byas" if Scaste_oth == "Byaas"

replace Scaste_oth = "Don't know" if Scaste_oth == "Beeke"

replace Scaste_oth = "Don't know" if Scaste_oth == "Bin"

replace Scaste_oth = "Don't know" if Scaste_oth == "Bihari"

replace Scaste_oth = regexr(Scaste_oth, "^Braya.*$", "Barai")
replace Scaste_oth = regexr(Scaste_oth, "^Vraya.*$", "Barai")

replace Scaste_oth = "Baheliya" if Scaste_oth == "Bheliya"

replace Scaste_oth = "Chamar" if Scaste_oth == "Chmar"

replace Scaste_oth = regexr(Scaste_oth, "^.*han$", "Chauhan")

replace Scaste_oth = regexr(Scaste_oth, "^Chhi.*$", "Chhipi")
replace Scaste_oth = regexr(Scaste_oth, "^Chi.*$", "Chhipi")

replace Scaste_oth = regexr(Scaste_oth, "^DHA.*$", "Dhanak")
replace Scaste_oth = regexr(Scaste_oth, "^Dah.*$", "Dhanak")
replace Scaste_oth = regexr(Scaste_oth, "^.*ak$", "Dhanak")
replace Scaste_oth = regexr(Scaste_oth, "^Dhan.*$", "Dhanak")
replace Scaste_oth = "Dhanak" if Scaste_oth == "Danake"
replace Scaste_oth = "Dhanak" if Scaste_oth == "Danek"
replace Scaste_oth = "Dhanak" if Scaste_oth == "Dhenek"
replace Scaste_oth = "Dhanak" if Scaste_oth == "Ghank"

replace Scaste_oth = "Dhobi" if Scaste_oth == "DHOBI"
replace Scaste_oth = regexr(Scaste_oth, "^.*bi$", "Dhobi")
replace Scaste_oth = regexr(Scaste_oth, "^Dhobi.*$", "Dhobi")

replace Scaste_oth = "Doom" if Scaste_oth == "DOM"
replace Scaste_oth = "Doom" if Scaste_oth == "Dumm"
replace Scaste_oth = regexr(Scaste_oth, "^.*om$", "Doom")
replace Scaste_oth = regexr(Scaste_oth, "^.*um$", "Doom")
replace Scaste_oth = regexr(Scaste_oth, "^Doo.*$", "Doom")

replace Scaste_oth = "Dakaut" if Scaste_oth == "Dhakot pandit"
replace Scaste_oth = "Dakaut" if Scaste_oth == "Dakot"
replace Scaste_oth = "Dakaut" if Scaste_oth == "Dakut"

replace Scaste_oth = regexr(Scaste_oth, "^Dar.*$", "Darji")

replace Scaste_oth = "Dheha" if Scaste_oth == "Dhea"

replace Scaste_oth = "Dhimar" if Scaste_oth == "Dhiman"

replace Scaste_oth = "Don't know" if Scaste_oth == "Don, t no"

replace Scaste_oth = "Dusad" if Scaste_oth == "Dujaar"

replace Scaste_oth = regexr(Scaste_oth, "^F.*$", "Fakir")
replace Scaste_oth = "Fakir" if Scaste_oth == "Jalali faqeer"

replace Scaste_oth = "Gwaria" if Scaste_oth == "GAVARIYA"
replace Scaste_oth = "Gwaria" if Scaste_oth == "Gavaria"

replace Scaste_oth = "Gurjar" if Scaste_oth == "GUJJAR"
replace Scaste_oth = regexr(Scaste_oth, "^Guj.*$", "Gurjar")
replace Scaste_oth = regexr(Scaste_oth, "^Gur.*$", "Gurjar")

replace Scaste_oth = regexr(Scaste_oth, "^Gad.*$", "Gadaria")
replace Scaste_oth = "Gadaria" if Scaste_oth == "Gdriya"

replace Scaste_oth = "Don't know" if Scaste_oth == "Garib"

replace Scaste_oth = "Gawala" if Scaste_oth == "Ghawala"

replace Scaste_oth = "Jat" if Scaste_oth == "GULIA"

replace Scaste_oth = "Jogi" if Scaste_oth == "Giri"
replace Scaste_oth = "Jogi" if Scaste_oth == "Gogi"
replace Scaste_oth = regexr(Scaste_oth, "^JO.*$", "Jogi")

replace Scaste_oth = "Sunar" if Scaste_oth == "Goldsmith"

replace Scaste_oth = "Gond" if Scaste_oth == "Good"

replace Scaste_oth = regexr(Scaste_oth, "^Gos.*$", "Gosai")
replace Scaste_oth = "Gosai" if Scaste_oth == "Gusai"

replace Scaste_oth = "Jhinwar" if Scaste_oth == "Gemer"
replace Scaste_oth = "Jhinwar" if Scaste_oth == "Ghimmer"

replace Scaste_oth = "Heer" if Scaste_oth == "HEAR"

replace Scaste_oth = "Don't know" if Scaste_oth == "HKhori"

replace Scaste_oth = "Don't have any caste in my religion" if Scaste_oth == "Hansari"

replace Scaste_oth = "SC" if Scaste_oth == "Harijan"

replace Scaste_oth = "Heri" if Scaste_oth == "Hedi"
replace Scaste_oth = "Heri" if Scaste_oth == "Heddi"
replace Scaste_oth = "Heri" if Scaste_oth == "Herhi"
replace Scaste_oth = "Heri" if Scaste_oth == "Heedi"

replace Scaste_oth = "Don't have any caste in my religion" if Scaste_oth == "Islam"
replace Scaste_oth = "Don't have any caste in my religion" if Scaste_oth == "Khaan"
replace Scaste_oth = "Don't have any caste in my religion" if Scaste_oth == "Khatun"

replace Scaste_oth = regexr(Scaste_oth, "^Jat.*$", "Jat")
replace Scaste_oth = regexr(Scaste_oth, "^JA.*$", "Jat")
replace Scaste_oth = "Jat" if Scaste_oth == "Jaat"
replace Scaste_oth = "Jat" if Scaste_oth == "Jaglan"
replace Scaste_oth = "Jat" if Scaste_oth == "Nandal"

replace Scaste_oth = "OBC" if Scaste_oth == "Jaiswal"

replace Scaste_oth = regexr(Scaste_oth, "^Je.*$", "Jhinwar")
replace Scaste_oth = regexr(Scaste_oth, "^Jhi.*$", "Jhinwar")
replace Scaste_oth = regexr(Scaste_oth, "^Jhe.*$", "Jhinwar")
replace Scaste_oth = regexr(Scaste_oth, "^Ji.*$", "Jhinwar")
replace Scaste_oth = "Jhinwar" if Scaste_oth == "Jhuver"
replace Scaste_oth = "Jhinwar" if Scaste_oth == "Juhver"

replace Scaste_oth = regexr(Scaste_oth, "^Jul.*$", "Julaha")
replace Scaste_oth = "Julaha" if Scaste_oth == "Jhulay"
replace Scaste_oth = "Julaha" if Scaste_oth == "Jolay"

replace Scaste_oth = "Jogi" if Scaste_oth == "Johi"
replace Scaste_oth = "Jogi" if Scaste_oth == "Joogi"
replace Scaste_oth = "Jogi" if Scaste_oth == "Jyogi"
replace Scaste_oth = regexr(Scaste_oth, "^Jog.*$", "Jogi")

replace Scaste_oth = "Don't know" if Scaste_oth == "K"
replace Scaste_oth = "Don't know" if Scaste_oth == "Langada"

replace Scaste_oth = regexr(Scaste_oth, "^KAS.*$", "Kashyap")
replace Scaste_oth = regexr(Scaste_oth, "^Kar.*$", "Kashyap")
replace Scaste_oth = regexr(Scaste_oth, "^Kas.*$", "Kashyap")
replace Scaste_oth = "Kashyap" if Scaste_oth == "Kshyap"

replace Scaste_oth = regexr(Scaste_oth, "^KHA.*$", "Khati")
replace Scaste_oth = regexr(Scaste_oth, "^Khat.*$", "Khati")
replace Scaste_oth = "Khati" if Scaste_oth == "Kati"
replace Scaste_oth = "Khati" if Scaste_oth == "Khaati"
replace Scaste_oth = "Khati" if Scaste_oth == "Khadi"
replace Scaste_oth = "Khati" if Scaste_oth == "Khaatti"

replace Scaste_oth = "Kurmi" if Scaste_oth == "KHURMI"

replace Scaste_oth = "Kumhar" if Scaste_oth == "KUMHAR"
replace Scaste_oth = regexr(Scaste_oth, "^Khu.*$", "Kumhar")
replace Scaste_oth = regexr(Scaste_oth, "^Kuh.*$", "Kumhar")
replace Scaste_oth = regexr(Scaste_oth, "^Kum.*$", "Kumhar")
replace Scaste_oth = "Kumhar" if Scaste_oth == "Khumar"

replace Scaste_oth = regexr(Scaste_oth, "^Kab.*$", "Kabirpanthi")

replace Scaste_oth = "Don't know" if Scaste_oth == "Kalal"
replace Scaste_oth = "Don't know" if Scaste_oth == "Kaposi"
replace Scaste_oth = "Don't know" if Scaste_oth == "Karnal"
replace Scaste_oth = "Don't know" if Scaste_oth == "Kewat"
replace Scaste_oth = "Don't know" if Scaste_oth == "MANJAA"
replace Scaste_oth = "Don't know" if Scaste_oth == "Maanji"
replace Scaste_oth = "Don't know" if Scaste_oth == "Mahtav"
replace Scaste_oth = "Don't know" if Scaste_oth == "Mandal"
replace Scaste_oth = "Don't know" if Scaste_oth == "Manji"
replace Scaste_oth = "Don't know" if Scaste_oth == "Modok"
replace Scaste_oth = "Don't know" if Scaste_oth == "Nepali"
replace Scaste_oth = "Don't know" if Scaste_oth == "Nike rajput"
replace Scaste_oth = "Don't know" if Scaste_oth == "Nonia"
replace Scaste_oth = "Don't know" if Scaste_oth == "Noniya"
replace Scaste_oth = "Don't know" if Scaste_oth == "Pahadi"
replace Scaste_oth = "Don't know" if Scaste_oth == "Pandey"
replace Scaste_oth = "Don't know" if Scaste_oth == "Pod"
replace Scaste_oth = "Don't know" if Scaste_oth == "Parbiya"
replace Scaste_oth = "Don't know" if Scaste_oth == "Patel"

replace Scaste_oth = regexr(Scaste_oth, "^Kam.*$", "Kamboj")

replace Scaste_oth = "Kanjar" if Scaste_oth == "Khanjad"

replace Scaste_oth = regexr(Scaste_oth, "^Koh.*$", "Koli")
replace Scaste_oth = regexr(Scaste_oth, "^Koi.*$", "Koli")
replace Scaste_oth = regexr(Scaste_oth, "^Ko.*$", "Koli")
replace Scaste_oth = "Koli" if Scaste_oth == "Kholi"

replace Scaste_oth = regexr(Scaste_oth, "^Kur.*$", "Kurmi")
replace Scaste_oth = "Kurmi" if Scaste_oth == "Kudmi"

replace Scaste_oth = regexr(Scaste_oth, "^Kus.*$", "BC")

replace Scaste_oth = "Lodha" if Scaste_oth == "LODHA"
replace Scaste_oth = regexr(Scaste_oth, "^Lod.*$", "Lodha")

replace Scaste_oth = "Lilgar" if Scaste_oth == "Leelgar"
replace Scaste_oth = "Lilgar" if Scaste_oth == "Lil ger"

replace Scaste_oth = regexr(Scaste_oth, "^Loh.*$", "Lohar")
replace Scaste_oth = regexr(Scaste_oth, "^Lu.*$", "Lohar")

replace Scaste_oth = "Saini" if Scaste_oth == "MALI"
replace Scaste_oth = "Saini" if Scaste_oth == "Maali"
replace Scaste_oth = "Saini" if Scaste_oth == "Male"
replace Scaste_oth = "Saini" if Scaste_oth == "Mali"

replace Scaste_oth = "Mehra" if Scaste_oth == "MEHRA"
replace Scaste_oth = "Mehra" if Scaste_oth == "Mahra"
replace Scaste_oth = "Mehra" if Scaste_oth == "Nehra"

replace Scaste_oth = "Manihar" if Scaste_oth == "MNIHAR"
replace Scaste_oth = regexr(Scaste_oth, "^Mani.*$", "Manihar")

replace Scaste_oth = "Jat" if Scaste_oth == "MULEJAAT"
replace Scaste_oth = "Jat" if Scaste_oth == "Mulle jaat"
replace Scaste_oth = "Jat" if Scaste_oth == "Mulee"

replace Scaste_oth = "Muslim" if Scaste_oth == "MUSLIM"
replace Scaste_oth = "Muslim" if Scaste_oth == "MUSLMAN"
replace Scaste_oth = regexr(Scaste_oth, "^Mus.*$", "Muslim")
replace Scaste_oth = "Don't know" if Scaste_oth == "Mansoori"
replace Scaste_oth = regexr(Scaste_oth, "^Mom.*$", "Muslim")
replace Scaste_oth = regexr(Scaste_oth, "^Mult.*$", "Muslim")

replace Scaste_oth = regexr(Scaste_oth, "^Mal.*$", "Mallah")

replace Scaste_oth = "Mirasi" if Scaste_oth == "Marasi"
replace Scaste_oth = "Mirasi" if Scaste_oth == "Mirashi"

replace Scaste_oth = "Nai" if Scaste_oth == "Naai"
replace Scaste_oth = "Nai" if Scaste_oth == "Naayi"
replace Scaste_oth = "Nai" if Scaste_oth == "Nae"
replace Scaste_oth = "Nai" if Scaste_oth == "Nahi"
replace Scaste_oth = "Nai" if Scaste_oth == "Naie"
replace Scaste_oth = "Nai" if Scaste_oth == "Nhi"

replace Scaste_oth = regexr(Scaste_oth, "^Nat.*$", "Nat")
replace Scaste_oth = "Nat" if Scaste_oth == "Nt"

replace Scaste_oth = "Nilgar" if Scaste_oth == "Neelgar"

replace Scaste_oth = regexr(Scaste_oth, "^O.*$", "Od")

replace Scaste_oth = "SC" if Scaste_oth == "PASSVAN"
replace Scaste_oth = "SC" if Scaste_oth == "Paasmaan"
replace Scaste_oth = regexr(Scaste_oth, "^Pas.*$", "SC")

replace Scaste_oth = regexr(Scaste_oth, "^Parj.*$", "Prajapati")
replace Scaste_oth = regexr(Scaste_oth, "^Pr.*$", "Prajapati")
replace Scaste_oth = "Prajapati" if Scaste_oth == "Perjapat"

replace Scaste_oth = "Pasi" if Scaste_oth == "Paashi"
replace Scaste_oth = "Pasi" if Scaste_oth == "Peshi"
replace Scaste_oth = "Pasi" if Scaste_oth == "Phadi"
replace Scaste_oth = "Pasi" if Scaste_oth == "Parshuram paasi"

replace Scaste_oth = "General" if Scaste_oth == "Pandit"
replace Scaste_oth = "Pherera" if Scaste_oth == "Peahar"
replace Scaste_oth = "Penja" if Scaste_oth == "Pejord"
replace Scaste_oth = "Penja" if Scaste_oth == "Pejrad"
replace Scaste_oth = "Perna" if Scaste_oth == "Perveen"

replace Scaste_oth = regexr(Scaste_oth, "^Pu.*$", "Don't know")
replace Scaste_oth = regexr(Scaste_oth, "^Pot.*$", "Kumhar")

replace Scaste_oth = "Mallah" if Scaste_oth == "Rajkot mahlla"
replace Scaste_oth = "Rajput" if Scaste_oth == "Rajpoot"
replace Scaste_oth = "Raigar" if Scaste_oth == "Rangarh"
replace Scaste_oth = "Rahbari" if Scaste_oth == "Rebari"
replace Scaste_oth = "Ror" if Scaste_oth == "Rod(oad)"

replace Scaste_oth = "ST" if Scaste_oth == "S t"
replace Scaste_oth = "Saini" if Scaste_oth == "SAINI"
replace Scaste_oth = "Sapera" if Scaste_oth == "SAPERA"
replace Scaste_oth = "Shiekh" if Scaste_oth == "SEAKH"
replace Scaste_oth = "Sapera" if Scaste_oth == "SPERA"
replace Scaste_oth = "Sadh" if Scaste_oth == "Saadh"
replace Scaste_oth = "Sadh" if Scaste_oth == "Saadh swami"
replace Scaste_oth = "Don't know" if Scaste_oth == "Safi"
replace Scaste_oth = "Don't know" if Scaste_oth == "Sahsi"
replace Scaste_oth = "Don't know" if Scaste_oth == "Saifi"
replace Scaste_oth = "Saini" if Scaste_oth == "Sainik"
replace Scaste_oth = "Don't have any caste in my religion" if Scaste_oth == "Saiyyad"
replace Scaste_oth = regexr(Scaste_oth, "^Sak.*$", "Sakka")
replace Scaste_oth = "Sain" if Scaste_oth == "Sami"
replace Scaste_oth = "Sain" if Scaste_oth == "Sani"
replace Scaste_oth = "Sapera" if Scaste_oth == "Sapele"
replace Scaste_oth = "Sapera" if Scaste_oth == "Sapley"
replace Scaste_oth = "Sapera" if Scaste_oth == "Sapra"
replace Scaste_oth = "Swami" if Scaste_oth == "Sawami"
replace Scaste_oth = "Saini" if Scaste_oth == "Saymi"
replace Scaste_oth = "Shiekh" if Scaste_oth == "Seakh"
replace Scaste_oth = "Don't know" if Scaste_oth == "Sehfi"
replace Scaste_oth = "Shiekh" if Scaste_oth == "Sekh"
replace Scaste_oth = "Sakka" if Scaste_oth == "Sekke"
replace Scaste_oth = "Don't know" if Scaste_oth == "Seme"
replace Scaste_oth = "Don't know" if Scaste_oth == "Shah"
replace Scaste_oth = "Don't know" if Scaste_oth == "Shaah"
replace Scaste_oth = "Shiekh" if Scaste_oth == "Shakh"
replace Scaste_oth = "Sakke" if Scaste_oth == "Shakke"
replace Scaste_oth = "Muslim" if Scaste_oth == "Shame"
replace Scaste_oth = "Muslim" if Scaste_oth == "Shami"
replace Scaste_oth = "Muslim" if Scaste_oth == "Shani"
replace Scaste_oth = "General" if Scaste_oth == "Sharma"
replace Scaste_oth = "Shiekh" if Scaste_oth == "Shek"
replace Scaste_oth = "Shiekh" if Scaste_oth == "Shekh"
replace Scaste_oth = "Shiekh" if Scaste_oth == "Sheksidhiki"
replace Scaste_oth = "Jat" if Scaste_oth == "Sherawat"
replace Scaste_oth = "Muslim" if Scaste_oth == "Shiame"
replace Scaste_oth = "Sakka" if Scaste_oth == "Shke"
replace Scaste_oth = "Don't know" if Scaste_oth == "Shri bhass"
replace Scaste_oth = "Muslim" if Scaste_oth == "Shyami"
replace Scaste_oth = "Sikligar" if Scaste_oth == "Sigligr"
replace Scaste_oth = "Sakka" if Scaste_oth == "Sikhaa"
replace Scaste_oth = "Sakka" if Scaste_oth == "Sikka"
replace Scaste_oth = "Sikligar" if Scaste_oth == "Sikli gar"
replace Scaste_oth = "Sikligar" if Scaste_oth == "Sikliger"
replace Scaste_oth = "Sirkiband" if Scaste_oth == "Sirkibaunnd"
replace Scaste_oth = "Sakka" if Scaste_oth == "Skay"
replace Scaste_oth = "Don't know" if Scaste_oth == "Solanki"
replace Scaste_oth = "Don't know" if Scaste_oth == "Sorsi"
replace Scaste_oth = "ST" if Scaste_oth == "St"
replace Scaste_oth = "Sunar" if Scaste_oth == "Sunahr"
replace Scaste_oth = "Sunar" if Scaste_oth == "Sunhar"
replace Scaste_oth = "Swami" if Scaste_oth == "Swaml"
replace Scaste_oth = "Shiekh" if Scaste_oth == "Sekh muslim"
replace Scaste_oth = "Don't know" if Scaste_oth == "Shiami"
replace Scaste_oth = "Sakka" if Scaste_oth == "Sakke"

replace Scaste_oth = "Kashyap" if Scaste_oth == "TKarshap"
replace Scaste_oth = "Tyagi" if Scaste_oth == "Taga"
replace Scaste_oth = "Teli" if Scaste_oth == "Taile"
replace Scaste_oth = "Darzi" if Scaste_oth == "Tailor"
replace Scaste_oth = "Don't know" if Scaste_oth == "Tantrik"
replace Scaste_oth = "Don't know" if Scaste_oth == "Tatwa"
replace Scaste_oth = "Tyagi" if Scaste_oth == "Taygi"
replace Scaste_oth = regexr(Scaste_oth, "^Te.*$", "Teli")
replace Scaste_oth = "Don't know" if Scaste_oth == "Thakur"
replace Scaste_oth = "Don't know" if Scaste_oth == "Thapa"
replace Scaste_oth = "Don't know" if Scaste_oth == "Umbey"

replace Scaste_oth = regexr(Scaste_oth, "^Ya.*$", "Yadav")
replace Scaste_oth = "Yadav" if Scaste_oth == "YADAV"

replace Scaste_oth = regexr(Scaste_oth, "^Zi.*$", "Jhinwar")

replace Scaste_oth = "Backward Class" if Scaste_oth == "BC"
replace Scaste_oth = "Darzi" if Scaste_oth == "Darji"
replace Scaste_oth = "Don't know" if Scaste_oth == "Dass"

replace Scaste_oth = "BCA" if Scaste_oth == "Abbase"
replace Scaste_oth = "SC" if Scaste_oth == "Ad Dharmi"
replace Scaste_oth = "BCB" if Scaste_oth == "Ahir"
replace Scaste_oth = "OBC" if Scaste_oth == "Ansari"
replace Scaste_oth = "Don't know" if Scaste_oth == "Backward Class"
replace Scaste_oth = "BCA" if Scaste_oth == "Badi"
replace Scaste_oth = "SC" if Scaste_oth == "Bagadi"
replace Scaste_oth = "SC" if Scaste_oth == "Baheliya"
replace Scaste_oth = "BCA" if Scaste_oth == "Bairagi"
replace Scaste_oth = "SC" if Scaste_oth == "Balmiki"
replace Scaste_oth = "OBC" if Scaste_oth == "Bangad"
replace Scaste_oth = "SC" if Scaste_oth == "Bangali"
replace Scaste_oth = "General" if Scaste_oth == "Baniya"
replace Scaste_oth = "BCA" if Scaste_oth == "Banjara"
replace Scaste_oth = "BCA" if Scaste_oth == "Barai"
replace Scaste_oth = "SC" if Scaste_oth == "Bawariya"
replace Scaste_oth = "SC" if Scaste_oth == "Bazigar"
replace Scaste_oth = "BCA" if Scaste_oth == "Bharbhuja"
replace Scaste_oth = "General" if Scaste_oth == "Bhardwaj"
replace Scaste_oth = "BCA" if Scaste_oth == "Bhat"
replace Scaste_oth = "General" if Scaste_oth == "Bhatiya"
replace Scaste_oth = "General" if Scaste_oth == "Brahmin"
replace Scaste_oth = "General" if Scaste_oth == "Byas"
replace Scaste_oth = "SC" if Scaste_oth == "Chamar"
replace Scaste_oth = "OBC" if Scaste_oth == "Chauhan"
replace Scaste_oth = "SC" if Scaste_oth == "Chhipi"
replace Scaste_oth = "General" if Scaste_oth == "Chopra"
replace Scaste_oth = "OBC" if Scaste_oth == "Chowdry"
replace Scaste_oth = "General" if Scaste_oth == "Chorasiya"
replace Scaste_oth = "SC" if Scaste_oth == "Chure"
replace Scaste_oth = "BCA" if Scaste_oth == "Dakaut"
replace Scaste_oth = "SC" if Scaste_oth == "Dangi"
replace Scaste_oth = "BCA" if Scaste_oth == "Darzi"
replace Scaste_oth = "General" if Scaste_oth == "Dass"
replace Scaste_oth = "SC" if Scaste_oth == "Dhanak"
replace Scaste_oth = "SC" if Scaste_oth == "Dheha"
replace Scaste_oth = "BCA" if Scaste_oth == "Dhimar"
replace Scaste_oth = "BCA" if Scaste_oth == "Dhobi"
replace Scaste_oth = "SC" if Scaste_oth == "Dhuniya"
replace Scaste_oth = "SC" if Scaste_oth == "Doom"
replace Scaste_oth = "SC" if Scaste_oth == "Dusad"
replace Scaste_oth = "BCA" if Scaste_oth == "Fakir"
replace Scaste_oth = "BCA" if Scaste_oth == "Gadaria"
replace Scaste_oth = "BCA" if Scaste_oth == "Gawala"
replace Scaste_oth = "SC" if Scaste_oth == "Gond"
replace Scaste_oth = "Don't know" if Scaste_oth == "Gosai"
replace Scaste_oth = "General" if Scaste_oth == "Gupta"
replace Scaste_oth = "BCB" if Scaste_oth == "Gurjar"
replace Scaste_oth = "BCA" if Scaste_oth == "Gwaria"
replace Scaste_oth = "OBC" if Scaste_oth == "Heer"
replace Scaste_oth = "BC" if Scaste_oth == "Heri"
replace Scaste_oth = "BCA" if Scaste_oth == "Jangra"
replace Scaste_oth = "OBC" if Scaste_oth == "Jat"
replace Scaste_oth = "BCA" if Scaste_oth == "Jhinwar"
replace Scaste_oth = "BCA" if Scaste_oth == "Jogi"
replace Scaste_oth = "SC" if Scaste_oth == "Julaha"
replace Scaste_oth = "BCA" if Scaste_oth == "Jog"
replace Scaste_oth = "SC" if Scaste_oth == "Kabirpanthi"
replace Scaste_oth = "BCA" if Scaste_oth == "Kamboj"
replace Scaste_oth = "BCA" if Scaste_oth == "Kanjar"
replace Scaste_oth = "BCA" if Scaste_oth == "Kashyap"
replace Scaste_oth = "BCA" if Scaste_oth == "Khati"
replace Scaste_oth = "SC" if Scaste_oth == "Koli"
replace Scaste_oth = "BCA" if Scaste_oth == "Kumhar"
replace Scaste_oth = "BCA" if Scaste_oth == "Kurmi"
replace Scaste_oth = "BCA" if Scaste_oth == "Lilgar"
replace Scaste_oth = "BCB" if Scaste_oth == "Lodha"
replace Scaste_oth = "BCA" if Scaste_oth == "Lohar"
replace Scaste_oth = "BCA" if Scaste_oth == "Mallah"
replace Scaste_oth = "BCA" if Scaste_oth == "Manihar"
replace Scaste_oth = "BCA" if Scaste_oth == "Mehra"
replace Scaste_oth = "BCA" if Scaste_oth == "Mirasi"
replace Scaste_oth = "BCA" if Scaste_oth == "Nai"
replace Scaste_oth = "BCA" if Scaste_oth == "Nat"
replace Scaste_oth = "BCA" if Scaste_oth == "Nilgar"
replace Scaste_oth = "SC" if Scaste_oth == "Od"
replace Scaste_oth = "BCA" if Scaste_oth == "Panchal"
replace Scaste_oth = "SC" if Scaste_oth == "Pasi"
replace Scaste_oth = "BCA" if Scaste_oth == "Penja"
replace Scaste_oth = "SC" if Scaste_oth == "Perna"
replace Scaste_oth = "SC" if Scaste_oth == "Pherera"
replace Scaste_oth = "BCA" if Scaste_oth == "Prajapati"
replace Scaste_oth = "BCA" if Scaste_oth == "Rahbari"
replace Scaste_oth = "SC" if Scaste_oth == "Raigar"
replace Scaste_oth = "BCA" if Scaste_oth == "Rajbhar"
replace Scaste_oth = "BCA" if Scaste_oth == "Rajput"
replace Scaste_oth = "BCA" if Scaste_oth == "Rohila"
replace Scaste_oth = "OBC" if Scaste_oth == "Ror"
replace Scaste_oth = "BCA" if Scaste_oth == "Sadh"
replace Scaste_oth = "BCA" if Scaste_oth == "Sain"
replace Scaste_oth = "BCB" if Scaste_oth == "Saini"
replace Scaste_oth = "BCA" if Scaste_oth == "Sakka"
replace Scaste_oth = "SC" if Scaste_oth == "Sansi"
replace Scaste_oth = "SC" if Scaste_oth == "Sapera"
replace Scaste_oth = "BCA" if Scaste_oth == "Shiekh"
replace Scaste_oth = "Don't have any caste division in my religion" if Scaste_oth == "Sikh"
replace Scaste_oth = "Don't have any caste division in my religion" if Scaste_oth == "Muslim"
replace Scaste_oth = "Don't have any caste division in my religion" if Scaste_oth == "Don't have any caste in my religion"
replace Scaste_oth = "SC" if Scaste_oth == "Sikligar"
replace Scaste_oth = "SC" if Scaste_oth == "Sirkiband"
replace Scaste_oth = "BCA" if Scaste_oth == "Sunar"
replace Scaste_oth = "BCA" if Scaste_oth == "Swami"
replace Scaste_oth = "BCA" if Scaste_oth == "Teli"
replace Scaste_oth = "OBC" if Scaste_oth == "Tyagi"
replace Scaste_oth = "BCB" if Scaste_oth == "Yadav"
replace Scaste_oth = "Don't know" if Scaste_oth == "BC"

**Correcting Scaste variable**
replace Scaste = 20 if Scaste == 1
replace Scaste = 21 if Scaste == 2
replace Scaste = 23 if Scaste == 3
replace Scaste = 23 if Scaste == 4
replace Scaste = 21 if Scaste == 5
replace Scaste = 21 if Scaste == 6
replace Scaste = 20 if Scaste == 7
replace Scaste = 22 if Scaste == 8
replace Scaste = 20 if Scaste == 9
replace Scaste = 22 if Scaste == 10
replace Scaste = 22 if Scaste == 11
replace Scaste = 22 if Scaste == 12
replace Scaste = 22 if Scaste == 13
replace Scaste = 22 if Scaste == 14
replace Scaste = 16 if Scaste == 15

replace Scaste = 22 if Scaste_oth == "BCA"
replace Scaste_oth = ".s" if Scaste_oth == "BCA"
replace Scaste = 23 if Scaste_oth == "BCB"
replace Scaste_oth = ".s" if Scaste_oth == "BCB"
replace Scaste = 19 if Scaste_oth == "Don't have any caste division in my religion"
replace Scaste_oth = ".s" if Scaste_oth == "Don't have any caste division in my religion"
replace Scaste = 18 if Scaste_oth == "Don't know"
replace Scaste_oth = ".s" if Scaste_oth == "Don't know"
replace Scaste = 16 if Scaste_oth == "SC"
replace Scaste_oth = ".s" if Scaste_oth == "SC"
replace Scaste = 17 if Scaste_oth == "ST"
replace Scaste_oth = ".s" if Scaste_oth == "ST"
replace Scaste = 21 if Scaste_oth == "General"
replace Scaste_oth = ".s" if Scaste_oth == "General"
