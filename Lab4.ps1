$fileserver = Import-Csv C:\employeelist.csv
New-Item -Path C:\ -ItemType Directory -name Fileserver
foreach ($name in $fileserver){
    New-Item -ItemType Directory -Path C:\Fileserver\ -Name $name.Name.Replace(' ','').ToLower()

    }
$directory = Get-ChildItem C:\Fileserver
foreach ($employee in $directory){
    New-Item -Path C:\Fileserver\$employee -Name Hello.txt -Value "Welcome message!"

    }