$CSVs = Get-Content -path C:\Temp\Report\report.txt
#$Date = Get-Item $CSV | Select -Property LastWriteTime.ToString("yyyy-MM-dd")
$Path = 'C:\Temp\Report'


ForEach ($CSV in $CSVs){

$Tester = Import-CSV $CSV
$properties = (Get-Item -Path $Path\$CSV).LastWriteTime.ToString('yyyy-MM-dd')


ForEach ($item in $Tester)
{
Add-Member -Input $item -MemberType NoteProperty -Name 'Date' -Value $properties  -Force
}
$Tester | Select-Object 'Plugin ID', 'CVE', 'CVSS', 'Risk', 'Host', 'Protocol', 'Port', 'Name', 'Synopsis', 'Description', 'Solution', 'See Also', 'Plugin Output', 'Date' | Export-CSV -Path $Path\$CSV -NoTypeInformation
}


