
#region 1. Syntax errors
Get-Process 
    | Measure-Object

2 +;
$bl = { 1.2

foreach($x in $files)

#endregion

#region 2. Runtime errors 

$date = (Get-Date) * 1
Get-ChildItem D:\tmp\AvalonEdit-master
Get-ChildItem D:\tmp\NonExisting.txt
Get-ChildItem D:\tmp2\NonExisting.txt

#endregion

#region 3. Logical errors 

$date = (Get-Date).AddDays(-1)
gci D:\tmp\PS_Debug | Where-Object {$_.LastWriteTime -le $date }


#endregion


Get-ChildItem D:\tmp\AvalonEdit-master -db
Get-ChildItem D:\tmp\NonExisting.txt -debug
