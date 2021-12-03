<#
	.SYNOPSIS
	CheckBox.ps1 - Shows how to create checkboxes
	
	.LINK
	https://migueldeicaza.github.io/gui.cs/api/Terminal.Gui/Terminal.Gui.DateField.html

    .LINK
    https://migueldeicaza.github.io/gui.cs/api/Terminal.Gui/Terminal.Gui.TimeField.html
	
	.AUTHOR
	<peter@tergolape.at> Peter Kastberger, 2021
	
	.CHANGELOG
	2021-12-03, peter: Initial Code
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
$gadgets = @() # List for holding the gadgets for easier adding it to the window

$txt1 = "Short Date (Default):"
$lbl1 = [Terminal.GUI.Label] @{
    X = 1
    Y = 1
    text = $txt1
}
$gadgets += $lbl1

$DateTime1 = [Terminal.Gui.DateField] @{
    X = $txt1.length + 1
    Y = 1
    date = Get-Date
}
$gadgets += $Datetime1

$txt2 = "Long Date:"
$lbl2 = [Terminal.Gui.Label] @{
    X = 1
    Y = 2
    text = $txt2
}
$gadgets += $lbl2

$DateTime2 = [Terminal.Gui.DateField] @{
    X = $txt2.Length + 1
    Y = 2
    date = Get-Date
    IsShortFormat = [bool]0
}
$gadgets += $DateTime2

$txt3 = "Short Time (Default):"
$label3 = [Terminal.Gui.Label] @{
    X = 1
    Y = 3
    text = $txt3
}
$gadgets += $label3

$DateTime3 = [Terminal.Gui.TimeField] @{
    X = $txt3.Length + 1
    Y = 3
    Time = $(Get-Date).TimeOfDay
}
$gadgets += $DateTime3

$txt4 = "Long Time:"
$label4 = $label3 = [Terminal.Gui.Label] @{
    X = 1
    Y = 4
    text = $txt4
}
$gadgets += $label4

$DateTime4 = [Terminal.Gui.TimeField] @{
    X = $txt4.Length + 1
    Y = 4
    IsShortFormat = $false
    Time = $(Get-Date).TimeOfDay
}
$gadgets += $DateTime4

# Events
# DateFields implement the DateChanged-Event,
# TimeFields implement the TimeChanged-Event.
# They are fired, when the user changes values.

# A Datefield:
$DateTime1.add_DateChanged({Write-Host "Date changed to $($DateTime1.Date)"})

# A TimeField
$DateTime3.add_TimeChanged({Write-Host "Time changed to: $($DateTime3.Time)"})

# Add all gadgets to the Window
$gadgets | ForEach-Object { $window.Add($PSItem) }


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