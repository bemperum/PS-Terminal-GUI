<#
	.SYNOPSIS
	What it does in one sentence
	
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
	Links to useful resources
	
	.AUTHOR
	Lists the initial and the following major authors
	
	.CHANGELOG
	<Date>, <Name>: Log
#>
Import-Module "$PSScriptRoot\NStack.dll" -ErrorAction Stop | Out-Null
Import-Module "$PSScriptRoot\Terminal.Gui.dll" -ErrorAction Stop | Out-Null

## Initialize
[Terminal.Gui.Application]::Init()

$WINDOW_TITLE = "Hello World! - Press Ctrl+Q to exit."

## Create a Window
$window = [Terminal.Gui.Window] @{
	Title = $WINDOW_TITLE
	Height = [Terminal.Gui.DIM]::Fill()
	Width = [Terminal.Gui.DIM]::Fill()
}
# ======================================================================
# Code goes here:
# ======================================================================




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