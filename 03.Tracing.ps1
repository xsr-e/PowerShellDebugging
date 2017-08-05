
## Measure-Command

$commandBlockA = {0..99|% {gsv "windows time"}}
$commandBlockB = {0..99|% {Get-Service "windows time"}}
$commandBlockC = {0..99|% {Get-Service -Name "windows time"}}
$commandBlockD = {0..99|% {Get-Service -DisplayName "windows time"}}

$cmdM = Measure-Command -Expression $commandBlockA 
$cmdM.ToString();

$cmdM = Measure-Command -Expression $commandBlockB 
$cmdM.ToString();

$cmdM = Measure-Command -Expression $commandBlockC 
$cmdM.ToString();

$cmdM = Measure-Command -Expression $commandBlockD 
$cmdM.ToString();

## Trace-Command

Trace-Command -Expression {gsv "Windows Time"} -Name CommandDiscovery -PSHost
Trace-Command -Expression {gsv "Windows Time"} -Name ParameterBinding -PSHost
Trace-Command -Expression {gsv "Windows Time"} -Name ParameterBinderController -PSHost
Trace-Command -Expression {gsv "Windows Time"} -Name ParameterBinderBase -PSHost



Get-TraceSource | select Name,Description

## Trace-Command Parameter binding

Trace-Command -Ex {gci} -Name CommandDiscovery,ParameterBinding,ParameterBinderController -PSHost
Trace-Command -Ex {Get-Help gci } -Name ParameterBinderController -PSHost
Trace-Command -Ex {Get-Help gci -Detailed } -Name ParameterBinderController -PSHost
Trace-Command -Ex {Get-Help gci -Examples } -Name ParameterBinderController -PSHost


Trace-Command -Ex {Get-WinEvent -ListLog *PowerShell } -Name ParameterBinderController -PSHost
Trace-Command -Ex {Get-WinEvent  -ListProvider *PowerShell } -Name ParameterBinderController -PSHost
Trace-Command -Ex {Get-WinEvent -LogName Microsoft-Windows-PowerShell/Operational -MaxEvents 10} -Name ParameterBinderController -PSHost
Trace-Command -Ex {Get-WinEvent -LogName Microsoft-Windows-PowerShell/Operational -MaxEvents 10} -Name ParameterBinderController -PSHost