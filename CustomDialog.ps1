<#
	.SYNOPSIS
	CustomDialog.ps1 - Examples of Using Custom Overlay Dialogs with Terminal.Gui in PowerShell
	
	.DESCRIPTION
    Open a Custom Form or Custom Dialog above the Main-Window.
	
	.COMPONENT
	You need at least NStack.dll and Terminal.Gui.dll to have this work.
	
	.EXAMPLE
	Just run .\CustomDialog.ps1 and make soure you are able to load the modules.

	.LINK
	https://migueldeicaza.github.io/gui.cs/api/Terminal.Gui/Terminal.Gui.Dialog.html

	.AUTHOR
	<peter@tergolape.at> Peter Kastberger, 2021
	
	.CHANGELOG
	2021-12-01, peter: Initial Code
#>

# Import NStack & Terminal.GUI DLL to have it.
# Use FQNs to address Namespace-Objects!
Import-Module "$PSScriptRoot\NStack.dll" | Out-Null
Import-Module "$PSScriptRoot\Terminal.Gui.dll" | Out-Null

$WindowTitle = "Custom Dialog"

#
# UP-FRONT Declaration of the Dialog:
function Show-MyDialog1() {
    #
    # CREATE THE DIALOG
	$uName = $env:USERNAME
    $pc = $env:COMPUTERNAME
    $text = "`n Hello there!`n"
    $text = $text + " You're logged in as user '$uName' on the Client '$pc'.`n"
    $text = $text + " We're happy to have YOU here! Enjoy!"

	$dialog = [Terminal.Gui.Dialog] @{
		title="This is  Custom Dialog 1"
		text = $text
	}

	# Create the Button to Close the Dialog
	$btnOK = [Terminal.Gui.Button] @{Text = "OK"}
	# Add EventHandler to this button
	$btnOK.add_Clicked({[Terminal.Gui.Application]::RequestStop()})
	# Add the Button to the Dialog-Window
	$dialog.AddButton($btnOK)
	# Run the Dialog
	[Terminal.Gui.Application]::Run($dialog)
}

function Show-MyDialog2() {
    #
    # CREATE THE DIALOG

    $text = "`n It's different from the first one! It has NO BORDER!"
    $text = $text + "`n Other Options are:"
	$text = $text + "`n - [Terminal.Gui.Borderstyle]:Single"
	$text = $text + "`n - [Terminal.Gui.Borderstyle]:Double"

    $dialog = [Terminal.Gui.Dialog] @{
		title="This is Custom Dialog 2"
		text = $text
	}

    $dialog.border.BorderStyle = [Terminal.Gui.BorderStyle]::None # None, Single, Double

	# Create the Button to Close the Dialog
	$btnOK = [Terminal.Gui.Button] @{Text = "OK"}
	# Add EventHandler to this button
	$btnOK.add_Clicked({[Terminal.Gui.Application]::RequestStop()})
	# Add the Button to the Dialog-Window
	$dialog.AddButton($btnOK)
	# Run the Dialog
	[Terminal.Gui.Application]::Run($dialog)
}



## Initialize 
[Terminal.Gui.Application]::Init()

## Create a Window with Label & Button
# Window
$window = [Terminal.Gui.Window] @{
	Title = $WindowTitle
	Height = [Terminal.GUI.Dim]::Fill()
	Width = [Terminal.GUI.Dim]::Fill()
}

# The Label
$label = [Terminal.Gui.Label] @{
	X = [Terminal.Gui.Pos]::Center(); Y = [Terminal.Gui.Pos]::Center()-5
	Width = 25
	Text = "`nClick Buttons to Open the Custom-Dialogs"
}

# Add Elements to Parent Container
$window.Add($label)

# ------------------------------------------------------------------------
# The Buttons
# 1
$button1 = [Terminal.Gui.Button] @{
	X = [Terminal.Gui.Pos]::Center()
    Y = [Terminal.Gui.Pos]::Center() + 1
	Text = "Open Custom-Dialog 1"
}
# Add Elements to Parent Container
$window.Add($button1)
# Event-Handler, that calls Show-MyDialog
$button1.add_Clicked({Show-MyDialog1})


# 2
$button2 = [Terminal.Gui.Button] @{
	X = [Terminal.Gui.Pos]::Center()
    Y = [Terminal.Gui.Pos]::Center() + 2
	Text = "Open Custom-Dialog 2"
}
# Add Elements to Parent Container
$window.Add($button2)
# Event-Handler, that calls Show-MyDialog
$button2.add_Clicked({Show-MyDialog2})

# =========================================================================
$btnExit = [Terminal.Gui.Button] @{
    X = [Terminal.Gui.Pos]::Center()
    Y = [terminal.Gui.Pos]::Center() + 6
    Text = "Exit"
}

$window.Add($btnExit)
$btnExit.add_Clicked({[Terminal.Gui.Application]::RequestStop()})

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