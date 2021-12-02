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
	<peter@tergolape.at> Peter Kastberger, 2021
	
	.CHANGELOG
	2021-12-01, peter: Initial Code
#>
Import-Module "$PSScriptRoot\NStack.dll" -ErrorAction Stop | Out-Null
Import-Module "$PSScriptRoot\Terminal.Gui.dll" -ErrorAction Stop | Out-Null

## Initialize
[Terminal.Gui.Application]::Init()

$WINDOW_TITLE = "Text Editor - Press Ctrl+Q to exit."

## Create a Window
$window = [Terminal.Gui.Window] @{
	Title = $WINDOW_TITLE
	Height = [Terminal.Gui.DIM]::Fill()
	Width = [Terminal.Gui.DIM]::Fill()
}
# ======================================================================


# Frame View ( Group Box )
$frm = [Terminal.Gui.FrameView] @{
	title = "GroupBox - hold this:"
    x = 1
    y = 1
    width = 40
    height = 20
}

$aLabel = [Terminal.Gui.Label] @{
    x = 1
    y = 1
    width = 30
    height = 5
    text = "Enter Password:"
}

$aPWD = [Terminal.Gui.TextField] @{
    X = 1
    y = 2
    width = [Terminal.Gui.DIM]::Fill()
    height = 5
    secret = $true
}


$frm.Add($aLabel)
$frm.Add($aPWD)
$window.Add($frm)

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