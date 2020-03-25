function Remove-MyItem {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, Position = 1)]
        [string]
        $Path
    )

    $item = Get-Item -Path $Path

    # Create prompt body
    $title = "Confirm"
    $message = "Are you sure you want to perform this action?`nPerforming the operation ""Remove File"" on target $($item.FullName)."
    
    # Create answers
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Continue with only the next step of the operation."
    $yesToAll = New-Object System.Management.Automation.Host.ChoiceDescription "Yes to &All","Continue with all the steps of the operation."
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "Skip this operation and proceed with the next operation."
    $noToAll = New-Object System.Management.Automation.Host.ChoiceDescription "No to Al&l", "Skip this operation and all subsequent operations."
    $suspend = New-Object System.Management.Automation.Host.ChoiceDescription "&Suspend", "Pause the current pipeline and return to the command prompt. Type ""exit"" to resume the pipeline."
    
    # Create ChoiceDescription with answers
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $yesToAll, $no, $noToAll, $suspend)

    # Show prompt and save user's answer to variable
    $response = $host.UI.PromptForChoice($title, $message, $options, 0)

    # Perform action based on answer
    switch ($response) {
        0 { Remove-Item -Path $item.FullName; break } # Yes
        1 { Remove-Item -Path $item.FullName; break } # Yes to All
        2 { return; break } # No
        3 { return; break } # No to ALL
        4 { return; break } # Suspend
    }
}