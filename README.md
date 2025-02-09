# Norwood Recreational Baseball League (NL Only)
## This is where AAron will maintain his fantasy baseball database application.
### There is a lot of work to do before the 2024 draft (Saturday, March 30).  The league is contracting from 12 teams to 11, adding a pitching slot, adding a new "Switch" player that can be either a hitter or a pitcher (or Shohei Ohtani), and increasing the draft budget.

2025 updates:  add new OOPSY projection system 
To-do:  recalculate dollar values in real time during the auction as players are drafted

This application will require Microsoft Access to be installed on the host machine.  By default, the database expects the `NRBL_import` folder to reside at `C:\repos\NRBL\NRBL_import`.
If you create a "C:\repos" folder and clone this repository into it, the folder will automatically be in the correct location.  If `NRBL_import` is in a different location than expected, use the "Linked Table Manager" in Access to point to the correct location.

Be sure to add the `NRBL` and the `NRBL_import` folders to your "Trusted Locations" in the Access "Trust Center".
