<#
	.SYNOPSIS
	Progressbar with Timer
	
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

$prg = [Terminal.Gui.ProgressBar] @{
	x = 1
	y = 1
	Width = 30
	Height = 5
}

$tmr = {
	$prg.Pulse()
	return $true
}

[void][Terminal.Gui.Application]::Mainloop.AddTimeout([System.TimeSpan]::FromMilliseconds(50), $tmr)

$window.Add($prg)


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
