$Platforms = @("DesktopGL", "Android", "iOS", "Content.Pipeline.Windows")
$Version = "1.0.0.0-jnoyola"
$Configuration = "Release"
$Bin = "..\MonoGame.Framework\bin"
$Output = ".\Output"

$scriptDir = Split-Path $MyInvocation.MyCommand.Path
$Bin = Join-Path $scriptDir $Bin
$Output = Join-Path $scriptDir $Output
$nugetExe = Join-Path $scriptDir ".\nuget.exe"

if(!(Test-Path -Path $Output )){
    New-Item -ItemType directory -Path $Output
}

foreach ($platform in $Platforms) {
    $nuspecFile = Join-Path $scriptDir ".\MonoGame.Framework.$platform.nuspec"
	& $nugetExe pack $nuspecFile -BasePath $Bin -OutputDirectory $Output -Properties "Configuration=$Configuration" -Version $Version
}