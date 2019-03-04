<#
------------------------------------------------------------
Author: John Leger
Date: Feb. 17, 2019
Powershell Version Built/Tested on: 5.1
Title: Get Groups and Users
Website: https://github.com/johnbljr
License: GNU General Public License v3.0
------------------------------------------------------------
#>  
$server = 'server'
$searchbase = "DC=company,DC=local"
$Groups = Get-ADGroup -Properties * -Filter * -server $server -SearchBase $searchbase
$txt = "c:\temp\GroupMembers.txt"
new-Item -Path $txt -ItemType file
Foreach($G In $Groups)
{
Add-content -Path $txt -Value ""
Add-content -Path $txt -Value "----- $G.CN -----"
Add-content -Path $txt -Value $G.GroupCategory
Add-content -Path $txt -Value $G.GroupScope
Add-content -Path $txt -Value $G.Members
Add-content -Path $txt -Value "----- END -----"

}