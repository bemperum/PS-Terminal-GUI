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
	Lists the initial and the following major authors
	
	.CHANGELOG
	<Date>, <Name>: Log
#>
Import-Module "$PSScriptRoot\NStack.dll" -ErrorAction Stop | Out-Null
Import-Module "$PSScriptRoot\Terminal.Gui.dll" -ErrorAction Stop | Out-Null

## Initialize
[Terminal.Gui.Application]::Init()

$WINDOW_TITLE = "TabView Window - Press Ctrl+Q to exit."

## Create a Window
$window = [Terminal.Gui.Window] @{
	Title = $WINDOW_TITLE
	Height = [Terminal.Gui.DIM]::Fill()
	Width = [Terminal.Gui.DIM]::Fill()
}
# ======================================================================
# Code goes here:
# ======================================================================
$TabContainer = [Terminal.Gui.TabView] @{
    X = 0
    Y = 0
    Width = [Terminal.Gui.DIM]::Fill()
    Height = [Terminal.Gui.DIM]::Fill()
}

$TabView1 = [Terminal.Gui.TabView+Tab] @{
    text = "Tab 1"    
    View = $null
}
$TabContainer.AddTab($TabView1, $true) 

$TabView2 = [Terminal.Gui.TabView+Tab] @{
    text = "Tab 2"    
    View = $null
}
$TabContainer.AddTab($TabView2, $false) 

$TabView3 = [Terminal.Gui.TabView+Tab] @{
    text = "Tab 3"    
    View = $null
}
$TabContainer.AddTab($TabView3, $false)

# Events:
# Fired, when user changes Tab via Mouse or Keyboard (Arrow Keys)
$TabContainer.add_SelectedTabChanged({
    Write-Host "Tab changed to $($TabContainer.SelectedTab.text.ToString())"
})

$window.Add($TabContainer)
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