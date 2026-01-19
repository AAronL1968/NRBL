# Norwood Recreational Baseball League (NL Only)
## This is where AAron maintains his fantasy baseball database application.
## 2026 updates:  
The 2026 NRBL auction draft is Saturday, March 28.
 - implement "NRBL_documenter" database
 - refactor code
     - stop creating new DBs every year. New main front-end app is now `.\NRBL\NRBL_front.accdb`
         - old dbs are moved to `.\Archives`
     - stop creating separate copy of the front-end application for mock drafts.
         - user selects environment at startup, via "Draft" or "Mock Draft" button
         - move all data tables out of front-end, automatically drop and link after user selects environment
             - "Draft" - set all back-end data to link to tables in `.\NRBL_data\NRBL_data.accdb`
             - "Mock Draft" - set all back-end data to link to tables in `.\NRBL_data\NRBL_mock.accdb`
             - copying `.\NRBL_data\NRBL_data.accdb` to `.\NRBL_data\NRBL_mock.accdb` will refresh the mock data
                 - running `.\NRBL\backup_data_to_mock.bat` automatically refreshes `.\NRBL_data\NRBL_mock.accdb` from `.\NRBL_data\NRBL_data.accdb`
     - move all code modules from front-end to separate database file, `.\NRBL\NRBL_code.accdb`
         - automatically remove and connect reference to `NRBL_code.accdb` at startup
- insert directly into NRBL_players from FanGraphs data (bypass OnRoto)
- populate "Last Year" actual values from FanGraphs, calculate dollar values earned, value analysis queries
- add Runs ( `R` ) and Strikeouts ( `K` ) as categories, bringing the league from 4x4 to 5x5
    - add `stat_categories` and `season_category_junction` tables to make the categories more modular/dynamic; add and expand existing queries, form controls, etc.
- import FanGraphs defensive data for previous year to determine position eligibility
- implment "Out of Scope" status to reduce delete/re-inserts
    - set `NRBL_players.Status` to "Out of Scope" if `NRBL_players.NL` = "AL" (moved to the American League) or `NRBL_players.pos` = "DH" (unable to set position based on last year's FanGraphs defensive data, likely a minor leaguer)
## 2025 updates:  
The 2025 NRBL auction draft is Saturday, March 29.
 - added new OOPSY projection system 
 - recalculate dollar values in real time during the auction as players are drafted
   ![image](https://github.com/user-attachments/assets/de5a7aff-85e8-4cd6-9804-7c9df0b711df)

 - streamline imports to be more table-driven
     - remove duplicated code where possible
   ![image](https://github.com/user-attachments/assets/6bdbce57-7fe7-45ac-9e25-9f8bcf7c6b26)

 - add gradients of green and red to roster report to indicate bargains/overpays in relation to the average of all active sources' "pure" (uninflated) auction values by player
   ![roster_a](https://github.com/user-attachments/assets/11ba2eca-61d0-4f57-a69e-1617e330f56e)
   ![roster_b](https://github.com/user-attachments/assets/ef060039-9f26-4da4-98ba-02a12b02777d)

## 2024 updates:
There is a lot of work to do before the 2024 draft (Saturday, March 30).  
 - the league is contracting from 12 teams to 11
 - teams all add one additional pitching slot
 - teams all add a new "Switch" player that can be either a hitter or a pitcher (or Shohei Ohtani)
 - the draft budget increases from $275 to $300 per team

## This application will require Microsoft Access to be installed on the host machine.  
By default, the database expects the `NRBL_import` folder to reside at `C:\repos\NRBL\NRBL_import`.
If you create a "C:\repos" folder and clone this repository into it, the folder will automatically be in the correct location.  If `NRBL_import` is in a different location than expected, use the "Linked Table Manager" in Access to point to the correct location.

Be sure to add the `NRBL` and the `NRBL_import` folders to your "Trusted Locations" in the Access "Trust Center".
