Import-Module oh-my-posh
Set-Theme tehrob

function Get-GitStatus { & git status $args }
New-Alias -Name gst -Value Get-GitStatus
function Set-GitCommit { & git commit $args }
New-Alias -Name c -Value Set-GitCommit
function Update-GitAdd { & git add $args }
New-Alias -Name ga -Value Update-GitAdd
function Update-GitCheckout { & git checkout $args }
New-Alias -Name gco -Value Update-GitCheckout
function Get-GitBranch { & git branch $args }
New-Alias -Name gb -Value Get-GitBranch
