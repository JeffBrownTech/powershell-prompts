Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Remove-MyItem {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, Position = 1)]
        [string]
        $Path
    )

    $item = Get-Item -Path $Path

    $params = @{
        PromptTitle = "Confirm?";
        PromptMessage = "Are you sure you want to perform this action?`n`nPerforming the operation ""Remove File"" on target $($item.FullName).";
    }    

    $response = (New-YesNoPrompt @params).ShowDialog()

    switch ($response) {
        ([System.Windows.Forms.DialogResult]::Yes) { Write-Output "Removing file..."; break }
        ([System.Windows.Forms.DialogResult]::No) { Write-Output "Leaving file...";  break }
    }
}

function New-YesNoPrompt {
    [CmdletBinding()]
    [OutputType([System.Windows.Forms.Form])]
    param (
        [Parameter(Mandatory)]
        [string]
        $PromptTitle,

        [Parameter(Mandatory)]
        [string]
        $PromptMessage
    )

    $form = New-Object System.Windows.Forms.Form
    $form.Text = $PromptTitle
    $form.Size = New-Object System.Drawing.Size(300, 200)
    $form.StartPosition = 'CenterScreen'

    $yesButton = New-Object System.Windows.Forms.Button
    $yesButton.Location = New-Object System.Drawing.Point(60, 120)
    $yesButton.Size = New-Object System.Drawing.Size(75, 23)
    $yesButton.Text = 'Yes'
    $yesButton.DialogResult = [System.Windows.Forms.DialogResult]::Yes
    $form.AcceptButton = $yesButton
    $form.Controls.Add($yesButton)

    $noButton = New-Object System.Windows.Forms.Button
    $noButton.Location = New-Object System.Drawing.Point(165, 120)
    $noButton.Size = New-Object System.Drawing.Size(75, 23)
    $noButton.Text = 'No'
    $noButton.DialogResult = [System.Windows.Forms.DialogResult]::No
    $form.CancelButton = $noButton
    $form.Controls.Add($noButton)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10, 20)
    $label.Size = New-Object System.Drawing.Size(280, 60)
    $label.Text = $PromptMessage
    $form.Controls.Add($label)

    # $textBox = New-Object System.Windows.Forms.TextBox
    # $textBox.Location = New-Object System.Drawing.Point(10,100)
    # $textBox.Size = New-Object System.Drawing.Size(260,20)
    # $form.Controls.Add($textBox)

    $form.Topmost = $true

    return $form
}