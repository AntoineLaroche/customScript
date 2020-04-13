$location = Get-Location
$folderName = $location | Select-Object | ForEach-Object { $_.ProviderPath.Split("\")[-1] }
$listOfFilesToRename = Get-ChildItem -Path $location -Exclude *.ps1
$i = 1
$listOfFilesToRename | ForEach-Object {
    $index = '{0:d4}' -f $i
    $extension = $_.split(".")[1]
    [string]$newName = $index + "_" + $folderName + "." + $extension
    Rename-Item -Path $_ -NewName $newName -Verbose
    $i++
}