#region Debugging


Get-ChildItem D:\tmp\AvalonEdit-master -db
Get-ChildItem D:\tmp\NonExisting.txt -debug



#endregion


#region Debugging Set-PSDebug

Set-PSDebug -Step
#Get-ChildItem D:\tmp\NonExisting.txt 

Set-PSDebug -Off
#endregion





function Get-FilesBefore([DateTime]$date, $path)
{
   Get-ChildItem -Path $path | 
    Where-Object {$_.LastWriteTime -le $date}

}
function Get-DateDaysAgo([int]$daysAgo)
{
    (Get-Date).AddDays(-$daysAgo)
}
function Get-BasePath()
{
    "D:\tmp\PS_Debug"
}

function GetOldFiles()
{
    $baseDate = Get-DateDaysAgo -daysAgo 1;
    $basePath = Get-BasePath
    $filesBefore = Get-FilesBefore -date $baseDate -path $basePath
    foreach ($f in $filesBefore)
    {
        "{0}  {1}" -f $f.LastWriteTime, $f.Name

    }


}
GetOldFiles
