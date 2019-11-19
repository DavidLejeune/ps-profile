
Import-Module posh-git

# better prompt
$GitPromptSettings.DefaultPromptSuffix = '`n$('' >'' * ($nestedPromptLevel + 1)) '
#$GitPromptSettings.DefaultPromptPrefix = '[ $(hostname)] '
#$GitPromptSettings.DefaultPromptPrefix = '$(Get-Date -f "MM-dd HH:mm:ss") '
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
# create aliases
Set-Alias -Name touch -Value new-item
#$GitPromptSettings.DefaultPromptPrefi.ForegroundColor = [ConsoleColor]::Magenta
#$GitPromptSettings.DefaultPromptPrefix = '$(Write-Host $env:UserName"@"$env:ComputerName -ForegroundColor Blue -NoNewLine) '
$GitPromptSettings.DefaultPromptPrefix = '$(Write-Host $(Get-Date -f "dd-MM-yyyy HH:mm:ss")  -ForegroundColor Blue -NoNewLine) '
# custom function
function g {

  Write-Host '      ____              __        ' -ForegroundColor Yellow
  Write-Host '     / __ \   ____ _   / /      ___ ' -ForegroundColor Yellow
  Write-Host '    / / / /  / __ `/  / /      / _ \' -ForegroundColor Yellow
  Write-Host '   / /_/ /  / /_/ /  / /___   /  __/' -ForegroundColor Yellow
  Write-Host '  /_____/   \__,_/  /_____/   \___/ ' -ForegroundColor Yellow
  Write-Host ''
  Write-Host '    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+' -ForegroundColor Blue
  Write-Host '    |P|o|w|e|r|s|h|e|l|l| |C|L|I|' -ForegroundColor Blue
  Write-Host '    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+' -ForegroundColor Blue
  Write-Host ''
  Write-Host '  >> Author : David Lejeune' -ForegroundColor Red
  Write-Host "  >> Created : 29/08/2017" -ForegroundColor Red
  Write-Host ''
  Write-Host ' #####################################'  -ForegroundColor DarkGreen
  Write-Host ' #       GIT ADD , COMMIT & PUSH     #' -ForegroundColor DarkGreen
  Write-Host ' #          for LAZY PEOPLE          #' -ForegroundColor DarkGreen
  Write-Host ' #####################################' -ForegroundColor DarkGreen
  Write-Host ''

  $Host.UI.RawUI.ForegroundColor = 'gray'
  Write-Host "Showing the status"
  git status
  Write-Host ""


  $Host.UI.RawUI.ForegroundColor = 'darkgreen'
  Write-Host "Adding all the (changed) files"
  git add .
  Write-Host ""

  $Host.UI.RawUI.ForegroundColor = 'white'
  $message = Read-Host -Prompt 'Enter the commit message ';

  if ($message.length -gt 1)
  {

    $message = [char]34 + $message + [char]34
    $Host.UI.RawUI.ForegroundColor = 'yellow'
    git commit -m $message

    Write-Host ""

    $Host.UI.RawUI.ForegroundColor = 'white'
    Write-Host "Pushing that shit ....."
    $Host.UI.RawUI.ForegroundColor = 'magenta'
    git push dale master ;
    $Host.UI.RawUI.ForegroundColor = 'darkgray'
    git push origin master ;

    Write-Host ""

  }
  else
  {

      $Host.UI.RawUI.ForegroundColor = 'red'
        Write-Host ""
      Write-Host "That's not regular stupid, that's advanced stupid`nEnter a freaking message next time!"
        Write-Host ""
  }
$Host.UI.RawUI.ForegroundColor = 'white'
}
