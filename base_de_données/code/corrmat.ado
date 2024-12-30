*! version 1.1.0 KTK 14jan2004
* version 1.0.0 SRD 18may2001
program define corrmat, rclass
	version 7.0
	syntax varlist [aweight fweight]/*
		*/ [, COVMAT1 COVmat(string) CORRMAT1 CORrmat(string) nomat]

	 if "`covmat1'" == "" & "`covmat'" == "" & /*
		*/ "`corrmat1'" == "" & "`corrmat'" == "" & /*
		*/ "`mat'" == "" {
		local mat mat
	} 

	if "`covmat1'" != "" & "`covmat'" != "" {
		di as err "covmat and covmat() are mutually exclusive"
		exit 198
	}

	if "`corrmat1'" != "" & "`corrmat'" != "" {
		di as err "corrmat and corrmat() are mutually exclusive"
		exit 198
	}
	
	if "`weight'" != "" {
		local weight [`weight'`exp']
	}

	/* parse and do nomat */
	
	if "`mat'" != "" & "`covmat1'" == "" & "`covmat'" == "" {
		corr `varlist' `weight'
		exit 
	}
	
	if "`mat'" != "" & ("`corrmat'" != "" | "`corrmat1'" != "") & /*
		*/ ("`covmat1'" != "" | "`covmat'" != "") {
		corr `varlist' `weight'
		corr `varlist' `weight', c
		exit
	}
	if "`mat'" != "" & ("`covmat1'" != "" | "`covmat'" != "") {
		corr `varlist' `weight', c
		exit
	}

	/* parse and do covmat and corrmat*/
	
	local covmat1 `covmat1' `covmat'
	local corrmat1 `corrmat1' `corrmat'	
	if "`covmat'" == "" {	
		local covmater "Cov"
	}
	else {
		local covmater `covmat'
	}
	
	if "`corrmat'" == "" {		
		local corrmater "Corr" 
	}	
	else {
		local corrmater `corrmat1'
	}

	qui mat ac `covmater' = `varlist' `weight', deviations noconstant 
	mat `covmater' = `covmater'/(r(N)-1)

	if  "`covmat1'" != "" {
		di
		di as txt "Covariance Matrix"
		mat list `covmater'
		mat temp = `covmater'  
		ret mat cov `covmater'
		mat `covmater' = temp 
		matrix drop temp
	}

	if "`corrmat1'" != "" { 		
		di
		di as txt "Correlation Matrix"		
		mat `corrmater' = corr(`covmater')
		mat list `corrmater'
		ret mat corr `corrmater'
	}

	if "`corrmat'" != "" {
		qui mat ac `covmater' = `varlist' `weight', deviations noconstant
		mat `covmater' = `covmater'/(r(N)-1)
		mat `corrmater' = corr(`covmater')
		mat drop `covmater'
	}

	if "`covmat'" != "" {
		qui mat ac `covmater' = `varlist' `weight', deviations noconstant
		mat `covmater' = `covmater'/(r(N)-1)
	}

	capture mat drop Cov
end
