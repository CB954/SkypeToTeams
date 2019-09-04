<#
.Synopsis
   This is a powershell module to convert Skype: URL calls to Teams.
   This was created to intergrate Teams with ConnectWise Manage.
.DESCRIPTION
   This script creates/updates the registry keys for skype: URL/Classes and creates a bat file in C:\SkypeToTeams.
   The bat file is to convert the ConnectWise Manage skype:number?call URL to a msteams supported format.
.NOTES
   Version:       1.0
   Author:        Chris Brannon
   Creation Date: 8/21/2019
#>

#Create/Modify Reg Keys
New-Item "HKCU:\Software\Classes\skype\shell\open\command" -Force
New-ItemProperty "HKCU:\Software\Classes\skype" -Name '(Default)' -Value 'URL:skype' -Force
New-ItemProperty "HKCU:\Software\Classes\skype" -Name 'URL Protocol' -Force
New-ItemProperty "HKCU:\Software\Classes\skype\shell\open\command" -Name '(Default)' -Value '"C:\SkypeToTeams\SkypeToTeams.bat" "%1"' -Force

#Make sure C:\SkypeToTeams folder exists
if (!(Test-Path C:\SkypeToTeams)) {New-Item -Type Directory 'C:\SkypeToTeams'}

#Create Bat file
$BatFile = "@echo off
set origNumber=%1
set number=%origNumber:?call=%
`"$env:USERPROFILE\AppData\Local\Microsoft\Teams\current\Teams.exe`" tel:%number%"
$BatFile | Out-file -Encoding "ASCII" C:\SkypeToTeams\SkypeToTeamsPublic.bat

#Create README File
$ReadMeFile = "This is used to convert Skype URL calls to Microsoft Teams. It was written and tested for ConnectWise Manage.

The bat file converts the skype call to one accepted by Teams. 

https://github.com/CB954/SkypeToTeams"
$ReadMeFile | Out-file -Encoding "ASCII" C:\SkypeToTeams\README.txt
