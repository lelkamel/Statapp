********************************************************************************
*	 Project: Breakthrough (BT)
*
*	 Purpose: Codifying the 'other' responses 
********************************************************************************

	
/* OUTLINE
1. Importing the intermediate dataset
2. Cleaning up the 'other' responses
3. Saving the intermediate dataset
*/	
	
* ======================================================================== *
* --- 1. Importing de-identified endline 2 student dataset            ---- *
* ======================================================================== *
	

* ======================================================================== *
* ---         2. Cleaning up the 'other' responses                    ---- *
* ======================================================================== *

** I. college_course_want_other 

	#delimit ; 
	
	 replace college_course_want = .d 
	 if inlist(college_course_want_other,"10th pass hone ke bad soche ga student",
	 "ABHI NHI SOCHA","ABHI SOCHA NAHI HAI","Abhi clz k bare me nahi pta",
	 "Abhi kuch socha nhi h","Abhi nahi socha h iss bare me","Abhi nhi socha",
	 "Abhi socha nhi h","Abhi sohcha nhi");
	 
	 replace college_course_want = .d 
	 if inlist(college_course_want_other,"Abi sccha nhi","Don't know",
	 "Socha NHI hai","Socha nhi h abi kuch bi","abbi socha nhi h",
	 "bacha ni abi kuch ni socha","socha nhi h","Koi bhi course nhi krna 12 ke bad pta nhi pdungi ya nhi") ; 
	 
	 replace college_course_want = .d 
	 if inlist(college_course_want_other,"Graduation kerne h pr abi stream decide nhi h.",
	 "Open school se 12th class complete krni hai","Open school se 10th class padhne ki soch Raha hu",
	 "9th me admission lega","11,class m study ke k rahi H.") ; 
	 
	  replace college_course_want = 1
	 if inlist(college_course_want_other,"B TECH","B Tech","B tack","B teack",
	 "B tech","B-TECH","B.E.T   E.C.H") ; 
	 
	 replace college_course_want = 1
	 if inlist(college_course_want_other,"B.TECH","B.Tec","B.tech","M tak") ; 
	 
	 replace college_course_want = 1 
	 if inlist(college_course_want_other,"I.I.T","IIT") ; // is a college offering engineering courses in India
	 
	 replace college_course_want = 2 
	 if inlist(college_course_want_other,"L.l.b","LLB","LLB COURSE","LLB krna chatti h","Law",
	 "Llb") ; 
	 
	 replace college_course_want = 3
	 if inlist(college_course_want_other,"DOCTOR COURSE","Doctor course",
	 "M.B.B.S","MBBS","MBBS COURSE","Neet","Neet exam for Mbbs k admission k liya.",
	 "Neet ka course") ; 
	 
	 replace college_course_want = 3
	 if inlist(college_course_want_other,"Net","B Farma","B PHARMACY",
	 "B farmancy","D PHARMACY") ; 
	 
	 replace college_course_want = 5 
	 if inlist(college_course_want_other,"CA", "CA ka course","Accountant","Acuting") ; 
	 
	 replace college_course_want = 6 
	 if inlist(college_course_want_other,"Ba k bad civil seva ka exam",
	 "Ba k bad civil seva ka exam clear","Integrated MA",
	 "M A","M.A","M.A. KARNE KI SOCH RHA HUN","M.A. ki pdai krna chahte h") ; 
	 
	 replace college_course_want = 6 
	 if inlist(college_course_want_other,"Ma","Master of art","MA",
	 "M.A B.ed","MA or B.ed","Pol. Science","political course") ; // putting MA B.Ed. options here as to even be eligible for a B.Ed. you first need to have an undergrad degree.
	  
	 replace college_course_want = 7 
	 if inlist(college_course_want_other,"B.sc","B.SC NURSING","Narsing","BSC",
	 "M s c math se","M.S.C","M.SC","M.Sc") ; 
	 
	 replace college_course_want = 7 
	 if inlist(college_course_want_other,"MSC","MSc maths","Msc","msc") ; 
	 
	 replace college_course_want = 8 
	 if inlist(college_course_want_other,"M.com","Mcom") ;
	
	 replace college_course_want = 11 
	 if inlist(college_course_want_other, "AIR FORCE", "AIR FORCE COURSE", 
	  "ARMEY","ARMY","ARMY COACHING","ARMY KE LIYE COACHING LENA CHATA HU",
	  "Academy me Jana chahta h", "Air force", "Air force ki coaching") ;
	  
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"Air force ki coaching Lena chata hun",
	 "Airforce","Airforce COACHING","Airforce ka","Amry","Aramy","Army","Army Ki tyari",
	 "Army Mai jana chahuga") ; 
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"Army coachimg","Army join","Army join karni h",
	 "Army join se realted","Army k liye","Army k liye tyari","Army k tyari","Army k tyari kre ge 12th k bad",
	 "Army ki coaching Lena chahta h") ;
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"Army ki coaching Lena chata h","Army ki job ke lye coaching",
	 "Army ki padai krna chahti h","Army ki tayari","Army ki tayari krna chata hu","Army ki tyari",
	 "Army m Jana chahuga","Army m bhrti ki tyari");
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"Army m jana chahta hu","Army m jana chahuga",
	 "Army m job krna pasand kruga","Army me","Army me Jana Chahta","Army me Jana chahta h",
	 "Army me Jana chahta hu","Army me Jana h","Army me Shamil hone ki soch rahe h") ;
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"Army officer","Army training lens k soch hai",
	 "Army ki tyari  krna chahta hu","Army me Shamil hone ki soch rhe h","Coaching of police",
	 "Coaching police ki","Coching police","Delhi police coaching");
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"Haryana Police","Haryana police","Haryana police ki coaching layni h",
	 "Haryana police ki tayari Krna chate h","Haryana police ki tyari krni h","Haryana police ko tayari",
	 "Indian Army Mai job","Indan  navy") ; 
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"N C C","N D A","N.D.A","NCC" ,"NCC CERTIFICATE",
	 "NCC CORS","NCC COURSE","NDA","NDA  ka course") ; 
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"NEAVE","Navi","Navy","Ncc course",
	 "Nda course..","POLICE","Polic","POLICE OFFICER","Police") ; 
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"Police Mai lgna chahti h","Police banane k liye",
	 "Police bnne k liye","Police coaching","Police departments","Police departments me",
	 "Police ke liye coaching","Police ki","Police ki job karna chahta hain") ; 
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"Police ki job ke liye coching leni ha","Police ki study  u.p.s ki teyari",
	 "Police ki study,","Police ki tyari krni h","Police m jane ki socha h",
	 "Police me Jana chahti hai","Police officer") ; 
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"Police officer banane ki study..","Police officer banne k liye",
	 "Police or Fhoj ki service karna chaht..","Police or army ke liye padna chahti h","Polish",
	 "Polish m") ; 
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"Preparation for Army job.","Pulish","RAILWAY POLICE",
	 "S police","STUDENT AIR FORCE ME SHAMIL HONE KI S..","Sena Mai job","Sena m jana chahte h",
	 "Sena me bharti hona Chahta h") ; 
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"Shida foj m laguga","Student army me Jane ki soch rha hai",
	 "Student army me shamil hona chahata h","Student army me shamil hona chahta h","Student army me shamil hone ki soch r..",
	 "StudentArmy me Shamil hone ki soch rh..","Sub inspector") ; 
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"army ki coching","baccha army mha jana ki soch rha ha",
	 "haryana police","police","police banna chati hu","police officer ki tyari","pulesh affshar",
	 "pulic koching") ; 
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"pulice course","pulses m bhrti hona  chah ti hu",
	 "sina m saamil honi vali kors","student army me shamil hone soch rha h","12 ke bad army coching",
	 "COACHING LENA CHATA HU ARMY K LIYE","COACHING LENA CHATA HU ARMY ki job K ..",
	 "COACHING LENA CHATE H HARYANA POLICE","Coaching H  police.") ; 
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"Coaching for Army","Coaching for Haryana police",
	 "Foji bn na h foji ki job krni h", "PULISH","Police or Fhoj ki service karna chaht..",
	 "SENA ME BRETI HONA KI SOCH H","Sana me sameil hona ki soch rhe h","fouj me jana chahte h") ; 
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"Student army me shamil hone ki soch rha h",
	 "StudentArmy me Shamil hone ki soch rha h","Police or Fhoj ki service karna chahta hun",
	 "COACHING LENA CHATA HU ARMY ki job K LIYE","STUDENT AIR FORCE ME SHAMIL HONE KI SOCH RHA H",
	 "10th & 12th is sufficient for preparation for recruitment of Army") ; 
	 
	 replace college_course_want = 11 
	 if inlist(college_course_want_other,"Police ki job karna  chataa hai",
	 "Police ki job karna chataa hai","police line") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"ART  AND CRAFT OR beautiparlour","ART AND CRAFT",
	 "Ac repairing","BEAUTY  PARLER","BEAUTY PARLER","Beauti parlar","Beauti parlour",
	 "Beautician","Beauties") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"Beaution","Beautiparlour","Beauty  paler",
	 "Beauty Palar","Beauty Parlor","Beauty Parlour","Beauty and wellness",
	 "Beauty parler") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"Beauty parler or silai bunai","Beauty parlor course",
	 "Beauty parlour","Beauty parlour ka course","Beauty parlour or salayi ka","Beauty parlour.") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"Buti parler","Butiosin","Butition","Buty parlour",
	 "CAMUTOR","COMPUTER","COMPUTER COARSE","COMPUTER CORSE","COMPUTER COURSE") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"COMUTAR","COMUTAR KA","Camputer","Commputar kors",
	 "Computar sikhungi","Computer","Computer  corse","Computer  course") ; 
	
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"Computer Course","Computer Course Diploma",
	 "Computer Diploma","Computer Tiper","Computer and silayi ka course","Computer coarse",
	 "Computer coourse","Computer corash","Computer corce") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"Computer cores","Computer corse",
	 "Computer coruse","Computer cource","Computer cours","Computer course",
	 "Computer course krna") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"Computer courses","Computer couse",
	 "Computer diploma","Computer information  technology","Computer ka",
	 "Computer ka Course","Computer ka Courses","Computer ka course") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"Computer me telly","Computer software",
	 "Computer telly ACCOUNT","Computir","Cutting tailring","Parlar","Drawing",
	 "Drawing Course","Drawing coures") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"Drawing ka course.","Drawing teacher",
	 "Droing","Drowning course","Drowning ka course Karn chati h",
	 "Dwring master ka diploma","Electreation","Electrician","Electronic Course") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"Mobile Reapering ka kaam","Mobile reparing",
	 "Poltacnikal","Poltanic","Poltechnical","Polytechnic","Polytechnic ka course",
	 "Polytechnic krna chahta hu","Polytechnice") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"SIELAI","SILAI BUNAI","Salayi  ka Kam",
	 "Salayi  ka course","Salayi ka Kam","Salayi ka course","Salayi ka kam",
	 "stiching","sticthing") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"stitching","tailoring","palar or silay",
	 "polytechnic","silai","silai bunai","silai bunai or paler","silai kadai",
	 "silay") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"beautipalar","beautiparlour ka course",
	 "beauty palar","beauty parlor","beauty parlour","butey palr","buty parlour",
	 "butyparler") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"computer","computer Course","computer coruse",
	 "computer cours","computer course","computer diploma","computer ka kors",
	 "computers") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"bautician","FINE ART, DRING COURSE",
	 "Pyrotechnic","Sewing machine operator","Shilaai course","Silaai machine",
	 "Silaai masin","Silai") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"Silai  bunai","Silai bs","Silai bunai",
	 "Silai bunai or parler","Silai hi bs","Silai machine","Silai sikhegi,silai center se",
	 "Stitching,butyparlor but ITI me nhi karna") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"Silayi","Silayi and beauty parlour",
	 "Silayi course","Silayi ka course","Sillayi course","Steno","Steno course",
	 "Student  Silai or Kadai Sikhna chat a h kisi k ghar pr") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"Stiching","Stitching","beautician",
	 "Gher pe silai","Computer curse","Tailor","Tailoring") ; 
	 
	 replace college_course_want = 12 
	 if inlist(college_course_want_other,"Tailring","Textile","Tourism",
	 "Tursima" ) ; 
	 
	 replace college_course_want = 13 
	 if inlist(college_course_want_other,"J B T","J BT","J b t","J,B,T",
	 "J,B,t","J. B. T","J.B. T","J.B.T","J.B.T course Krna chahte h") ; 
	 
	 replace college_course_want = 13 
	 if inlist(college_course_want_other,"J.B.T ka course","J.B.T.",
	 "J.b t","J.b.t","JBT","JBT  COURSE","JBT COURSE","JBT TEACHER") ; 
	 
	 replace college_course_want = 13 
	 if inlist(college_course_want_other,"JBT TEACHING","JBT Teachers",
	 "JBT cores","JBT course","JBT teaching course","JBT.",
	 "JBt","Jbt","Jbt course") ; 
	 
	 replace college_course_want = 13 
	 if inlist(college_course_want_other,"Teacher","Teacher ka course",
	 "Teacher ka course kr chahti hai","Teacher ka course krna h",
	 "Teachers","Teaching","Teaching JBT","Teaching corss") ; 
	 
	 replace college_course_want = 13 
	 if inlist(college_course_want_other,"Teaching course","Teaching ka",
	 "Teachir","Tercher","TEACHER","TECHER","TGT Teacher","j b t cors ni pta kiya krna h") ; 
	 
	 replace college_course_want = 13 
	 if inlist(college_course_want_other,"j.b.t","jbt","jbt teacher","teacher",
	 "teacher (jbt)","teacher coures","teachers","teaching","techar") ; 
      
	 replace college_course_want = 13 
	 if inlist(college_course_want_other,"Diploma","Diploma in eduction  (jbt)",
	 "Diploma in fair brigade","Firbirged","Fire Brigade ka course","diploma it") ; 
	 
	 replace college_course_want = 13 
	 if inlist(college_course_want_other,"D .ed","D E D","D.Ed","D.ed",
	 "D E D course...."); 
                                   
	 replace college_course_want = 14 
	 if inlist(college_course_want_other,"I A S","I A S KE TAYARI","I P S officer",
	 "I.P.S OFFICER","I.P.S ki tyari","IAS","IPS","IPS Officer","Upsc ya other exam ki tyari k liye coaching lega.") ; 
	 
	 replace college_course_want = 14 
	 if inlist(college_course_want_other,"IPS ka course","UPSC","UPSC  CURSE",
	 "UPSC KI TAYARI","UPSC SENA M JANA CHAHTE THE","UPSC Sena ki tyari",
	 "UPSC coaching") ; 
	 
	 replace college_course_want = 14 
	 if inlist(college_course_want_other,"UPSC/ SSC coaching","Upsc","Upsc ,NDA",
	 "Upsc ki coaching","Upsc ya other exam ki tyari k liye coaching lega",
	 "I p s banna chati h corse pta nahi kiya karna h","Ips") ; 
	 
	 replace college_course_want = 14
	 if inlist(college_course_want_other, "Coaching SSC","Coaching luga 12th k bad hssc ki",
	 "Coaching luga SSC ki","HSSC ki chocking","Hsc Coaching.","Hscc coaching",
	 "Hssc ki coaching","Hssc ki koching lena chahti hai") ; 
	 
	 replace college_course_want = 14
	 if inlist(college_course_want_other,"Hssc or ssc ki coaching Lena chahuga",
	 "S s c","S.S c","S.S.C","S.S.C  Coching","S.S.C Choching",
	 "S.S.C Coching","Ssc") ; 
	 
	 replace college_course_want = 14
	 if inlist(college_course_want_other,"SSC","SSC COACHING","SSC Coaching",
	 "SSC KI COACHING","SSS ki coaching Lena chahta h","coching s.s.c",
	 "COching sse") ; 
	 
	 replace college_course_want = 14
	 if inlist(college_course_want_other,"GOVERMENT job","GOVERNMENT JOB",
	 "GOVERNMENT job","Goverment  job","Goverment job","Government job",
	 "Government jobs ki cocingh","Govt job ki tayari","Govt jobs Coaching") ; 
	 
	 replace college_course_want = 14
	 if inlist(college_course_want_other,
	 "student ne  government job ke liye  coaching lene ki sochi hai",
	 "Coaching for any govt job","Coaching for govt job.",
	 "Government job ke liye coaching Lena chahta h") ; 
	 
	 replace college_course_want = 15 
	 if inlist(college_course_want_other,"Factions disdain ka coruse",
	 "Fashion  designer","Fashion Dijayan","Fashion design",
	 "Fashion designer","Fashion designer k","Fashion designer.",
	 "Fashion designing","Fashion diziner") ; 
	 
	 replace college_course_want = 15 
	 if inlist(college_course_want_other,"Fastion dezinar","Fastoin  dezine",
	 "Feasion diginer","Festion desaening","fashion designer","Fusion designer") ; 
	 
	  replace college_course_want = 16 
	 if inlist(college_course_want_other,"staf marsh g n m","A N M","A.N.M",
	 "A.N.M ka Course","ANM","ANM COURSE","ANM course","Anm","Anm course") ; 
	 
	 replace college_course_want = 16 
	 if inlist(college_course_want_other,"G N M","G n m","G n.m","G.N.M",
	 "GANM","GNM","GNM  ka course","GNM COURSE") ; 
	 
	 replace college_course_want = 16 
	 if inlist(college_course_want_other,"Gnm","Gnm  course","Gnm course",
	 "a n m ya g n m","g n m nursing","anm","MPHW") ; 
	 
	 replace college_course_want = 17
	 if inlist(college_course_want_other,"B E D","B,ED","B. ed.","B.A.D",
	 "B.ED","B.Ed") ; 
	 
	 replace college_course_want = 17
	 if inlist(college_course_want_other,"B.ed","B.ed in maths","BA BeD (new 4years)",
	 "BABED(NEW)","BAD","b-ed","b.ed") ; 
	 
	 replace college_course_want = 18
	 if inlist(college_course_want_other,"B C A","B.C.A","BCA","BCA Coress","Bca",
	 "Mca") ; 
	 
	 replace college_course_want = 19
	 if inlist(college_course_want_other,"B B A","BBA","MBA","M.A   OR  B.B.A",
	 "B.B.A","MBA.") ;  
	 
