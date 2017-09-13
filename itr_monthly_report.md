# Monthly Review Hub

## Monthly Review on 08/11/16 

### Items
* exchange rate projects
* aml
* loan repayment
* ecsd
* gfatca
* name checking 
* ifrs9
* as400 kernel
* autopay portal arrangement 
* lunar note portal
* ftp to scp
* java upgrade
* autopay client restructure
* autopay client resize
* fatca
* activity code chg
* dsf monthly tax refund 
* imarket client patching
* statement month update

### Details
0. **Overview** The last short meeting we learnt from edward that the last quarter of the year we will focus on Compliant and E-Channel. Porject other than these 2 aspects will be prosponed or simply ignored.
0. **Exchange rate projects** Exchange rate project group including monitoring on transaction, echannel time deposit maintanence app, echannel group rate maintanence app, update crteinq rate screen. Until now the last item (etrapp: echannel tiem deposit) of the project group is already on production. The project can come to an end after the scm. There will be further developement of the mtfx(fx monitoring) proposed by treasuary department but not so soon. 
0. **AML report** AML report is pain in the ass. Now I only need to make 4 minor changes and generate the file manually (just need to add according library list especially zusrlib and chg the tap00101 in iprod and the process can run successfully), then karl will verify the integrity and process the UAT.
0. **Loan repayment** This project is closing and no follow-up action is needed except month end checking.
0. ECSD    It might last longer. Now I already finish screen dev and module dev. Upcoming task is on UAT and system administration
0. **Gfatca** Generate fatca program main body is developed. Only need to present to Edward when the project is brought up.
0. **Name checking** My job is to get familiar to the system. No source code can be reference but luckily we have system manual. Today just get the first concrete task of this project(find out where tables are master file)
0. **IFRS9** Finished. Wait for tommy and albert's operation to fully close up the project.
0. **AS400 ICBS System** Previously I was reading the imodule but stopped for 2 months. Now I am going to pick it up again and read the i700bs. But make sure that starting the understanding from the specification is more important than the code!

## Monthly Review on 23/12/16

### Items
* ecsd
* gfatca
* exrate excel
* NameChecking
* safe deposit box sql
* chg officers on 1st Jan
* CIF enquiry trace log
* Automate Trading TX
* RefactorFoxProSMS
* AMCM Clearing CQ
* CDD MSGID FCIUMEMO

### Details
1. ECSD    We have progressed to pre-gopro stage, we will arrange UAT, the inhouse entrance and the authority code is ready(app ready naming ecsdap but ecsdact no yet)
2. GFATCA    The whole structure is okay, need to add payment part and extend some field length. Will use it at the beginning of 2017
3. Exchagne Rate Excel Solution    We have done a lot of work on this lately. We have tested the java solution, the marco solution and the vbs solution. So far, the marco works, but we want a way to automate it so we need to work out either java or vbs way. The bright side is that the vbs seems working (in the test, it work once the first time and failed the others) with registering the dll. We will see more nex tmonth.
4. NameChecking    Try the new 2 patches ( the last patch we only upload the backend part). With the old 2 patches, in total, we have 4 patches installed but still after the second loading of data (aka the v5,6 data) there are 70k record in new category and automigration.bat can only tackle some thousands of them.

## Monthly Review on 13-02-2017

### Items
* ecsd
* gfatca
* exrate excel 
* exrate fast btn
* NameChecking
* RefactorFoxProSMS
* AMCM Clearing CQ
* CDDMnt 
* FCIUMEMO
* FSSReformat
* FSSPDF
* StaffStockRpt

## Monthly Review on 21-02-2017

### Items
* FSSReformat
* FSSPDF
* StaffStockRpt
* gfatca
* exrate excel 
* exrate fast btn
* ecsd
* NameChecking
* RefactorFoxProSMS
* AMCM Clearing CQ
* CDDMnt 
* FCIUMEMO

