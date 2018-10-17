$foldername = Read-Host -Prompt "Input name for the file server folder"
$folderpath = Read-Host -Prompt "Input path for the file server folder (e.g C:\Program Files)"
$location = $folderpath + "\" + $foldername + "\"
Write-Host "The file server folder will be stored in $folderpath"
$userconfirm = Read-Host -Prompt "Are you sure? (y/n)"

if ($userconfirm -eq 'y') {
    New-Item -Name $foldername -ItemType Directory -Path $folderpath

} 
else {
    Write-Host "Operation has been cancelled."

}

$fileserver = Import-Csv D:\Powershell\employeelist.csv
$syncdata = Read-Host -Prompt "Do you want to sync data from the file server? (y/n)"

if ($syncdata -eq 'y'){
    foreach ($name in $fileserver){
        New-Item -ItemType Directory -Path $location -Name $name.Name.Replace(' ','').ToLower()

    }

$directory = Get-ChildItem $location

    foreach ($employee in $directory){
        $welcome = $location + $employee
        New-Item -Path $welcome -Name Hello.txt -Value "Welcome message!"
    }
}
else {
    Write-Host "Operation has been cancelled."

}