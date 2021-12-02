<#
	.SYNOPSIS
	Menu.ps1 - Show the usage of Menus.

	.LINK
	Links to useful resources
	
	.AUTHOR
	<peter@tergolape.at> Peter Kastberger, 2021
	
	.CHANGELOG
	2021-12-02, peter: Initial Code
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

# The Menu-BAR itself (Grey bar on top)
$menuBar = [Terminal.Gui.Menubar]::new()
$window.Add($menuBar)

# Menu-Item in the Bar 1
$fileMenuItem = [Terminal.Gui.MenuBarItem]::new()
$fileMenuItem.title = "File"
$fileMenuItem.action = {Write-Host "Clicked"}

# Menu-Item in the Bar 2
$EditMenuItem = [Terminal.Gui.MenuBarItem]::new()
$EditMenuItem.title = "Edit"
$EditMenuItem.action = $null

# Menu-Item Entries:
# MenuItem(ustring title, ustring help, Action action, Func<bool> canExecute = null, MenuItem parent = null, Key shortcut = Key.Null)
$key1 = [Terminal.Gui.Key]::A
$menu1Action = {
	Write-Host "Menu Item - executed! Exiting ..."
	[Terminal.Gui.Application]::RequestStop()
}
$menuItem1 = [Terminal.Gui.MenuItem]::new("Exit", "", $menu1Action, $null, $fileMenuItem, $key1)

$key2 = [Terminal.Gui.Key]::B
$menu2Action = {
	[Terminal.Gui.MessageBox]::Query("Menu Item", "You've executed a Menu-Action. Congrats!", @(,"Ok"))
}
$menuItem2 = [Terminal.Gui.MenuItem]::new("Show Me!", "Help", $menu2Action, $null, $fileMenuItem, $key2)

# We add them upside down - the last Item is EXIT then. :)
$fileMenuItem.Children += $menuItem2 # Item calling the message box
$fileMenuItem.Children += $menuItem1 # Item that is exiting the applicaiton

$menuBar.menus += $fileMenuItem
$menuBar.menus += $EditMenuItem

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