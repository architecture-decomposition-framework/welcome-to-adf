# Use the ADF tool libraries for diagrams.net with the VS Code plugin <!-- omit in toc -->

Part of [Documentation-as-code (Architecture Decomposition Framework)](Doc-as-code.md)

## Configure ADF tool libraries

To configure the [ADF tool libraries for diagrams.net](https://github.com/architecture-decomposition-framework/adf-diagramsnet) with the VS Code plugin, you have to download the xml file from the libraries directory to your computer and then configure them in the VS Code settings.json:

```json
  "hediet.vscode-drawio.customLibraries": [
    {
      "file": "c:\\Misc\\adf-diagramsnet\\libraries\\ADF_SW@RT.xml",
      "libName": "ADF SW@RT"
    },
    {
      "file": "c:\\Misc\\adf-diagramsnet\\libraries\\ADF_Env@RT.xml",
      "libName": "ADF Env@RT"
    },
    {
      "file": "c:\\Misc\\adf-diagramsnet\\libraries\\ADF_SW@DT.xml",
      "libName": "ADF SW@DT"
    },
    {
      "file": "c:\\Misc\\adf-diagramsnet\\libraries\\ADF_Env@DT.xml",
      "libName": "ADF Env@DT"
    }
  ]
```

Note that this is an example configuration for a Windows machine. Replace the paths with the correct ones for your computer.

Heads up: If even one of the file does not exist or the configuration has some error, the Diagrams.net plugin won't start at all. So double check everything!

## Working with dark mode

Developers often use a dark theme for there IDE. This setting is also respected by the Diagrams.net plugin in VS Code which then renders the diagrams different from they look on the Git server (in light mode).

The recommended approach is to use a light theme for the Diagrams.net plugin only by configuring 

```json
  "hediet.vscode-drawio.theme": "Kennedy",
```

in the settings.json of VS Code.

Also, diagrams with transparent background might look unreadable when viewed in dark mode. Therefore make sure, that in every diagram, the background is set to white as demonstrated in [this screenshot](assets/digramsnet_darkmode_fix.png).

## Footnote

This document was written by Johannes Schneider. You can use all material freely under the [CC BY-SA 4.0 license](https://creativecommons.org/licenses/by-sa/4.0/).
