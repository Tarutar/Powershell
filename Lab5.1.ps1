$foldername = Read-Host -Prompt "Input name for the file server folder"
$folderpath = Read-Host -Prompt "Input path for the file server folder"
$location = $folderpath + "\" + $foldername
Write-Host "The file server folder will be stored in $folderpath"
$userconfirm = Read-Host -Prompt "Are you sure? (y/n)"

if ($userconfirm -eq 'y') {
    New-Item -Name $foldername -ItemType Directory -Path $folderpath

} 
else {
    Write-Host "Operation has been cancelled."

}

$fileserver = Import-Csv D:\Powershell\employeelist.csv
$directory = Get-ChildItem $location
$syncdata = Read-Host -Prompt "Do you want to sync data from the file server? (y/n)"

if ($syncdata -eq 'y'){
    foreach ($name in $fileserver){
        New-Item -ItemType Directory -Path $folderpath -Name $name.Name.Replace(' ','').ToLower()

    }
    foreach ($employee in $directory){
        New-Item -Path $location -Name Hello.txt -Value "Welcome message!"

    }
}
else {
    Write-Host "Operation has been cancelled."

}