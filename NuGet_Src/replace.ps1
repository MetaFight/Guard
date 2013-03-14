$content = 'C:\Projects\Guard\NuGet_Src\content'

if ((Test-Path -path $content))
{
	Remove-Item -Recurse -Force $content
}
New-Item -Path $content -type directory

Copy-Item C:\Projects\Guard\CodeGuard\ $content -recurse -verbose -filter "*.cs"


$old = 'Seterlund.'
$new = '$rootnamespace$.'

Get-ChildItem $content -Recurse | Where {$_ -IS [IO.FileInfo]} |

% {

(Get-Content $_.FullName) -replace $old,$new | Set-Content $_.FullName

Write-Host "Processed: " + $_.FullName

}