/*For some cases, eventhough students had reported 'yes' in
"Do you plan to go to college etc.? (1) ", they had reported "not wanting to do any course", "not study"
in the question "what course do you want to pursue in college?" for such students
we are changing their responses as a "no" to (1). 
Decision taken with Tarun on 11.06.2019. */	 
	 
	 replace plan_college = 0 
	 if inlist(college_course_want_other,"12th","12th tk padna ha",
	 "Age m padhi nahi krnay chati hu","Badai nhi krni","KUCH NAHI",
	 "Koi course nhi krna","Koi course nhi krna h","Koi sa bhi course nhi krna") ; 
	 
	 replace college_course_want = . 
	 if inlist(college_course_want_other,"12th","12th tk padna ha",
	 "Age m padhi nahi krnay chati hu","Badai nhi krni","KUCH NAHI",
	 "Koi course nhi krna","Koi course nhi krna h","Koi sa bhi course nhi krna") ; 
	 
	 replace plan_college = 0 
	 if inlist(college_course_want_other,"Kuch nhi krna",
	 "Koi sa bhi nhi mujhe 12 k bad pdai nhi krni","Nhi krna chahta","Nhi krna chati",
	 "Pdai nhi krni","Pdai nhi krni koi course nhi krna","Pedhai nhi krni",
	 "Phadi nhi karne");
	 
	 replace college_course_want = .
	 if inlist(college_course_want_other, "Kuch nhi krna",
	 "Koi sa bhi nhi mujhe 12 k bad pdai nhi krni","Nhi krna chahta","Nhi krna chati",
	 "Pdai nhi krni","Pdai nhi krni koi course nhi krna","Pedhai nhi krni",
	 "Phadi nhi karne") ; 
	 
	 replace plan_college = 0 
	 if inlist(college_course_want_other,"Pdai nhi krni h kyu ji ghar m peso ki kami h",
	 "koi bhi corse nahi krna h","student ko pdai he ni krni hai","Student ko course Krna nhi chata",
	 "Study nhi krni","Muja krna ni course","KON SA BE  NE  STUDENT 12TH  CLASS TAK PHADNA CHATA H") ; 
	 
	 replace college_course_want = . 
	 if inlist(college_course_want_other, "Pdai nhi krni h kyu ji ghar m peso ki kami h",
	 "koi bhi corse nahi krna h","student ko pdai he ni krni hai", "Student ko course Krna nhi chata",
	 "Study nhi krni","Muja krna ni course","KON SA BE  NE  STUDENT 12TH  CLASS TAK PHADNA CHATA H") ; 
	 
	 replace college_course_want = .s if inlist(plan_college,0,.i,.s,.d,.r) ; 
	 
	 replace college_course_want = 20
	 if inlist(college_course_want_other, "Boxing","Game","Game Karen",
	 "Game ka","Judo course Coaching","KUSTI (AKHARA) ME",
	 "KUSTI KA KOCH WALA (NIS)", "Khalo me Jana Chata hu") ; 
	 
	 replace college_course_want = 20
	 if inlist(college_course_want_other,"Kirket khelungi","D.ped or NIS related to games",
	 "NIS","Sports","Sports ki tyari karega","Sports man","Sports me Jana chahti h",
	 "Bachcha khelo me Jana Chate h","student sports m Jana chahta  h") ;
	 
	 replace college_course_want = 20
	 if inlist(college_course_want_other,"Wresling Coching") ; 

	 replace college_course_want = 21
	 if inlist(college_course_want_other,"Anker(news ripoter)","General ism",
	 "Gernilism","Media and animation","Media ka") ; 
	
	#delimit cr 
	
	#delimit ; 
	
	label define college_course_want 
	1 "Engineering/B.Tech/M.Tech" // STEM course
	3 "Medicine/MBBS/Pharmacy" // STEM course
	6 "Bachelors of Arts/Masters of Arts"
    7 "Bachelors of Science/Masters of Science" // STEM course
    8 "Bachelor of Commerce/Masters of Commerce"
	11 "Army/Police/Navy/Airforce" // new category
	12 "Vocational courses (beauty,drawing,steno,computer,stitching etc.)" // new category
	13 "Diploma courses (JBT,D.Ed etc.)" // new category
	14 "Civil Services/SSC/Government Job" // new category
	15 "Fashion Designing" // new category
	16 "GNM/ANM/MPHW" // new category; GNM can be considered STEM if student is currently enrolled in science w/ or w/o math; discuss with PIs
