#This portion of the script will ask the user for a name and desired location of their file server folder, and then creates it
function foldercreation {
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
}

#This portion of the script will populate the file server folder created above with folders for all of the names in employeelist.csv
function folderpopulation {
$fileserver = Import-Csv D:\Powershell\employeelist.csv
$syncdata = Read-Host -Prompt "Data will now be synced from the file server. Press 'y' to continue, or 'n' to abort"

if ($syncdata -eq 'y'){
    foreach ($name in $fileserver){
        New-Item -ItemType Directory -Path $location -Name $name.Name.Replace(' ','').ToLower() -Force
    }
}
$directory = Get-ChildItem $location

    foreach ($employee in $directory){
        $welcome = $location + $employee
        New-Item -Path $welcome -Name Hello.txt -Value "Welcome message!" -Force
    }

else {
    Write-Host "Operation has been cancelled."
    }
}

#This portion of the script will multiply what ever number the user inputs by all of the numbers listed
function numbermultiplication {
$num = 5,50,50,3,1
$userinput = Read-Host "Input Number"

foreach ($number in $num){
    $ans = $number*$userinput
    Write-Host $ans
    }
}

#This portion of the script will test the connectivity to the servers listed in serverlist.csv
function serverconnections {
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
}