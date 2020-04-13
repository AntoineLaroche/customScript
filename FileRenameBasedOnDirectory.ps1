$location = Get-Location
$folderName = $location | Select-Object | ForEach-Object { $_.ProviderPath.Split("\")[-1] }
$listOfFilesToRename = Get-ChildItem -Path $location -Include ('*.bmp', '*.jpg', '*.png') -Recurse
$i = 1
$listOfFilesToRename | ForEach-Object {
    $index = '{0:d4}' -f $i
    [string]$newName = $index + "_" + $folderName + $_.extension
    Rename-Item -Path $_ -NewName $newName -Verbose
    $i++
}