/* 12.08.19: As per discussion with Tarun and Diva, GNM should be considered non-STEM */	
	17 "B.Ed." // new category 
	18 "BCA/MCA" // new category
	19 "BBA/MBA" // new category
	20 "Sports" // new category
	21 "Mass media and communication" // new category

	, add modify ; 
	
	#delimit cr 

** II. course_pursue_other	
	
	#delimit ;
	
	replace course_pursue = 3 
	if inlist(course_pursue_other,"Doctor") ; 
	
	replace course_pursue = 7 
	if inlist(course_pursue_other,"Computer science") ; 
	
	replace course_pursue = 12 
	if inlist(course_pursue_other,"Stitching","computer",
	"Computer","Computer ka ...","Computer course") ; 
	
	replace course_pursue = 13 
	if inlist(course_pursue_other,"FIRE SAFTI MAN RK INSTITUTE",
	"Poltecnik","Polytechnic","Polytechnic ka") ; 
	
	replace course_pursue = 15 
	if inlist(course_pursue_other,"fashion designer") ; 	
	
	#delimit cr
	
	label copy college_course_want course_pursue, replace 
	
** III. tuition_location_other

	#delimit ; 
	
	replace tuition_location = 1
	if inlist(tuition_location_other,"Ajaib me  Apne village Rohtak me",
	"Dusri colony m.","GHR hi h","Jha padhai krta hai vhi h",
	"Extra class me tuition lagte hai","SCHOOL KA ANDER XTRA CLASS H",
	"School me lagti h tuition class","school main tuition class lete h.") ; 
	
	replace tuition_location = 1
	if inlist(tuition_location_other,"Vpo. Dugal Disst . Sangrur Punjab",
	"bacha pahe nonad me rahta tha wahi","NEW DELHI","Basana village me",
	"Bhadurgarh rhte  the tution  class  jab lete  the",
	"Kaithal me .. mosi k gr jab raheti thi student.") ; 
	
	replace tuition_location = 2
	if inlist(tuition_location_other,"BHAINI BHARON me jati thi",
	"Basana me jate hai","Bohar","Chidana","Gohana","KHARAWAR me jate the",
	"MHAVEER COLONY","Bacha Apne village or other village me bhe tuition gaya tha") ; 
	
	replace tuition_location = 3
	if inlist(tuition_location_other,"kharkhoda") ;  
	
	replace tuition_location = 5 
	if inlist(tuition_location_other,"Dusre jile ke ganv me","Other district village",
	"Bhadurgarh tution class li thi","Bhiwani","Dist Bhiwani m",
	"Goyal classes Kathmandi ROHTAK") ;
	
	replace tuition_location = 5 
	if inlist(tuition_location_other,"Najafgarh Delhi","Nrela","REWARI me","VPO HAMIPUR") ; 
	
	replace tuition_location = 6 
	if inlist(tuition_location_other,"Punjab","Up village mai",
	"VILLAGE MOHRIYA DIST SITAPUR STATE UP") ; 
	
	/*
	above replacements are done verifying their home address and current address
	*/
	
	
	#delimit cr
	
	#delimit ; 
	
	label define tuition_location
	5 "In a different district"
	6 "In a different state" 
	, add modify ; 
	
	#delimit cr
	
