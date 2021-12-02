<#
	.SYNOPSIS
	CheckBox.ps1 - Shows how to create checkboxes
	
	.LINK
	https://migueldeicaza.github.io/gui.cs/api/Terminal.Gui/Terminal.Gui.CheckBox.html
	
	.AUTHOR
	<peter@tergolape.at> Peter Kastberger, 2021
	
	.CHANGELOG
	2021-12-01, peter: Initial Code
#>
Import-Module "$PSScriptRoot\NStack.dll" -ErrorAction Stop | Out-Null
Import-Module "$PSScriptRoot\Terminal.Gui.dll" -ErrorAction Stop | Out-Null

## Initialize
[Terminal.Gui.Application]::Init()

$WINDOW_TITLE = "CheckBoxes - Press Ctrl+Q to exit."

## Create a Window
$window = [Terminal.Gui.Window] @{
	Title = $WINDOW_TITLE
	Height = [Terminal.Gui.DIM]::Fill()
	Width = [Terminal.Gui.DIM]::Fill()
}

# Radio Group. Create some elements on the fly ...
1..8 | ForEach-Object {
    
    # Constructor
    $tmpCHK = [Terminal.Gui.CheckBox] @{
        X = 1
        Y = $PSItem
        text = "I want Nr. $PSItem"
        checked = $false
    }
    
    # Add the createed CheckBox to the Main-Window
    $window.Add($tmpCHK)

    # Add a Toggle-Event-Listener ...
    $tmpCHK.add_Toggled({
        Write-Host "Toggled the CheckBox!"
    })
}

# ======================================================================
#
# MAIN Message QUEUE
#
# ======================================================================
[Terminal.Gui.Application]::Top.Add($window)
[Terminal.Gui.Application]::Run()
# Script gets here, once the user clicks EXIT / CTRL+Q / ESC
[Terminal.Gui.Application]::ShutDown()
# End.