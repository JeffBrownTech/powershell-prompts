# powershell-prompts

This repository holds examples of how to create prompts inside the PowerShell console window.

To learn more about creating PowerShell prompts, check out my blog posts on the subject:

[How to Create Prompts in PowerShell](https://www.jeffbrown.tech/post/how-to-create-prompts-in-powershell)

[Creating Graphical Prompts Inside PowerShell](https://www.jeffbrown.tech/post/creating-graphical-prompts-inside-powershell)

## PromptMethod-Manual.ps1
This script holds an example function using what I call a "manual" method of creating a prompt, meaning more effort is put into creating help text and matching the color scheme of a regular PowerShell prompt.

## PromptMethod-dotNET.ps1
This script holds an example function using .NET Framework classes in order to create a prompt. The code is much cleaner and automatically includes logic for displaying help text and matching color schemes.

## Prompt-Method-Graphical.ps1
This scripts holds an example function using .NET Framework classes to create a graphical prompt. The logic to create the prompt is located in the New-YesNoPrompt function, which is called by the Remove-MyItem function to prompt the user to remove the file or not.