** IV. age_first_child_other_dk

	recode age_first_child_dk (3 = 8) // recoding "others" category

	#delimit ; 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,"-999",".999",
	"999","ABHI KUCH SOCHA NHI H IS BARE ME","ABHI NHI PTA",
	"ABHI SOCHA NAHI HAI","Abhi Socha nahi","Abhi finial nahi h",
	"Abhi is bare me nhi socha") ; 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,
	"Abhi iske bare me nhi socha","Abhi kuch socha hi nahi","Abhi kuch socha nahi",
	"Abhi kuch socha nhi","Abhi kuch socha nhi h","Abhi nahi socha h iss bare me.",
	"Abhi socha nhi","Abhi socha nhi h","Abi is bare me socha nhi h") ; 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,"Abi socha nhi h",
	"Abi socha nhi h is bare me","Abi socha nhi h.","Abi soha nhi h",
	"About socha nhi h","An hi is bare me nhi socha","Avi Etna nhi socha h",
	"Avi socha nhi es bare me","Abhi is bare me socha nhi h"); 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,
	"pasta nhi","pat nhi","pata nhi","pats nhi","pta  nhi","pta nahi",
	"pta nhi","pts nhi") ; 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,
	"socha nhi h","student ka koi vichar nhi hai","unhone bola mujhe nhi pta kb hoga",
	"_999","abhi nhi socha","bacce n bola pta nahi","student  ko iske  bare me abi koi jankari nhi h.",
	"student ko is bara ma koi knowledge nahi h") ;
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,
	"PTA nhi", "PTA nhu","Pata  nahi","Pata nahe","Pata nahi",
	"Pata nhi","Pata ni","Patta nhi") ; 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,
	"Pta na","Pta nahi","Pta nhi","Pta nhi h","Pta nhi h kuch socha nhi h",
	"Pta ni","Ptaa nhi hai") ; 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,
	"Ptaa nhii","Socha nhi","Socha nhi Mane avi","Socha nhi es bare me avi",
	"Socha nhi h","Socha nhi h .","Socha nhi kbi","Socha nhii",
	"Pata nhi es bare me kbi Etna socha hi nhi") ; 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,
	"Student  na iska Baara m kuch nhi socha nhi h.","Don't",
	"Don't know","Don't no","Is baary m muj kuch pata nhi h",
	"Is bare me abi soacha nhi h.","Is bare me abi socha nhi h",
	"Is bare me nhi pta") ; 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,
	"Is bare me socha nhi h","Is bera me abi kuch socha nhi h",
	"Iske bare me Student ne socha nhi","Iss bare me Abhi nahi socha h",
	"Itna abhi sccha nhi","KUCH SOCHA NAHI","KYA PTA KAB HO") ; 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,
	"Kbi nhi socha h es bare me","Kuch PTA nahi","Kuch socha nhi h Mene Abhi is bare m",
	"Muj is baary m abi kuch pata nhi h","Muj nhi  pta","Muj nhi pta",
	"Muje abhi hi pta") ; 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,
	"Muje nhi pta","Muje nhi pta eske bare me","Mujhe nhi pta es bare me",
	"Mujhe ni pta","Nahi pta","Nhi pta muj avi kuch g socha nhi avi tk",
	"Nhi socha avi") ; 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,
	"Bacha bol rha h ke mujhe pta he nhi","MUJE NHI PTA",
	"MUJE NHI PTA KB HOGA","PTA NHI","PTA NHI BOLA",
	"Pta nhi muj","STUDENT NE PTA NHI BOLA") ; 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,
	"Sachs nhi h","Student ka koi  vichar nhi hai","Student ko is bare m ni pta",
	"Student ko jankari nhi  ha","Student ko jankari nhi ha","Student ne abi socha ni h",
	"Student ke iske bare me abi koi jankari nhi h.","Student ko Abi is baraa ma koi knowledge nahi h",
	"Student ko is bara ma koi knowledge nahi h") ; 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,
	"Student ko iske bare me abi koi jankari nhi h.","Student ko iske bare me abi koi jankari nhi h",
	"Student ko knowledge nahi h Abi is bara ma","Student ko pta ni","Student na kha ki knowledge nahi h..",
	"Student ko iska liya koi knowledge nahi h...","Student ne is bara m kuch socha nhai h") ; 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other, "don't know",
	"iske bare me nhi socha hai abhi.","Avi nhi socha, me avi bhut choti hu",
	"Bacha bol rha h ke nhi pta kab ho bacha..","Bache ko iske bare  me koi jankari nhi h.",
	"No reason specified by child","Student ny bola abi itni age nhi usi k according pata nhi h is baary m",
	"Student ny bola muj abi is baary m abi kuch bhi pata nhi h") ; 
	
	replace age_first_child_dk = -999 if inlist(age_first_child_other,"Wese he bol dya. .muje ni pta",
	"bacce n bola muje ni pta","bacha ko is bara ma koi knowledge nahi h") ; 
	
	replace age_first_child_dk = -998 if inlist(age_first_child_other,"-998",
	"BTANA NHI CHAHTII","Bacha btana nahi chata","Bacha btana nahi chataa",
	"Bache ne jwab nhi diya.","Jvab dene se mna kiya","Jvab nhi diya",
	"Jwab dne se mna kr dya") ; 
	
	replace age_first_child_dk = -998 if inlist(age_first_child_other,
	"Koi jwab nhi diya","Student btaane se mnaa kr rha h.","_998") ; 
	
	replace age_first_child_dk = 2 if inlist(age_first_child_other,
	 "Jb sasuraal waala boolega tb.") ; 
	
	replace age_first_child_dk = 3 if inlist(age_first_child_other,
	"Jab tak pdhai Puri na ho","Padhi k badd","Phaly padie pura karna chaty h",
	"Padie Puri hony k baad shaadi krni h us k baad bacha k baary m sochu gi",
	"Pehle study complete ho jaye phir dekgenge","ABHI PDH RHI HU",
	"Abhi pdai karni h") ; 
	
	replace age_first_child_dk = 4 if inlist(age_first_child_other,
	"Acha karobar set ho Jane ke bad","Government jobs ka bad",
	"Govt jab lagna ka 2 years ka bad","Govt job ka bad",
	"JOB AFTER MARRIAGE","Jab tak government job nhi milegi","Job") ; 
	
	replace age_first_child_dk = 4 if inlist(age_first_child_other,
	"Job Milne k bad schege","Job Milne ke bad","Job k Baad Shaadi",
	"Job k badd","Job ka time nahi pata esliye","Job lagne k bad shadi hogi tab soche ge",
	"Job milane ke baad","Job milane ke baad","Job milne k bad") ; 
	
	replace age_first_child_dk = 4 if inlist(age_first_child_other,
	"Nokri k bad Shadi ke 2 saal bad","Nokri lgane k Baad","Nokri lgane k Baad Shaadi",
	"job Milne k bad soche ge","Avi nhi socha es bare me,jb jb job mil jayegi uske bad hi .",
	"Job lagny k baad shaadi krni h us k baad bacho k baary m sochu gy","Nohkri milne k bd jb shaddi hogi jb decide krege",
	"Nokri lgane k Baad Shaadi hogi to pta nhi","Nhi socha es bare me abi Mane, phele job phr sochugi es bare me") ; 
	
	replace age_first_child_dk = 5 if inlist(age_first_child_other,
	"Baccha shaddi he ni krna chta","Kyuki Me shadi krna nhi chahta",
	"M e shadi nhi lena chati","Me sadi Hi nhi krugi","Respondent Merrige nhi krvana chahti",
	"STUDENT SHADI NE KAVANA CHATA","Sadhi nhi krni") ; 
	
	replace age_first_child_dk = 5 if inlist(age_first_child_other,
	"Sadhu nhi Krna chata","Samjh nhi h bachi ko","Shaadi nhi krni",
	"Shadi nahe karni muje","Shadi nhi Karna chata","Shadi nhi krna chahti",
	"Shadi ni krna chate","Wo shaadi karna nhi chaati","mujhe shaadi hi ni krni") ; 
	
	replace age_first_child_dk = 5 if inlist(age_first_child_other,
	"mujhe shadi hi nhi krni","sadhi nahi karni  h",
	"Student ne bola ki usko shaadi hi nahi karni") ; 
	
	replace age_first_child_dk = 6 if inlist(age_first_child_other,
	"Abhi kya pta kb shadi ho","Jatin is unsure of getting married",
	"Kya pata kab sadi hoge","PTA NHI KB SHADI HO KB BACCHE HO",
	"Pata nahi shaadi kab hogi","Pay nib kb shadi ho",
	"Pta  nhi k kb sadhi ho gi") ; 
	
	replace age_first_child_dk = 6 if inlist(age_first_child_other,
	"Pta nhi kb shadi ho","Pta nhi kb shadi hogi gi","Pta nhi shadi ho ya nhi",
	"Sadi ka hi nhi PTA hogi ke nhi","pta nhi kb sadi ho tb bacha ho",
	"Bacha bol rha h ke kya pta Sadi ho ya nhi ho","Shadi ke bare kuch nhi socha hai na h..",
	"Shadi ke bare me nhi socha","He is not sure whether he will ever get married") ; 
	
	replace age_first_child_dk = 6 if inlist(age_first_child_other,
	"Shadi ke bare kuch nhi socha hai na hi bache ke bare m kuch socha hai",
	"student ki shadi ke koi vichar nhi hai","Shaddi hone k bd he dkhege",
	"Student ne shadi ke bare me socha nhi h","Vo to shadi hone ke bad hi pta chalega abi to kya pta") ; 
	
	replace age_first_child_dk = 7 if inlist(age_first_child_other,
	"Uncomfortable","student ke anti ke samne nhi bataya","Parents sarh ma tha",
	"Parents sath m tha","Parents sath tha","Uncomfortable hua bachaa mummy thi pass main ..",
	"Bacha k papa batha tha sath m") ; 
	
	
	#delimit cr

	
	#delimit ; 
	
	label define age_first_child_dk
	
	-999 "Don't know" // new category
	-998 "Refuse" // new category
	  3 "Have to complete school/college first" // new category
      4 "Have to get a job first" // new category
      5 "I do not want to marry" // new category
	  6 "Unsure as to when/if they will marry" // new category
	  7 "Uncomfortable in answering infront of parents/relatives or generally" // new category
	  8 "Others, specify" 
	  
	, add modify ; 
	
	#delimit cr
	
	replace age_first_child_dk = .d if age_first_child_dk == -999
	replace age_first_child_dk = .r if age_first_child_dk == -998
	
