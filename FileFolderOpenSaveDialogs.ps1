<#
	.SYNOPSIS
	FileFolderOpenSaveDialogs.ps1 - Shows various common dialogs.
	
	.LINK
	https://migueldeicaza.github.io/gui.cs/api/Terminal.Gui/Terminal.Gui.FileDialog.html
	
	.LINK
	https://migueldeicaza.github.io/gui.cs/api/Terminal.Gui/Terminal.Gui.OpenDialog.html

	.LINK
	https://migueldeicaza.github.io/gui.cs/api/Terminal.Gui/Terminal.Gui.SaveDialog.html

	.LINK
	https://migueldeicaza.github.io/gui.cs/api/Terminal.Gui/Terminal.Gui.OpenDialog.OpenMode.html

	.AUTHOR
	<peter@tergolape.at> Peter Kastberger
	
	.CHANGELOG
	2021-12-07, PeKa: Initial commit.
#>
Import-Module "$PSScriptRoot\NStack.dll" -ErrorAction Stop | Out-Null
Import-Module "$PSScriptRoot\Terminal.Gui.dll" -ErrorAction Stop | Out-Null

## Initialize
[Terminal.Gui.Application]::Init()

$WINDOW_TITLE = "FileDialog - Press Ctrl+Q to exit."

## Create a Window
$window = [Terminal.Gui.Window] @{
	Title = $WINDOW_TITLE
	Height = [Terminal.Gui.DIM]::Fill()
	Width = [Terminal.Gui.DIM]::Fill()
}
# ======================================================================
# Code goes here:
# ======================================================================

$filedlg = [Terminal.Gui.FileDialog] @{
	title = "Select File"
	prompt = "Prompt"
}
# Runs the Dialog immediately after opening the App's main window.
[Terminal.Gui.Application]::Run($filedlg)
# Was the dialog cancelled (True/False)
Write-Host "Was cancelled: $($filedlg.Canceled)"
Write-Host $filedlg.FilePath.ToString()



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