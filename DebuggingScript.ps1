

function Get-FilesBefore([DateTime]$date, $path)
{
   Get-ChildItem -Path $path | 
        Get-FilesOlderThan $date
    
}
filter Get-FilesOlderThan([DateTime]$date)
{
    $currentFile = $_
   $currentFile | Where-Object {$_.LastWriteTime -le $date}
}
function Get-DateNDaysAgo([int]$daysAgo)
{
    (Get-Date).AddDays(-$daysAgo)
}
function Get-BasePath()
{
    "D:\tmp\PS_Debug"
}

function Get-OldFiles()
{
    $baseDate = Get-DateNDaysAgo -daysAgo 1;
    $basePath = Get-BasePath
    $filesBefore = Get-FilesBefore -date $baseDate -path $basePath
    foreach ($f in $filesBefore)
    {
        "{0}  {1}" -f $f.LastWriteTime, $f.Name

    }

}

Get-OldFiles