 # Put the whole script inside of a while loop that asks the user if they want to exit
  # Get a list of all the servers in serverlist.csv
   # Create a job for each server and have it test the connection to that server
    # Receive the content from that job and output it into the command line
     # Turn in a url to your gitrepo


$ui = Read-Host "Input the letter 'n' to run the script"
while($ui -eq "n"){
 $csv = Import-Csv -Path 'D:\School\Powershell\serverlist.csv'
    foreach ($_ in $csv.Servers){
     Start-Job -Name $_ -InputObject $_ -ScriptBlock {Test-Connection -ComputerName $input -Count 1}
    }
 Read-Host "Press the Enter key for the results" 
     Get-Job | ForEach-Object{
     Receive-Job -Name $_.Name -Keep
    }
 $ui = Read-Host "Do you want to exit? (y/n)"
}



