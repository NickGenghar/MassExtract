$dira = "$PSScriptRoot\"
$dirb = "$PSScriptRoot\Extracted\" 
$list = Get-childitem -recurse $dira -include *.zip

foreach($file in $list) {
    $testdir = Get-ChildItem $file
    $testdir = $testdir.BaseName
    $newdir = "$dirb$testdir"

    Expand-Archive -Path $file -DestinationPath $newdir
    Remove-Item $file
}