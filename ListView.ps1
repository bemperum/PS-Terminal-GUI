<#
	.SYNOPSIS
	ListView.ps1 - Shows how to create an populate a ListView.
	
	.DESCRIPTION
	Create a ListObject (System.Collections.ArrayList) and bind it to
	a ListView-Component. Update the list and redraw. 
	
	.LINK
	https://migueldeicaza.github.io/gui.cs/api/Terminal.Gui/Terminal.Gui.ListView.html
	
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

# Create a .NET List (ArrayList) and toss in some items.
$myList= New-Object System.Collections.ArrayList # create an Empty .NET LIST
1..5 | ForEach-Object {
    [void]$myList.Add("Item # $_")
}

# The actual List-View:
$myListView = [Terminal.Gui.ListView] @{
    x = 1
    y = 1
    width = 40
    height = 20
}
# Set the the List as a source for the listView
$myListView.SetSource($myList)


# Make an Entry Field + Button to add more items:
$txtEntry = [Terminal.Gui.TextField] @{
    x = 55
    y = 1
    width = 40
    height = 4
    text = ""
}
$window.Add($txtEntry)

# A button for having an Event:
$btnAdd = [Terminal.Gui.Button] @{
    x = 55
    y = 3
    text = "Add Text"
}
$window.Add($btnAdd)
$btnAdd.add_Clicked({
    $txt = $txtEntry.text.ToString()
    $myList.Add($txt)
    # We need to Re-Assign the List to the View (fires a Redraw!)
    $myListView.SetSource($myList)
})
$window.Add($myListView)

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