/*
For the students below - they reported age at which they want their first child 
as "after 2 years of marriage etc." For them we will first check if they 
have answered var marry_age_want and can consequently calculate their var age_first_child

		child_id		age_first_child_other   				marry_age_want 
1.      4218037			Saadi k 2 saal baad						After getting a job -> can't calculate
2. 		2315181			Shadi k ek saal  baad     		 			.r  			-> can't calculate
3.      3104022			Shadi ke one year ke bad 				After getting a job -> can't calculate
4. 		2417009			Jab bi shadi hogi uske 2 ya 3 sal bad		23 				-> can calculate
*/	


** V. action_harassed_how_other

	#delimit ; 
	
	replace action_harassed_how_2 = 1 if inlist(action_harassed_how_other,
	"Aisa karne ke liye mana kiya tha","Apne dost ko smjaya","Smjaya ki ladai nahi krte",
	"Ladki Ko roka ki ladai mat kro","Lacking ko mna keya","Ladayi my kro ye knha") ; 
	
	gen action_harassed_how_4 = 1 if inlist(action_harassed_how_other,"Father se bhi bola",
	"Unke Parents ko bataya","Unke ghar walon ko bataya","apni family ko btaya",
	"apne parent ko btaya .","Student ny un k mummy aur Papa sy ja kr baat ki",
	"TOU KE LADKE KO BATAYA HE","boy k bade bhai ko") ; 
	
	gen action_harassed_how_5 = 1 if inlist(action_harassed_how_other,
	"Galat kaam karne Wale ladke ki pitayi ki","Ladka ko thapad mara",
	"Ladke ko jakr mara","Maraa","Or mene pitai bhi ki.","Student ne boys ko jakar slap mara.",
	"ladke ki pitai kri","Un ladko ki dusre ladke bula kar petaye karva de the mane",
	"Us k sath ladai kri or uske Baal khich liye or smjhaya ki aise nahi karte") ; 
	
	replace action_harassed_how_5 = 1 if inlist(action_harassed_how_other,
	"Class ek bache ke saath milkar Mane  usko mara","ladai kari  bacche n bhi ladko s jaa kar ladai kri thi") ; 
	
	gen action_harassed_how_6 = 1 if inlist(action_harassed_how_other,"Dino Ko mnaa Kiya ki my kro",
	"Dono ke beech me compromise karwa diya","Dono me compromise karwa dete hai") ; 
	
	replace action_harassed_how = "-998" if inlist(action_harassed_how_other,"Nahi btaya") ; 
	
	#delimit cr 
	
	label var action_harassed_how_1 "How did you intervene - Complained to teacher/principal"
	label var action_harassed_how_2 "How did you intervene - Confronted the perpetrator"
	label var action_harassed_how_3 "How did you intervene - Others"
	label var action_harassed_how_4 "How did you intervene - Complained to their (or perpetrator's) parents/relatives" // new category
	label var action_harassed_how_5 "How did you intervene - Fought with the perpetrator" // new category
	label var action_harassed_how_6 "How did you intervene - Explained both the parties" // new category
	
	order(action_harassed_how_?), after(action_harassed_how)

	forvalues x = 4/6 {
	replace action_harassed_how_`x' = .s if action_harassed != 1
	replace action_harassed_how_`x' = 0 if action_harassed_how_`x' == . 
	label values action_harassed_how_`x' yesno
	
}

** VI. school_dropout_other

	#delimit ;

	replace school_dropout_1 = 1 if inlist(school_dropout_reason_other,
	"Bacha ko school pasend nahi tha") ; 
	
	replace school_dropout_3 = 1 if inlist(school_dropout_reason_other,
	"Mummy Ne mana KR diya tha") ; 
	
	replace school_dropout_4 = 1 if inlist(school_dropout_reason_other,
	"Time pe Kapde Dhone  or Paani ki  Suvisha Na hone wjh se") ; 
	
	replace school_dropout_6 = 1 if inlist(school_dropout_reason_other,
	"School me Art side thi student ko medical Side chiye thi",
	"School me pdhai nhi krwai jati thi") ; 
	
	replace school_dropout_8 = 1 if inlist(school_dropout_reason_other,
	"Mummy ki tbiyat khrab rhti thi","Mumy Papa ki death ho gai thi",
	"Mummy ka operation hua tha ghar ka kaam nahi hota tha mummy se",
	"PAPA ki death ho chuki hai","Papa ka accedent ho gya tha",
	"Student k father ki death Ho gyi thi is leya school chod deya") ; 
	
	replace school_dropout_9 = 1 if inlist(school_dropout_reason_other,
	"Marriage ho gyi thi",
	"Sadhi ho gye thi . Pregnant thi to aane Jane ki problem thi",
	"Student ki sadhi ho gyi h","Student ki sagai ho gai h.",
	"Student ki sgai ho gyi h") ;
	
	replace school_dropout_10 = 1 if inlist(school_dropout_reason_other,
	"Student ko chot lag gai thi .","accident hogya tha",
	"Bache ka accident ho gya tha","Bacche ko daure padte hai",
	"Accident ho gaya tha tang me read dali hui h",
	"Child k girne ki wjh se uske hath m facture ho gya tha jiske Karan paper nhi diye the"
	"Lagh tut gya tha") ; 

	replace school_dropout_12 = 1 if inlist(school_dropout_reason_other,
	"10 class m campartmant aagya tha","10 class m re aa gay te",
	"10th me Compartment aa gyi thi","10th me re Aa gayi thi",
	"2 me Compartment Aa gyi thi","2 pepar me compart agyi thi",
	"2pepar me compart agyi thi","4 subject me Fell ho gyi thi") ; 
	
	replace school_dropout_12 = 1 if inlist(school_dropout_reason_other,
	"9th m compartment","Bacha Ko kampart as Gaya tha",
	"Bacha Ko kampart many Aya ha","Bacha ki 10m compartment aya gi thi",
	"Bachhe ki compartment aa gayi thi","Bachhe ki compartment ayi h",
	"COMPART AHH GYE THE","Camparment") ; 
	
	replace school_dropout_12 = 1 if inlist(school_dropout_reason_other,
	"Child ki compartment aagi gai thi","Comparment",
	"Compartment Aa Gyi thi 10th me","Compartment Aa gyi",
	"Compartment Aa gyi thi","Compartment Aa. Gyi thi",
	"Compartment aa gya tha","Compartment aa gya tha 10th me") ; 
	
	replace school_dropout_12 = 1 if inlist(school_dropout_reason_other,
	"Compartment aagi thi","Compartment aane se","Compartment aayi hui h",
	"Compartment ayi h","Compartment ayi hui h","Compartment ayi hui thi.",
	"Compartment k Karn","Compartment nhi Tut paye")  ; 

	replace school_dropout_12 = 1 if inlist(school_dropout_reason_other,
	"Compartment aa Gaye thi is liye chod diya h",
	"Compartment aa Gaye thi is liye chod diya",
	"student campartmant aagyi thi","student ki 10th me campartment aa gai",
	"do papar m fal ho gi thi","campartmant aa gyi thi",
	"campartmant aane k karan") ; 
	
	replace school_dropout_12 = 1 if inlist(school_dropout_reason_other,
	"compartment aa gayi thi","Supply aa gyi thi","RE AAYI HUI HAI",
	"REE AHH GYE  THE","Re","Ree ane k Karan school chod Diya tha",
	"DO PAPER M REE AHH GYE","Do subjects me compartment aai hai") ; 
	
	replace school_dropout_12 = 1 if inlist(school_dropout_reason_other,
	"student ki 10th me campartment aa gai thi",
	"campartmant aa gyi thi is ley school jana chood deya",
	"Ek subject M re aa gyi tha","English ,Social study me Re Aa gai",
	"Fail hone PR school walo ne naam nhi likha.",
	"Student ka 2 subject ma compartment h",
	"Student ki 10 me compartment thi",
	"12 class me cmpat aha gaye thi to 10th k bess p iti kar rha h studant lakin ab studant ne 12th b complit kar li h") ; 
	
	replace school_dropout_14 = 1 if inlist(school_dropout_reason_other,
	"Mummy ka Nam Galt tha es liye admission nhi huaa",
	"Principal n mna kr diya","School walo ne admission ni diya",
	"Student ki eye m problem thi aur absent hone ki wajah se naam kaat diya",
	"Student ne chuti Li thi village me Jane k liya late ho gya tha aane me village se but application nahi di thi so name cut kardiya.",
	"school ki techar n hi name kaat diya tha  Class 7 pass thi class 8 m admission lena tha to barth satisfied nahi tha is liye") ; 
	
	gen school_dropout_16 = 1 if inlist(school_dropout_reason_other,
	"10 th ke bad ITI karne ke liye","10th class k bad iti kar rha h bacha",
	"10th k baad polytechnic kr rha h","10th k bad ITI kar rha h",
	"10th k bad iti kar rha h studant","Bacha I.T.I kar rha hai.",
	"Bacha ITI kr rha h","Bacha ITI krna chahta tha") ; 
	
	replace school_dropout_16 = 1 if inlist(school_dropout_reason_other,
	"Bacha ITI me jata h","Bacha polytechnic ka diploma kr raha h",
	"Bache ka Pol me admission ho gya tha","Bache ko ITI ka course karna tha",
	"Bache ko ITI me admission Lena tha","Bache ne ITI karni thi","ITI",
	"ITI  ME JATE HA") ; 
	
	replace school_dropout_16 = 1 if inlist(school_dropout_reason_other,
	"10th K BAD ITI KARNA CHAHTA THA ISLIYE SCHOOL CHHODAA THA",
	"10th k bad iti kar rha h studant 11 me admissn liya to tha lakin naam ctva diya tha studant ne apna",
	"BACHHE NE 10TH KE BAD POLYTECHNIC ME ADDMISSION LE LIYA H",
	"Bacha ITI krna chahta tha es liye school chod diya.",
	"Bache ne 10 th class ke bad Polytechnic me addmision le Liya",
	"Bache ne 10 th ke bad ITI me admission le liya",
	"Child marchent nevy  ka course karne ke liye") ; 
	
	replace school_dropout_16 = 1 if inlist(school_dropout_reason_other,
	"Child ne 11th krke paletenic m admition le liya h", 
	"Collage me addmission le liya h 10th k bad",
	"ITI  KARNA CHATA THA ISLIYE SCHOOL CHHODA",
	"ITI KAR RYA H STUDENT","ITI KARNI THI FORM APPLY KIYA THA",
	"ITI MADINA","ITI ME ADMISSION LE LIYA H","ITI ME ADMISSION LE LIYA THA") ; 
	
	replace school_dropout_16 = 1 if inlist(school_dropout_reason_other,
	"ITI karni thi","ITI karni thi isliye school choad Dia","ITI karta h",
	"ITI krni thi to school choad Dia 10th k bad","ITI me jata h",
	"Iti","Iti complete kar li","Lab technician ka course") ; 

	replace school_dropout_16 = 1 if inlist(school_dropout_reason_other,
	"Ladka iti karta h","Polticnik me dakhila le liya tha","Polytechnic",
	"Polytechnic karta","Polytechnic me ADMISSION LE LIYA tha",
	"STUDENT ITI KARTA HAI","STUDENT ITI karta hai","Student I.T.I Kr rha h") ; 
	
	replace school_dropout_16 = 1 if inlist(school_dropout_reason_other,
	"STUDENT AAGE KI PADAI KE LIYE ITI ME JATA H",
	"Student 10th ka baad polytechnic kr raha h",
	"Student ITI  may hai","Student ITI Kr Rha h",
	"Student ITI M JATA HAI","Student ITI karta h",
	"Student ITI karta hain","Student ITI kartha hai") ;
	
	replace school_dropout_16 = 1 if inlist(school_dropout_reason_other,
	"Student ITI ker rha h","Student ITI krta h","Student iti Karta hai",
	"Student iti kar rha h","Student iti karna chahta tha","Student iti kr rha h",
	"Student ki ruchi ncc mai thi is leya baad m nhi kar saktaa tha kyoki age jyada Ho jaa ti") ; 
	
	replace school_dropout_16 = 1 if inlist(school_dropout_reason_other,
	"Student ko 10th ke baad iTi krni thi","Student n ITI m addmission le liya tha",
	"Student n ITI m addmission liya tha","Student ne ITI m Admission le liya tha",
	"Student polytechnic karta hai. ","student ITI krna chata tha",
	"student poltecnic me jata h","Student ko 10th tk he pdai krni thi. ...uske bd iTi") ; 
	
	replace school_dropout_16 = 1 if inlist(school_dropout_reason_other,
	"Student ne polytechnic  m admission Le liye tha.",
	"Student ne polytechnic m Admission le Liya tha",
	"Student ne polytecnic m admission le liya tha",
	"Bade bhai ne bola tha 10th ke baad iti krne ko",
	"Farmacy ka course karne laga tha",
	"Khud ki iccha thi ki 10th k Baad iti karein") ;

	gen school_dropout_17 = 1 if inlist(school_dropout_reason_other,
	"Teacher ke saath ladaye ho gye the","Teacher ke sath Ladai Ho gye thi",
	"Teacher ke sath Jhagda hone ki wajah se","madam n student ko pit diya tha",
	"Teacher na student ko mara tha...",
	"Students and teachers k sath quarrel ho gya tha or unke sath banti nhi thi",
	"Teachar Ka Sath Ladi Hogi thi Islya School Chod Dyia Tha",
	"Master ji Tang karte the",
	"Moreover the teacher used to harass mentally & physically.") ;
	
	replace school_dropout_17 = 1 if inlist(school_dropout_reason_other,
	"Teachers ka behavior thick nahi tha student k with") ; 
	
	gen school_dropout_18 = 1 if inlist(school_dropout_reason_other,
	"student n 10 paas kr  li","10th sy aa gay school nhi tha village..",
	"GOVERNMENT SCHOOL only 10 class tak hi tha..or school door h village se.",
	"Gao m  10th tak school tha paas kar liya aage   koi class ni thi   is liye ni padi",
	"School 10th class tak tha") ; 
	
	gen school_dropout_19 = 1 if inlist(school_dropout_reason_other,
	"10 class me student paper me nakl karta pakda gya  isliye 1 saal ka case ha next year student  admission  legi",
	"Student ka case ban gya tha nakal krte waqt",
	"Student paper dete thime juthi nakal  m p kda gya tha esliye uska result nhi aaya tha to padhna chod diya",
	"Yeh bachaa exam ke smay nakal krte hue pkda Gaya hai ..isliye exam walo ne ek sall ki pdai pr ban lga diya hai..") ; 
	
	gen school_dropout_20 = 1 if inlist(school_dropout_reason_other,
	"Family ne gr shift kar liya. ",
	"Gao se chale aaye the Panipat me es liye school chod diya",
	"Ghar Swift ker rheh Mumbai me",
	"Student Pariwar  ke sath kahin aur chla gya tha",
	"family na shift kr liya") ; 
	
	gen school_dropout_21 = 1 if inlist(school_dropout_reason_other,
	"Game karne k liye school chod diya aur ab 11th me admisan le ga",
	"Kabaddi khelne ki vajha se school chhod diya",
	"Playing....Khel m chala gya tha student Punjab m") ; 
	
	gen school_dropout_22 = 1 if inlist(school_dropout_reason_other,
	"BHED BHAV KE KARAN","Behed bhav k kaaran") ; 
	
	#delimit cr 

	lab var school_dropout_1 "Why did you dropout - I do not like studying" 
	lab var school_dropout_2 "Why did you dropout - Financial problem" 
	lab var school_dropout_3 "Why did you dropout - Family members do not approve" 
	lab var school_dropout_4 "Why did you dropout - Required for household work" 
	lab var school_dropout_5 "Why did you dropout - Required for work on farm/family business" 
	lab var school_dropout_6 "Why did you dropout - Poor quality and lack of facilities for education" 
	lab var school_dropout_7 "Why did you dropout - Not safe to send boys/girls" 
	lab var school_dropout_8 "Why did you dropout - Illness or death of family member" 
	lab var school_dropout_9 "Why did you dropout - I have gotten married" 
	lab var school_dropout_10 "Why did you dropout - Student fell sick/met with an accident" // included met with an accident 
	lab var school_dropout_11 "Why did you dropout - School is/was far away" 
	lab var school_dropout_12 "Why did you dropout - Student failed" 
	lab var school_dropout_13 "Why did you dropout - Student could not concentrate on studies/weak in studies" 
	lab var school_dropout_14 "Why did you dropout - School cancelled registration" 
	lab var school_dropout_15 "Why did you dropout - Other reason, specify" 
	lab var school_dropout_16 "Why did you dropout - Pursuing some other course" // new 
	lab var school_dropout_17 "Why did you dropout - Quarrel with the teacher/Harassment by the teacher" // new 
	lab var school_dropout_18 "Why did you dropout - School only till 10th" // new 
	lab var school_dropout_19 "Why did you dropout - Student caught cheating" // new
	lab var school_dropout_20 "Why did you dropout - Family shifted" // new 
	lab var school_dropout_21 "Why did you dropout - Student plays sports" // new 
	lab var school_dropout_22 "Why did you dropout - Due to gender discrimination" // new 
	lab var school_dropout__999 "Why did you dropout - Don't know" 
	lab var school_dropout__998 "Why did you dropout - Refuse" 
	
	order(school_dropout_?) (school_dropout_1?) (school_dropout_2?), after(school_dropout)
	
	forvalues x = 16/22 {
	replace school_dropout_`x' = .s if enrol_status != 1 | (enrol_status == 1 & survey_type == 2) 
	replace school_dropout_`x' = 0 if school_dropout_`x' == . 
	label values school_dropout_`x' yesno
	
}

** VII. alone_where_other

	#delimit ; 
	
	replace alone_where_1 = 1 if inlist(alone_where_other,"Pathshala m") ; 
	
	replace alone_where_2 = 1 if inlist(alone_where_other,"Bank","Bank Mai Gaya tha",
	"Bank m gayi thi","Bank mai","Bank me","Bank me gaya tha","Bank me gya hu",
	"Bank me gya tha") ; 
	
	replace alone_where_2 = 1 if inlist(alone_where_other,"Bank me paise jma karwane k liye matanhail gya tha",
	"bank","bank main","bank me","bank me gyi thi","DAKH GHAR","Dawai layny gayi thi",
	"Doctor") ; 
	
	replace alone_where_2 = 1 if inlist(alone_where_other,"Doctor K paas","Doctor K pass gaye the",
	"Doctor k pass","Doctor k pass .","Doctor k pass dwayi lany gayi thi",
	"Doctor ke paas","Doctor se dawai lane") ; 
	
	replace alone_where_2 = 1 if inlist(alone_where_other,"doctor ke paas","hospital m gyi h",
	"Hospital","Hospital gye the","Hospital..","PAN CARD bnvane","Post office,Bank.") ; 
	
	replace alone_where_2 = 1 if inlist(alone_where_other,"Rohtak gha tha dwai lana","Rohtak dc office may",
	"Daily home chores","Ghar ke kaamo ke liye","Gas slender lene.","Home chores se related work",
	"Home work","Home chores","Health insurance ka papers submitted")  ; 
	
	replace alone_where_2 = 1 if inlist(alone_where_other,"Shop se saman lene ghr ka,","Shop se saman lene.",
	"Market","He went for shopping in village yesterday","Matanhail bank se paise nikalwane k liye gya tha",
	"Mele me Paani lene","Paani lene","Pani lane") ; 
	
	replace alone_where_2 = 1 if inlist(alone_where_other,"Pani lene","Saman lene","To bring water from Well",
	"Village sy bahar Paani lane gayi thi","pain lene","Bazaar gye h") ; 
	
	replace alone_where_3 = 1 if inlist(alone_where_other,"Shop se cosmetic saman lene.",
	"Parvesh went to repair his mobile phone last week","Dusry gaavo m apna khud ka saaman lay ny gayi thi",
	"Beri phone thik karvane gaya tha") ; 
	
	gen alone_where_5 = 1 if inlist(alone_where_other,
	"APNI SISTER KE GHAR GYE THE GUNNOR","Ankal k ghr gye thi",
	"Ankal k ghr.","Apbi sister ke ghar Chulkana","Apne Ristedaro ke ghar par",
	"Apne kisi relative k yaha gayi thi","Apne rishtedar k ghar",
	"Apny taau k ghar pr gay thy","Bhua k ghar") ; 
	
	replace alone_where_5 = 1 if inlist(alone_where_other,"Bhua k ghar gya tha dariyapr",
	"Bhua ka ghar par","Bua k ghar","Bua k ghar Rohtak district m","Bua k ghar Sawen( Kaithal)",
	"Bua k ghar aur mama k ghar","Bua k ghar gya hua tha Gohana","Bua k ghr gya tha akela") ; 
	
	replace alone_where_5 = 1 if inlist(alone_where_other,"Bua ka ghar","Bua kavghae par",
	"Bua ke ghar","Buaa ke ghar","Buua k ghar","Buva k ghar","Buya k ghar gaya tha") ; 
	
	replace alone_where_5 = 1 if inlist(alone_where_other,"Chacha ji ke ghar,  tau ke ghar",
	"Dadi ke ghar","Delhi Brother ki shadi me","Delhi gya tha Bua k ghar","Didi k ghar p",
	"Gav me bde Papa ke ghar.aur market","Ghumne gye uncle k ghar  (Mumbai)",
	"Jatin went to see her married sister in Gurugram") ; 
	
	replace alone_where_5 = 1 if inlist(alone_where_other,
	"Chacha ji ki ladki a rkhi thi usse Milne gai thi","Mama JI k ghar (Bhiwani)" ,
	"Mama K ghar","Mama ji k ghar gayi thi","Mama ji k ghar pr","Mama ji ke ghar",
	"Mama k Ghar.","Mama k ghar") ; 
	
	replace alone_where_5 = 1 if inlist(alone_where_other,"Mama k ghar BHADURGARH khungaayi",
	"Mama k ghar gaya tha","Mama k ghar village majra dist gohana","Mama k ghar.",
	"Mama k ghr gye thi","Mama k gr.","Mama k ja rha tha","Mama k yaha gayi thi.") ; 
	
	replace alone_where_5 = 1 if inlist(alone_where_other,"Mama ka",
	"Mama ka ghar par","Mama ke ghar","Mama ke ghar Gaye the","Mama ke ghar gaya tha ghumne",
	"Mama ke ghar gye the","Mama or mosi k ghar.","Masi k pass up") ; 
	
	replace alone_where_5 = 1 if inlist(alone_where_other,"Medical  Apni MUMMY K ghar",
	"Mosi K ghar","Mosi k ghar","Mosi k ghar gayi thi","Mosi k ghar gya tha bhiwani",
	"Mosi k gher","Mosi ka ghar","Mossi ji k ghr") ; 
	
	replace alone_where_5 = 1 if inlist(alone_where_other,"Mousi ke ghar",
	"Nana k gr","Neighborhood k gr gyi h student.","Neighbors","Relation me gae the",
	"Relativ k Ghar gye they","Relativ ke ghar par gye they") ; 
	
	replace alone_where_5 = 1 if inlist(alone_where_other,"Rishtedar k ghr",
	"Ristedar ke ghar","Ristedaro ke ghar","Rohtak ,taau k ghr","Sister K pass gya tha",
	"Sister k ghar","Sister k gher") ; 
	
	replace alone_where_5 = 1 if inlist(alone_where_other,"Sister k ghar gya tha vpo sheriya dist Jhajjar",
	"Sister ke ghar","Sonipat mama kai ghar","Student akeli apni buwa k ghar Gaye thi",
	"Taau ke ghar","Tau ji ke ghar","Vpo Farmana mai gya tha sister ke ghar",
	"To go to see his sister To go to see fair","apne uncel ke ghar") ; 
	
	replace alone_where_5 = 1 if inlist(alone_where_other,"mama ke ghar",
	"mama ke ghar Ladpur","masi ke ghar","mosi or Buwa ke ghar vpo Dhuwana",
	"reshtadari me","uncel ke ghar","Apne dusre Ghar Jo isi gaon me H",
	"Apne dusre ghar par","Apne plat ar gyi thi") ; 
	
	replace alone_where_5 = 1 if inlist(alone_where_other,"Ghar","Known k ghar gya h.") ; 
	
	gen alone_where_6 = 1 if inlist(alone_where_other,"Academy jati hai",
	 "Bhapoli tusian pr gayi thi","Books ka kaam sikne","Center pr government service ki coaching Lana.",
	 "Coaching centre","Computer academy","Computer center") ; 
	 
	replace alone_where_6 = 1 if inlist(alone_where_other,"Computer center exam dene gya tha",
	 "Computer center pr jaati h","Computer centre","Computer centre gyi thi","Computer class lene",
	 "Computer class me","Computer course ka puchne gyi thi") ; 
	 
	replace alone_where_6 = 1 if inlist(alone_where_other,"Delhi exam Dene k liye gya tha",
	 "EXAM K LiYe dusre villege m gye thi.","English  speaking  centre","Exam dene",
	 "Exam k liye gye thi kharkhoda.","Exam k liye gye thi.","Madam k ghar") ; 
	 
	replace alone_where_6 = 1 if inlist(alone_where_other,"Roll no. lany gayi thi",
	 "Samalkha exam dene gyi thi","Silaai centre","Silai Center gyi ti",
	 "Silai cantar","Silai sikhne","Student teching sikhne gyi ti") ; 
	 
	replace alone_where_6 = 1 if inlist(alone_where_other,"Student tushan pr Gaye thi",
	 "TUITION","TUTION","To appear in MR navy exam Gurugram","Teaching k liye jati thi",
	 "To go for tuition classes","Tuition Jana or friend ke ghar jana") ; 
	 
	replace alone_where_6 = 1 if inlist(alone_where_other,"Tuition center Kathmandi ROHTAK",
	 "Tuition class","Tuition class daily jati h","Tuition class gayi thi",
	 "Tuition class k liye","Tuition classes","Tuition gai thi") ; 
	 
	replace alone_where_6 = 1 if inlist(alone_where_other,"Tuition gaya tha",
	 "Tuition girls'friends ke ghar","Tuition jati hai","Tuition or suit silane",
	 "Tusan jana","Tusion","Tution") ; 

	replace alone_where_6 = 1 if inlist(alone_where_other,"Tution jati hai student",
	 "Tutison par, Rothak","Went To Delhi for appearing in MR Navy recruitment exam",
	 "computer  centre","computer center","gav me tution class") ; 
	 
	replace alone_where_6 = 1 if inlist(alone_where_other,"rohtak  tution pr gyi hu",
	 "student  akeki tutino  jati ha","student tutino ke liye jati ha","teushan par bhi",
	 "tution class","Kalanuor computer center gaya tha","Gohana computer  course karne",
	 "Parlar sikhne") ; 
	 
	replace alone_where_6 = 1 if inlist(alone_where_other,"Selai center pr gayi thi") ; 
	 
	gen alone_where_7 = 1 if inlist(alone_where_other,"Agra Kaam karne k liye",
	"Akele keto me skuti clana","Bahan ke ghar or kaam par jata h",
	"Bijli ka kaam sikhne dukaan PR jata h","Company m work krne",
	"Company me","Company work","Duty p") ; 
	 
	replace alone_where_7 = 1 if inlist(alone_where_other,"Genhu Katne gye thi",
	"JOB K LIYA AKABARY BAROTA","Job","Job krne","Job krte waqt gya h complend  PR.",
	"Job other city","Job par jata hai") ; 
	
	replace alone_where_7 = 1 if inlist(alone_where_other,"Job par jata hain",
	"Job pr","Job pr BHINJHOL","Job pr gya tha","Job pr.","KHET SE CHARA",
	"Kaam  par jata h") ; 
	
	replace alone_where_7 = 1 if inlist(alone_where_other,"Kaam karne",
	"Kaam karne k liye","Kaam karne ke liye jata h","Kaam ko le kr",
	"Kaam krne k liye","Kaam krne k liye company me","Kaam krne ke liye") ; 
	
	replace alone_where_7 = 1 if inlist(alone_where_other,"Kaam par",
	"Kaam par jata h","Kaam pr","Kaam seekhne or kaam krne khushi bike point pr jaata hu",
	"Kam par","Khaito mai gyi ti kaam krnee","Khaito mai jati hai kaam krne",
	"Khet me gyi h student gahu Katana..") ; 
	
	replace alone_where_7 = 1 if inlist(alone_where_other,"Khet me kaam karne gaya tha",
	"Khet me kaam karne ke liye","Kheto M chaara lene","Kheto me Father ki help karna",
	"Majduri krne gya tha","Majduri krne jata hu","PANIPAT kaam karne jata h") ; 
	
	replace alone_where_7 = 1 if inlist(alone_where_other,"Rohtak Kam karne jata hu har roj",
	"Rohtak Kam krne k liye roj jata hu","Rohtak gya tha Kam karne",
	"Rothak kam par","Safai ka kam karny Jana padta h.","To do electrician work",
	"To go in agriculture land/field everyday","kam par","kheto me gya tha gehu katne") ; 
	
	replace alone_where_7 = 1 if inlist(alone_where_other,"student  job karne jati ha",
	"student  job karti ha") ; 
	
	gen alone_where_8 = 1 if inlist(alone_where_other, "Apni friend ke ghar", 
	"Apni frnd ke ghr","Dost ka satt","Dost ke ghar per",
	"Dost ke gher","Dost ke gher gye the","Dost ke ghr","Dost ke ghr.") ; 
	
	replace alone_where_8 = 1 if inlist(alone_where_other,"Dosto  ka  sath",
	"Dosto ke ghar","Dotson ke ghar","FRIEND KA GHR","FRIEND KE BIRTHDAY PAR GYI THI",
	"FRIEND KE ghar","Frd k ghar gayi thi","Frd ki shaadi m Gaye thi") ; 
	
	replace alone_where_8 = 1 if inlist(alone_where_other,"Frd k ghar aur apny related k ghar gay thy",
	"Frend k ghr","Friend  k ghr","Friend Ke ghar gye the","Friend k ghar",
	"Friend k ghar par","Friend k gher","Friend k ghr gha tha") ; 
	
	replace alone_where_8 = 1 if inlist(alone_where_other,"Friend k ghr pr",
	"Friend ka gher","Friend ke ghar","Friend ke ghar gyi ti","Friend ke gher",
	"Friend ke ghr","Friend ke marriage function me","Friend ki Merrige me") ; 
	
	replace alone_where_8 = 1 if inlist(alone_where_other,"Friend ki sadi m gye thi.",
	"Friend se copy lene","Friend se milne","Friend see Milne village main hi",
	"Friends S Milan","Friends S Milna","Friends k ghar","Friends k gr") ; 
	
	replace alone_where_8 = 1 if inlist(alone_where_other,"Friends k gr.",
	"Friends k pass","Friends k sath gumne or party karna.","Friends ke gar",
	"Friends ke ghar","Friends ke ghar gye they","Friends ke gher","Friends ke gher gye the") ; 
	
	replace alone_where_8 = 1 if inlist(alone_where_other,"Friends se Milne.",
	"GAAV MEI HI FRIEND  K GHAR","Tuition girls'friends ke ghar",
	"dost ke ghar akele jate hai .","friend home","friend ke ghar","friend ke ghar and tution",
	"friend ke ghar pr .") ; 
	
	replace alone_where_8 = 1 if inlist(alone_where_other,"friend ki Shadi me Gaye the",
	"friend ki shadi me gye the","friend se milne","friends  ke ghar","friends ke ghar",
	"DOSTO K ghar", "DOSTO KE GHAR","GAAV MEI HI FRIEND  K GHAR",
	"Pass m rahty wali friend sy mil ny gayi thi") ; 
	
	replace alone_where_8 = 1 if inlist(alone_where_other,
	"Reduwas gaaw me gyi thi,friend ki Sadi me") ; 

	gen alone_where_9 = 1 if inlist(alone_where_other,"Mandir","Mandir gayi thi","Mandir ghumne  gye the",
	"Mandir me","Tample","Temple","mandir","mandir me") ; 
	
	replace alone_where_9 = 1 if inlist(alone_where_other,"Meele Mai","Mela dakna gha tha",
	"Mela dekhane Gaya tha","Mela dekhne","Mela me Gaya","Mele me",
	"Mele mein Pathri","Melee m") ; 

	replace alone_where_9 = 1 if inlist(alone_where_other,"Mender mei gha tha","Mindir gai thi.",
	"mele m gya h.","mele m gye the","pooja  krni k liy biri gyi thi tharmik sathal",
	"In Fair ( male m )") ; 

	gen alone_where_10 = 1 if inlist(alone_where_other,"Akhade m.","GAME KE LIYE","Kabaddi khelne",
	"Kabaddi khelne Gaya tha sonepat","Khalnay","Khalne","Khelnay") ; 
	
	replace alone_where_10 = 1 if inlist(alone_where_other,"Khelne","Khelne , books lene",
	"Khelne Gaya tha","Khelne Gaye the","Khelne Gaye the Samalkha",
	"Khelne gye the","Khelne jata h","Palying sports  MAMA k ghar gya") ; 
	
	replace alone_where_10 = 1 if inlist(alone_where_other,"Playing","Playing  games",
	"Playing Games","Playing games","Stadium","Stediyam m khelne k liye",
	"Stediyum","To play") ; 
	 
	replace alone_where_10 = 1 if inlist(alone_where_other,"To play in Sport stadium",
	"To play in stadium","To play outdoors","Village me khlne k leye gye h",
	"khelne") ; 
	
	#delimit cr
	
	
	lab var alone_where_1 "To school/college"
	lab var alone_where_2 "To pay bills/buy groceries/bank/post office/doctor/do hh chores" // added bank; PO and doctor
	lab var alone_where_3 "To buy personal items/shopping"
	lab var alone_where_4 "Others"
	lab var alone_where_5 "To relative's/family member's/neighbour's/or their home" // new
	lab var alone_where_6 "To tuitions/coaching/give exam" // new
	lab var alone_where_7 "To work on farm/job etc." // new 
	lab var alone_where_8 "To visit friends" // new
	lab var alone_where_9 "To community events/activities" // new 
	lab var alone_where_10 "To play sports" // new 
	
	                                                                                                                                                                                                                                              
	order(alone_where_?) (alone_where_1?), after(alone_where)
	
	forvalues x = 5/10 {
	replace alone_where_`x' = .s if alone_past_week != 1
	replace alone_where_`x' = 0 if alone_where_`x' == . 
	label values alone_where_`x' yesno
	
}

** VIII. respondent_oth

	#delimit ; 
	
	replace respondent = 8 if inlist(respondent_oth,"Bhabbi",
	"Bhabhi","Bhabhi ji","Bhabi","Bhua","Bua","Mami") ; 
	
	replace respondent = 8 if inlist(respondent_oth,"Mama ki ladki",
	"Mosi","mami") ; 
	
	#delimit cr

** IX. refusal_reason_other 


	#delimit ; 
	
	replace refusal_reason = 2 if inlist(refusal_reason_other,
	"Dadi ne mna kr diya","Husband ne mna kar diya","Husband ne mna kiya",
	"Husband ne survey k liye mna kr diya","Wife ne mna kr diya",
	"pooja ke husband ne mna kr diya") ; 
	
	replace refusal_reason = 2 if inlist(refusal_reason_other,
	"Student k husband me survey se mna kr diya",
	"Student ke husband ne Student se bat krvane se mna kr diya",
	"Student ki shadi ho chuki h uske husband ne survey krane se mna kr diya dubara call nhi krni",
	"STUDENT SARAB PITA H USNE HE BAR  BAR MANA KARTA USNE BILKUL MANA KR DIYA ME NAHI KARATA SARVE",
	"ladki ghar chod kar bhag gayi h(23-1_2019)") ; 
	
	#delimit cr
  
	#delimit ; 
	
	label define refusal_reason
	
	 1 "Parents/Spouse/Student not interested in the survey" // included spouse as well 
     2 "Parents/Spouse/Student don't want the survey to be conducted/refused" // included spouse as well 

	, add modify ; 
	
	#delimit cr
	

	