### Details
1. FSSReformat- Need to finish fast
2. FSSPDF- need to finish fast
3. StaffStock - go production already 
4. Gfatca- Generate the lastest version already
5. ExRate Excel- finished poc (well), no further action
6. ExRate Fast Button- No deadline and not heat recently
7. ECSD- Wait for further notice, there are a lot logic like ebank and JOO should be added
8. NameChecking- No further action yet. Wait for training
9. RefactorFOXPro- Finish MVP_functional, Will adapt TDD to refactor it into OO. No expectation from mana.
10. Clearing- the mostly mentioned project recently, will be the main focus (since has deadline from gov)
11. CDDMNT- Not start yet. No deadline expected.
12. FCIUMEMO- UAT now, wait for feedback, and the work will switch to CDDMNT."

## Monthly Review on 03-04-2017

### Items
* OVERVIEW
* FOXPRO SMS 
* AML x CDD 
* Exchange Rate 
*  Image Retrieval Migration
* Clearing Cheque
* ECSD
* Lunar Note Web app
* Utility dev 
* Personal Efficiency
* Code lib diff

### Details
0. OVERVIEW    This March is a month that I start rapid dev of java with vim. And this is the month that I am learning JEE knowledge(from work and Udemy). I process the sms app especially and dev some interesting util(bcmF, codeA, libA...). And I like the new trial of 8-time slot method. It is so important that it might influence my efficiency and happiness at a long-term level.
1. FOXPRO Legacy Program SMS refactoring    The project process from mvp of functional programming to object-oriented design which is a 3 package design- package CORE (contains function classes), package ENGINE (contains spring boot scheduled task and ppy reading), package UI (contains the GUI thats read ppy and control actions). With the package CORE and package ENGINE finished, package UI needs to be fullfilled with SQL connection feature.
2. AML x CDD off-screen support    The project provide CDD off-screen support includes: 1. CDD Memo/tickler create/ reviewed/ modify/ authority. 2. Process Server Recognition Code 432-434 base on new memo/tickler(FCIUMEMO). 3. Process Server New Code Hitting Daily Report. Now we have go-proed all programs and only Maintenance Screen Left. 
3. Exchange Rate Fetching Enhancment    Reboot the project (to apply a standalone exchange rate fetching app beside the Excel instance), communicate our previous poc result (try to use java poi/ vbs to by-pass the reuters signon but failed) to easytone. Then they gave another solution (use jacob to call dll to sovle the custom-defined excel function invoking) but still fail to by-pass Reuters Excel Signon. So the final result of this project is to add marco script to a new excelworkbook and starts it with other instance at every morning.
4. Image Retrieval System Migration to JBoss    The IRS(Image Retrieval System) is not applicable to JBoss because it is not in war format. I build a war version so that it can run on JBoss/Tomcat as well. Now the dev is finished, wait if there is valid sql server setting to verify the integrity of the newly refactored system.
5. Clearing Cheque    We have some discussion already. So far I finished the day-1 screen for branch user and OPG. Then next step we need to wait for the result from meeting on Apr 10th. Expected a detail arrangement on:
    * how branch upload the chq 
    * how opg output the result to amcm portal 
    * how day 2 we reponse to other bank.
6. ECSD (Electronic Customer Statement Delivery)    We have go-pro this screen application. But not yet do the one-time conversion for it. Will wait for Tina to cooperate it.
7. Lunar Note Web Application    I design the web app as no-jsp design. The spring-boot powered web-service provide register session and inquiry feature. Then Jquery consume the restful webservice and parse the return json. By now, has poc the restful webservice and the program call to as400.
8. Utility dev
    * BcmF: I develop this utility to read the Staff List Form excel to help the daily management of user application access forms. And I compile it to exe so that I can add it to the path and call it at a few tabs. The dev has been finished and put into daily use.
    * CodeA: This util is my second util. It aims to find out similar structure in different code snippets. The main idea is to parse program snippets into Matrixes and if 2 Program Matrix share similar parts, then say they has duplicated structure. It is still under mvp phrase.
9. Personal Efficiency
    * 8-time-slot working style: Since the beginning of Feb I applied this method and I found out this method's advantage is the review part, not the planning part. Only when I am forced to stop I make full use of my slot; only when I have review time then I find out how to do a better job.
    * use vim everywhere: I at first try to force myself to use vim for utility Bcmf development. And so that I discover that vim is actually a satisfying javaIDE, I use supertab (vim script) to fasten my typing and use :(v)sp to refs other java class and use :! to run command in vim. Now my hand can stay comfortably at the same position.  
    * use git to perform weekly working directory commit.

