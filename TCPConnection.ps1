function Get-Location($get){
$request
$ips = @()
foreach($i in $get){
$i
$ips += Invoke-RestMethod -Method Get -Uri "http://ip-api.com/json/$i"
}
echo "`n"
$ips | Format-Table -Property @{Name="Ip Addres";Expression={$_.query}}, city, country, isp | Out-String|% {Write-Host $_}
}

while(1){
cls
$option = Read-Host "`t1 - Port
`t2 - Ip
`t3 - List all connections
`nOption "
if($option -eq 1)
  {
     cls
     $port = Read-Host "Port "
     cls
     $get = Get-NetTCPConnection -LocalPort $port
     echo $get
     Get-Location $get.RemoteAddress
     Read-Host
  }
elseif($option -eq 2)
  {
     cls
     $Ip = Read-Host "Ip "
     cls
     $get = Get-NetTCPConnection -LocalAddress $Ip
     echo $get
     Get-Location $get.RemoteAddress
     Read-Host
  }
elseif($option -eq 3)
  {
  cls
     $get = Get-NetTCPConnection
     echo $get
     Read-Host
  }
elseif($option -eq "exit")
  {
  exit
  }
else{
    continue
}
}
