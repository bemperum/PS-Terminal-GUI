# PS-Terminal-GUI
Collection of little PowerShell-Scripts to show the usage of Miguel De Icaza's 'GUI.cs' Library for .NET.

# Installation
Get NStack.dll, Terminal.Gui.dll and Terminal.Gui.xml and import them in your Scripts.
For the examples I've used the same directory. So it's easy to ship the Modules/Libs with
your own script. Importing is carried out via 
Import-Module "$PSScriptRoot\NStack.dll" -ErrorAction Stop | Out-Null
Import-Module "$PSScriptRoot\Terminal.Gui.dll" -ErrorAction Stop | Out-Null
then. So no fixed paths are necessary.

# Note
Currently one might miss some GUI-components or their functionality. This is not a 100% coverage of everything
that Terminal.Gui.dll offers and might never be.

# Sources
https://github.com/migueldeicaza/NStack
https://github.com/migueldeicaza/gui.cs

