<#
	.SYNOPSIS
	Show different Border styles
	
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

$radioGroup = [Terminal.Gui.RadioGroup] @{
	Text = "Group Text"
	radioLabels = ("Double", "Double+3D", "Single")
	SelectedItem = 2
}; $window.Add($radioGroup)

$frmToChange = [Terminal.Gui.FrameView] @{
	title = "The Frame to be changed"
	x = 30
	y = 0
	width = 30
	height = 20
}; $window.Add($frmToChange)


# Event for the RADIO Group to CHANGE the FRAME-STYLE
$radioGroup.add_SelectedItemChanged({
	$item = $radioGroup.SelectedItem
	
	if($item -eq 0) { 
		$frmToChange.Border.BorderStyle = [Terminal.Gui.BorderStyle]::Double 
		$frmToChange.Border.Effect3D = $false	
	}
	if($item -eq 1) { 
		$frmToChange.Border.BorderStyle = [Terminal.Gui.BorderStyle]::Double
		$frmTochange.Border.Effect3D = $true
	}
	if($item -eq 2) { 
		$frmToChange.Border.BorderStyle = [Terminal.Gui.BorderStyle]::Single
		$frmTochange.Border.Effect3D = $false
	 }

})

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
