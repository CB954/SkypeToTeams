# SkypeToTeams
I wrote this script to convert Skype URL calls to Microsoft Teams. It was written and tested for ConnectWise Manage.

# Information
The Script creates a bat file in C:\SkypeToTeams. The bat file converts the skype call to one accepted by Teams. I built this for ConnectWise Manage as it only intergrates with Skype. The bat file was needed becuase the call to skype has "?call" on the end of the phone number and teams will through an error.

# Installation
1. Make sure Skype is removed from the computer:
 ```powershell
Get-AppxPackage Microsoft.SkypeApp -AllUsers -ErrorAction SilentlyContinue -WarningAction SilentlyContinue | Remove-AppPackage -AllUsers -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
```
2. Open PowerShell.exe as the logged in user NOT ADMIN.
3. As the logged in user Run:
```powershell
irm https://bit.ly/skypetoteams | iex
```
4. Make sure Tel: is set to Microsoft Teams.
  <br>- You can check this in powershell ```Start-Process "tel:18000000000"``` 
  <br>- If this does not open Microsoft Teams then you need to set Teams as the default app. 
  <br>&nbsp;&nbsp;&nbsp;&nbsp;Windows 10: Settings>Apps>Default Apps>Choose Default Apps by Protocol find tel and set to Teams
5. Next time a Skype link is called it will convert the call to tel which will open in teams.
