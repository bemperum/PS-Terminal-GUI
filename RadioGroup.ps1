<#
	.SYNOPSIS
	RadioGroup.ps1 - Show the usage of Radiobuttons and the Group

	.LINK
	https://migueldeicaza.github.io/gui.cs/api/Terminal.Gui/Terminal.Gui.RadioGroup.html
	
	.AUTHOR
	<peter@tergolape.at> Peter Kastberger, 2021
	
	.CHANGELOG
	2021-12-01, peter: Initial Code
#>
Import-Module "$PSScriptRoot\NStack.dll" -ErrorAction Stop | Out-Null
Import-Module "$PSScriptRoot\Terminal.Gui.dll" -ErrorAction Stop | Out-Null

## Initialize
[Terminal.Gui.Application]::Init()

$WINDOW_TITLE = "RadioGroup - Press Ctrl+Q to exit."

## Create a Window
$window = [Terminal.Gui.Window] @{
	Title = $WINDOW_TITLE
	Height = [Terminal.Gui.DIM]::Fill()
	Width = [Terminal.Gui.DIM]::Fill()
}

# Radio Group
$radioGroup = [Terminal.Gui.RadioGroup] @{
	Text = "The Text"
	radioLabels = ("Apple", "Banana", "Peach")
	SelectedItem = 2
}
$window.Add($radioGroup)
$radioGroup.add_SelectedItemChanged({
	$item = $radioGroup.SelectedItem
	$themLabels = $radioGroup.RadioLabels
	[Terminal.Gui.MessageBox]::Query("Items Changed!", "You've changed the items to Index:'$item'-Name: $($themLabels[$item].ToString())", (,"Ok"))
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