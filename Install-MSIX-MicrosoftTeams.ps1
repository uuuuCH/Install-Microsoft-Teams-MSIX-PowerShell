<#
.NEED Ahead
Install the Teams MSIX File: https://www.microsoft.com/de-ch/microsoft-teams/download-app?

.DESCRIPTION 
This PowerShell script will silently install the Microsoft Teams desktop client. The new Application will be installed.

.PARAMETER SourcePath
Specifies the source path for the Microsoft Teams installer.

.NOTES
Written by: Valentin Sträuli

Change Log
V1.00, 06/02/2024 - Initial version
#>

[CmdletBinding()]
param (

	[Parameter(Mandatory=$true)]
	[string]$SourcePath

)

$MSIXInstaller = "$($SourcePath)\MSTeams-x64.msix"

if (Test-Path -Path $MSIXInstaller) {
	try {
		Write-Host ("Installing Microsoft Teams app...")
		Add-AppPackage -Path $MSIXInstaller
		Write-Host ("Microsoft Teams app installed successfully.")
	}
	catch {
		Write-Warning ("Failed to install Microsoft Teams app")
	}
}
else {
	Write-Output "Unable to locate Microsoft Teams MSIX installer at $MSIXInstaller."
}
