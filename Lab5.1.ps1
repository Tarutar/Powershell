$foldername = Read-Host -Prompt "Input name for the file server folder"
$folderpath = Read-Host -Prompt "Input path for the file server folder (e.g C:\Program Files)"
$location = $folderpath + "\" + $foldername + "\"
Write-Host "The file server folder will be stored in $folderpath"
$userconfirm = Read-Host -Prompt "Are you sure? (y/n)"

if ($userconfirm -eq 'y') {
    New-Item -Name $foldername -ItemType Directory -Path $folderpath -Force

} 
else {
    Write-Host "Operation has been cancelled."

}

$fileserver = Import-Csv D:\Powershell\employeelist.csv
$syncdata = Read-Host -Prompt "Data will now be synced from the file server. Press 'y' to continue, or 'n' to abort"

if ($syncdata -eq 'y'){
    foreach ($name in $fileserver){
        New-Item -ItemType Directory -Path $location -Name $name.Name.Replace(' ','').ToLower() -Force

    }

$directory = Get-ChildItem $location

    foreach ($employee in $directory){
        $welcome = $location + $employee
        New-Item -Path $welcome -Name Hello.txt -Value "Welcome message!" -Force
    }
}
else {
    Write-Host "Operation has been cancelled."

}

$num = 5,50,50,3,1
$userinput = Read-Host "Input Number"

foreach ($number in $num){
    $ans = $number*$userinput
    Write-Host $ans
}

$serverlist = Import-Csv D:\Powershell\serverlist.csv
Write-Host "Attempting to reach remote servers..."
foreach ($server in $serverlist.Servers){   
    if(Test-Connection -ComputerName $server -Count 3 -Delay 2 -Quiet){
        Write-Host "$server ---- Success!"
    }
    else{
        Write-Host "Unable to reach $server"
    }
}