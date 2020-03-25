function Remove-MyItem {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, Position = 1)]
        [string]
        $Path
    )

    $item = Get-Item -Path $Path

    $confirmString = "`nConfirm"
    $questionString = "Are you sure you want to perform this action?"
    $operationString = "Performing the operation ""Remove File"" on target $($item.FullName)."
    $yesResponse = "[Y] Yes"
    $yesToAllResponse = "[A] Yes to All"
    $noResponse = "[N] No"
    $noToAllResponse = "[L] No to All"
    $suspendResponse = "[S] Suspend"
    $helpText = "[?] Help (default is ""Y"")"
    $helpResponse = '''
Y - Continue with only the next step of the operation.
A - Continue with all the steps of the operation.
N - Skip this operation and proceed with the next operation.
L - Skip this operation and all subsequent operations.
S - Pause the current pipeline and return to the command prompt. Type "exit" to resume the pipeline.
'''

    Write-Host $confirmString -ForegroundColor White
    Write-Host $questionString
    Write-Host $operationString
    Write-Host $yesResponse -ForegroundColor Yellow -NoNewline
    Write-Host " $yesToAllResponse  $noResponse  $noToAllResponse  $suspendResponse" -ForegroundColor White -NoNewline
    Write-Host "  $($helpText):" -NoNewline
    $userResponse = (Read-Host).ToUpper()

    switch ($userResponse) {
        "Y" { Remove-Item -Path $item.FullName; break }
        "A" { Remove-Item -Path $item.FullName; break }
        "N" { return; break }
        "L" { return; break }
        "S" { return; break }
        "?" { $helpResponse; break }
        Default { Write-Host "Invalide Resposne"; break }
    }
}