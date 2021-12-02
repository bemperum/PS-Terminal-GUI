<#
	.SYNOPSIS
	ScrollView.ps1 - Create a Textfield with ScrollBars around it.

	.LINK
	https://migueldeicaza.github.io/gui.cs/api/Terminal.Gui/Terminal.Gui.ScrollView.html
	
	.AUTHOR
	<peter@tergolape.at>, Peter Kastberger
	
	.CHANGELOG
	2021-12-02, PeKa: Initial Commit
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

$content = @"
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor 
invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et
justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem
ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos
et accusam et justo duo dolores et ea rebum. Stet clita
kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
"@
$txtEditor = [Terminal.Gui.TextView] @{
	X=1
	Y=1
	Height = 50
	Width = 50
}
$txtEditor.WordWrap = [bool]1
$txtEditor.text = $content

# A ScrollView to hold the list
$scrollView = [Terminal.Gui.ScrollView] @{
    X = 1
    Y = 1
    width = 45
    height = 20
    text = "Foobardingens"
}
$scrollView.contentSize = [Terminal.Gui.Size]::new(50, 50)
$scrollView.ShowVerticalScrollIndicator = [bool]1
$scrollView.ShowHorizontalScrollIndicator = [bool]1


$scrollView.Add($txtEditor)
$window.Add($scrollView)

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