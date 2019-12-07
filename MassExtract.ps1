$dira = "$PSScriptRoot\"
$dirb = "$PSScriptRoot\Extracted\" 
$list = Get-childitem -recurse $dira -include *.zip

foreach($file in $list) {
    $subdir = Get-ChildItem $file
    $subdir = $subdir.BaseName
    $newdir = "$dirb$subdir"

    Expand-Archive -Path $file -DestinationPath $newdir
    Remove-Item $file
}