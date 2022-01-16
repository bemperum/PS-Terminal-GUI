<#
	.SYNOPSIS
	Show how to Switch Colors
	
	.AUTHOR
	<peter@tergolape.at> Peter Kastberger
	
	.CHANGELOG
	2022-01-06, PeKa: Initial commit.
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

#$window.ColorScheme = [Terminal.Gui.Colors]::Toplevel
#$window.ColorScheme = [Terminal.Gui.Colors]::Base
#$window.ColorScheme = [Terminal.Gui.Colors]::Menu
#$window.ColorScheme = [Terminal.Gui.Colors]::Dialog
#$window.ColorScheme = [Terminal.Gui.Colors]::Error

$frmChg = [Terminal.Gui.FrameView] @{
	title = 'Use Buttons to change Colors'
	x = 0
	y = 1
	width = [Terminal.Gui.Dim]::Fill()
	height = [Terminal.Gui.Dim]::Percent(20) 
}

$btnChgToplevel = [Terminal.Gui.Button] @{
	text="Colors::TopLevel"
	x = 0
	y = 0
	width = [Terminal.Gui.Dim]::Fill()
	height = 1
}; $frmChg.Add($btnChgToplevel)
$btnChgToplevel.add_clicked({$window.ColorScheme = [Terminal.Gui.Colors]::Toplevel})

$btnChgBase = [Terminal.Gui.Button] @{
	text="Colors::Base"
	x = 0
	y = 1
	width = [Terminal.Gui.Dim]::Fill()
	height = 1
}; $frmChg.Add($btnChgBase)
$btnChgBase.add_clicked({$window.ColorScheme = [Terminal.Gui.Colors]::Base})

$btnChgMenu = [Terminal.Gui.Button] @{
	text="Colors::Menu"
	x = 0
	y = 2
	width = [Terminal.Gui.Dim]::Fill()
	height = 1
}; $frmChg.Add($btnChgMenu)
$btnChgMenu.add_clicked({$window.ColorScheme = [Terminal.Gui.Colors]::Menu})

$btnChgDialog = [Terminal.Gui.Button] @{
	text="Colors::Dialog"
	x = 0
	y = 3
	width = [Terminal.Gui.Dim]::Fill()
	height = 1
}; $frmChg.Add($btnChgDialog)
$btnChgDialog.add_clicked({$window.ColorScheme = [Terminal.Gui.Colors]::Dialog})

$btnChgError = [Terminal.Gui.Button] @{
	text="Colors::Error"
	x = 0
	y = 4
	width = [Terminal.Gui.Dim]::Fill()
	height = 1
}; $frmChg.Add($btnChgError)
$btnChgError.add_clicked({$window.ColorScheme = [Terminal.Gui.Colors]::Error})

# 
$window.Add($frmChg)

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
