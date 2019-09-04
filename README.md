# SkypeToTeams
I wrote this script to convert Skype URL calls to Microsoft Teams. It was written and tested for ConnectWise Manage.

# Information
The Script creates a bat file in C:\SkypeToTeams. The bat file converts the skype call to one accepted by Teams. I built this for ConnectWise Manage as it only intergrates with Skype. The bat file was needed becuase the call to skype has "?call" on the end of the phone number and teams will through an error.

# Installation
1. Make sure Skype is removed from the computer. Elevated PowerShell Session:
 ```powershell
Get-AppxPackage Microsoft.SkypeApp -AllUsers -ErrorAction SilentlyContinue -WarningAction SilentlyContinue | Remove-AppPackage -AllUsers -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
```
2. Open PowerShell.exe as the logged in user NOT ADMIN and run:.
```powershell
irm https://bit.ly/skypetoteams | iex
```
3. Make sure the tel: url is set to Microsoft Teams. You can check this in powershell: 
```powershell
Start-Process "tel:18000000000"
``` 
^If this does not open Microsoft Teams then you need to set Teams as the default app. 
<br>**Windows 10:** Settings>Apps>Default Apps>Choose Default Apps by Protocol find tel and set to Teams
