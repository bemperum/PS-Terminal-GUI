<#
	.SYNOPSIS
	StatusBar.ps1 - Shows how to create a StatusBar with Items
	
	.DESCRIPTION
	Create a StatusBar with Items and Hotkeys, as known from Midnight-Commander & Co.

	.LINK
	https://migueldeicaza.github.io/gui.cs/api/Terminal.Gui/Terminal.Gui.StatusBar.html
	
	.AUTHOR
	<peter@tergolape.at> Peter Kastberger, 2021
	
	.CHANGELOG
	2021-12-01, peter: Initial Code
#>
Import-Module "$PSScriptRoot\NStack.dll" -ErrorAction Stop | Out-Null
Import-Module "$PSScriptRoot\Terminal.Gui.dll" -ErrorAction Stop | Out-Null

## Initialize
[Terminal.Gui.Application]::Init()

$WINDOW_TITLE = "StatusBar - Press Ctrl+Q to exit."

## Create a Window
$window = [Terminal.Gui.Window] @{
	Title = $WINDOW_TITLE
	Height = [Terminal.Gui.DIM]::Fill()
	Width = [Terminal.Gui.DIM]::Fill()
}

# ======================================================================
#
$label = [Terminal.Gui.Label] @{
	X = 1
    Y = 2
	Width = [Terminal.GUI.Dim]::Fill()
	Text = "Use the Mouse or the highlighted Hotkeys to Use the StatusBar functions."
}
$window.Add($label)

# Create the StatusBar and it's items
$StatusBar = [Terminal.Gui.StatusBar] @{}

# Why the items have to be created in such a way? I don't know. :)
# The Actions / Lambda-Functions?
$itemAction1 = { [Terminal.Gui.MessageBox]::Query("A friendly message", "Thank you for being awesome!", (,"Ok")) }
$itemAction2 = { Write-Host "This was F2" }
$itemAction3 = { [Terminal.Gui.Application]::RequestStop() }

# The Items
$item1 = [Terminal.Gui.StatusItem]::new([Terminal.Gui.Key]::F1, "~F1~ Help", $itemAction1)
$item2 = [Terminal.Gui.StatusItem]::new([Terminal.Gui.Key]::F2, "~F2~ DoesNothing", $itemAction2)
$item3 = [Terminal.Gui.StatusItem]::new([Terminal.Gui.Key]::F3, "~F3~ Exit", $itemAction3)

# Adding them to the Bar
$StatusBar.AddItemAt(0, $item1)
$StatusBar.AddItemAt(1, $item2)
$StatusBar.AddItemAt(2, $item3)

# Add Bar to the Window
$window.Add($StatusBar)

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