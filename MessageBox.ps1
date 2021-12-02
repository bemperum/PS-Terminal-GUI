<#
	.SYNOPSIS
	MessageBox.ps1 - Examples of Using MessageBoxes with Terminal.Gui in PowerShell
	
	.DESCRIPTION
	Different examples for using the Static Class MessageBox from Terminal.Gui. 
	The are several Types of Boxes in terms of usage:
	- Normal Message Box with one or more buttons (min 1)
	- Normal Message Box with several Buttons and a default set
	- Error Message Box with on button
	- Error Message Box with several Buttons
	- Error Message Box with several Buttons and a default set

	.NOTES
	Once one has grasped how the static methods work, it's quite nice to play around with them. Documentation is good!
	
	
	.COMPONENT
	You need at least NStack.dll and Terminal.Gui.dll to have this work.
	
	.EXAMPLE
	Just run .\MessageBox.ps1 and make soure you are able to load the modules.

	.LINK
	https://migueldeicaza.github.io/gui.cs/api/Terminal.Gui/Terminal.Gui.MessageBox.html

	.AUTHOR
	<peter@tergolape.at> Peter Kastberger, 2021
	
	.CHANGELOG
	2021-12-01, peter: Initial Code
#>
Import-Module "$PSScriptRoot\NStack.dll" -ErrorAction Stop | Out-Null
Import-Module "$PSScriptRoot\Terminal.Gui.dll" -ErrorAction Stop | Out-Null

## Initialize (always necessary)
[Terminal.Gui.Application]::Init()

# Generic MessageBox / DialogBox with Okay - Cancel
$GenericDiaglogResult = [Terminal.Gui.MessageBox]::Query("Title", "Message Body", ("Ok", "Cancel"))
If($GenericDiaglogResult -eq 0) {
	Write-Host "You answered 'Ok'" -ForegroundColor GREEN
} else {
	Write-Host "You answered 'Cancel'" -ForegroundColor RED
}

# Generic MessageBox / DialogBox with YES - NO - Maybe, DEFAULT set to MAYBE (id -> 2)
$GenericDiaglogResultMultipleOptions = [Terminal.Gui.MessageBox]::Query("Title", "Message Body", 2, ("Yes", "No", "Maybe"))
Write-Host "Your Choice: $GenericDiaglogResultMultipleOptions"

# Error MessageBox with only ONE BUTTON. 
# Please not the comma BEFORE 'OK' -> it's necessary, as this needs to be an ARRAY, even it is has only one Element!
$ErrorQueryResult = [Terminal.Gui.MessageBox]::ErrorQuery("Error Title", "Error Message Body", (,"Ok"))
Write-Host "OK -> $ErrorQueryResult"

# Error MessageBox with multiple buttons
$ErrorQueryResult = [Terminal.Gui.MessageBox]::ErrorQuery("Error Title", "Error Message Body", ("Save", "Save as", "Cancel"))
Write-Host "Your Choice -> $ErrorQueryResult"

# Error MessageBox with multiple buttons, Default set to the Middle Button (index 1)
$ErrorQueryResult = [Terminal.Gui.MessageBox]::ErrorQuery("Error Title", "Error Message Body", 1, ("Save", "Save as", "Cancel"))
Write-Host "Your Choice -> $ErrorQueryResult"

# End the Message Loop and safely exit the app
[Terminal.Gui.Application]::ShutDown()
