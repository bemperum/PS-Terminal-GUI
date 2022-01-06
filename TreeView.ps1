<#
	.SYNOPSIS
	Fill and show a treeview
		
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
# ----------------------------------------------------------------------
#

$treeView = [Terminal.Gui.TreeView] @{
	x = 0
	y = 0
	Width = [Terminal.Gui.DIM]::Percent(50)
	Height = [Terminal.Gui.DIM]::Fill()
}; $window.Add($treeView)

$root = [Terminal.Gui.Trees.TreeNode]::new("Root-Node")

# Add Items and Sub-Items:
1..25 | ForEach-Object { 
	$child =[Terminal.Gui.Trees.TreeNode]::new("Child Item Nr. $_")
	1..5 | ForEach-Object { $child.Children.Add([Terminal.Gui.Trees.TreeNode]::new("Grand Child $_")) }
	$root.Children.Add($child)
}

$treeView.AddObject($root)
$treeView.ExpandAll()

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
