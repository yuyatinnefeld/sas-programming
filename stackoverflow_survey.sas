data raw_dataset;
infile "/folders/myfolders/Data/stackoverflow_survey_2020.csv" delimiter=',' firstobs=2;
	
input 
	Respondent $ 
	MainBranch $ 
	Hobbyist $ 
	Age $ 
	Age1stCode $ 
	CompFreq $ 
	CompTotal $ 
	ConvertedComp $ 
	Country $ 
	CurrencyDesc $ 
	CurrencySymbol $ 
	DatabaseDesireNextYear $ 
	DatabaseWorkedWith $ 
	DevType $ 
	EdLevel $ 
	Employment $ 
	Ethnicity $ 
	Gender $ 
	JobFactors $ 
	JobSat $ 
	JobSeek $ 
	LanguageDesireNextYear $ 
	LanguageWorkedWith $ 
	MiscTechDesireNextYear $ 
	MiscTechWorkedWith $ 
	NEWCollabToolsDesireNextYear $ 
	NEWCollabToolsWorkedWith $ 
	NEWDevOps $ 
	NEWDevOpsImpt $ 
	NEWEdImpt $ 
	NEWJobHunt $ 
	NEWJobHuntResearch $ 
	NEWLearn $ 
	NEWOffTopic $ 
	NEWOnboardGood $ 
	NEWOtherComms $ 
	NEWOvertime $ 
	NEWPurchaseResearch $ 
	NEWPurpleLink $ 
	NEWSOSites $ 
	NEWStuck $ 
	OpSys $ 
	OrgSize $ 
	PlatformDesireNextYear $ 
	PlatformWorkedWith $ 
	PurchaseWhat $ 
	Sexuality $ 
	SOAccount $ 
	SOComm $ 
	SOPartFreq $ 
	SOVisitFreq $ 
	SurveyEase $ 
	SurveyLength $ 
	Trans $ 
	UndergradMajor $ 
	WebframeDesireNextYear $ 
	WebframeWorkedWith $ 
	WelcomeChange $ 
	WorkWeekHrs $ 
	YearsCode $ 
	YearsCodePro;
run;

data report_dataset;
set raw_dataset;
run;

proc print data=report_dataset;
run;