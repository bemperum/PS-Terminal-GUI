<#
	.SYNOPSIS
	What it does in one sentence
	
	.LINK
	https://migueldeicaza.github.io/gui.cs/api/Terminal.Gui/Terminal.Gui.TextView.html
	
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

$txtEditor = [Terminal.Gui.TextView] @{
	X=1
	Y=1
	Height = [Terminal.Gui.DIM]::Fill()
	Width = [Terminal.Gui.DIM]::Fill()
}

$txtEditor.text = "Hello World"
$txtEditor.WordWrap = $true

$window.Add($txtEditor)

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