## Monthly Review on 02-05-2017

In April, in the 13 working day I successfully implemented 8.5 days of eight-time-slot working style. Significant milestones are: 
- Present the Lunar Note Web Portal PoC
- Present the SMS Sending Utiltiy
- Build up the Fundadores Project 

### Items
* SMS Foxpro Program Refactor
* AML x CDD Scan and User Security
* CRRPT21                       
* FSS Extend Numeric Digit  
* DSF Statistic Report        
* Lunar Note Web Portal       
* Clearing Cheque Project   
* Credit Admin New Report       
* SDB Add Field to Report     
* Addhoc debug 4 DSF/FSS

### Details
0.  **SMS Foxpro Program Refactor**: I finish the config frame and the spring-convertion of the engine and ui modules. It is more decoupled and structured. I have presented it to edward.
0.  **AML x CDD Scan and User Security**: I finish the user security part and gorpo. But the lastest news is that DSB inform that we dont need to apply this logic so basically the project is then closed (update on 02/05/17).
0.  **CRRPT21**: A current Credit admin report CRRPT21 is requested to add information. I start the dev and finish the go pro in April.
0.  **FSS Extend Numeric Digit**: Finish Go Pro. 
0.  **DSF Statistic Report**: In order to automize the monthly manual statistic making for DSF Tax Refund Statistic, I build up the SQL and CLP. 
0.  **Lunar Note Web Portal**: Previously I poc the date-return module/ demo the restful api with springboot/ how to transfer spring jar to war that compatable with tomcat/ know how to use bootstrap for rapid frontend dev. In April, I consolidate the knowledge and build the war and successfully demo to edward.
0.  **Clearing Cheque Project**: There is no more dev on this project in April. AMCM has managed 2 meetings so now mainly wait for instruction from edward.
0.  **Credit Admin New Report**: Not dev yet. Receive and debriefed already.
0.  **SDB Add Field to Report**: Receive the req and finish dev in April, go pro-ed. Wait for test run on production in May.
0.  **Addhoc debug 4 DSF/FSS**: add-hoc debug task for DSF and FSS bugs.
0.  Utility
    ** liba: A command line tool for myself to query code library. Build from scratch to release v0.0, install to code_library folder, source code on github
    ** Fundadores Project: In order to read source code in a systematic environment, I name the project Fundadores and build its file in code library. Also I explore eclipse and its maven setting to read source code in a super efficient way."

## Monthly Review on 05-06-2017

I had a vacation in May so in total 16 working days. The quality of work is not good becuase of the focus lost. Plus many set-back from the management. The de-focus also came from that. But for my own sake, I need to catch works up in June.

### Items
* ClearCheque Project
* DSF Statistic Report
* Lunar Note Web Portal
* ECSD
* SDB Add field to Report
* FAD New Report
* AMLxCDD
* CRRPT21
* SMS Foxpro
* Credit Admin New Report
* DSF2ndBug on Leagacy Account Translation
* FSSZipZero

### Details 
1. **ClearCheque Project** -  start ping and build qrc-decoder, but was told later in the month that its not going to be deployed.
2. **DSF Statistic Report** - Go production on IEOM and file server
3. **Lunar Note Web Portal** - Support Albert on pinging the project
4. **ECSD** - Modify log wording and cancel screen log/ only module log
5. **SDB Add field to Report** - receive and go pro
6. **FAD New Report**- receive and go pro
7. **AMLxCDD** - this project involves CCIUMEMO /process server and User maintanence is called off since DSB not require a system sync anymore
8. **CRRPT21** - go production in May and fix a bug that cuased by not found
9. **SMS Foxpro** - Presentation to edward and plan for next step
10. **Credit Admin New Report** - Start to dev and almost done
11. **DSF2ndBug on Leagacy Account Translation** - Debrief but later was called off by Angela
12. **FSSZipZero** - Debrief but not yet dev
13. 8-time slot enforcement    I have 7.5/18.5 days = 40% implementation. I found out that the break is in fact the essence of this 8-time slots methodology. 
14. **Fundadores Project** - Barely read some jdk code"

