<#
	.SYNOPSIS
	ComboBox.ps1 - Shows how to create Comboboxes
	
	.DESCRIPTION
	Long description of the script
	
	.NOTES
	Some other information you want to provide
	
	.PARAMETER A 
	Describes what a specific parameter does
	
	.COMPONENT
	Information about required modules
	
	.EXAMPLE
	Shows how the Script is used.

	.LINK
	https://migueldeicaza.github.io/gui.cs/api/Terminal.Gui/Terminal.Gui.ComboBox.html
	
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
# ===========================================================

# Create a .NET List (ArrayList) and toss in some items.
$myList= New-Object System.Collections.ArrayList # create an Empty .NET LIST
1..5 | ForEach-Object {
    [void]$myList.Add("Item # $_")
}

# The combobox
$cmbx = [Terminal.Gui.ComboBox] @{
    text = "hello World"
    X = 1
    Y = 1
    Width = 25
    Height = 5
}
# Bind the created ArrayList to the ComboBox
$cmbx.SetSource($myList)

$window.Add($cmbx)

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