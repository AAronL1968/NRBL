# Norwood Recreational Baseball League (NL Only)
## This is where AAron maintains his fantasy baseball database application.
## 2025 updates:  
The 2025 NRBL auction draft is Saturday, March 29.
 - added new OOPSY projection system 
 - recalculate dollar values in real time during the auction as players are drafted
 - streamline imports to be more table-driven
     - remove duplicated code where possible
 - add gradients of green and red to roster report to indicate bargains/overpays in relation to the average of all active sources' "pure" (uninflated) auction values by player

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
