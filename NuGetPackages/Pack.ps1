$Packages = @(
"Framework.DesktopGL",
"Framework.Android",
"Framework.iOS",
"Framework.Content.Pipeline",
"Framework.Content.Pipeline.Windows",
"Content.Builder",
"Content.Builder.Windows"
)

$Version = "3.7.1.11"
$Configuration = "Release"
$Bin = "..\MonoGame.Framework\bin"
$Output = ".\Output"

$scriptDir = Split-Path $MyInvocation.MyCommand.Path
$Bin = Join-Path $scriptDir $Bin
$Output = Join-Path $scriptDir $Output
$nugetExe = "nuget.exe"

if(!(Test-Path -Path $Output )){
    New-Item -ItemType directory -Path $Output
}

foreach ($package in $Packages) {
    $nuspecFile = Join-Path $scriptDir ".\MonoGame.$package.nuspec"
	& $nugetExe pack $nuspecFile -BasePath $Bin -OutputDirectory $Output -Properties "Configuration=$Configuration" -Version $Version
}