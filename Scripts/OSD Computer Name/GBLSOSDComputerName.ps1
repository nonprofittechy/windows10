$numLen = 7
$prefix= "GBLS-"
$ComputerModel = (Get-WmiObject -Class Win32_ComputerSystem | Select-Object Model).Model
$SerialNumber = (Get-WmiObject -Class Win32_BIOS | Select-Object SerialNumber).SerialNumber
if ($serialNumber.length -ge 7) {
	$shortSerial = $serialNumber.substring($serialNumber.length - $numLen,$numLen)
} else {
	$shortSerial = $serialNumber
}

$OSDComputerName = $prefix + $shortSerial
$TSEnv = New-Object -COMObject Microsoft.SMS.TSEnvironment 
$TSEnv.Value("OSDComputerName") = "$OSDComputerName"

<#
# Workstations
if (($ComputerModel -match "Precision") -OR ($ComputerModel -match "Optiplex")) {
    $OSDComputerName = $SerialNumber + "-" + "WS"
    $TSEnv = New-Object -COMObject Microsoft.SMS.TSEnvironment 
    $TSEnv.Value("OSDComputerName") = "$OSDComputerName"
}

# Laptops
if ($ComputerModel -match "Latitude") {
    $OSDComputerName = $SerialNumber + "-" + "LAP"
    $TSEnv = New-Object -COMObject Microsoft.SMS.TSEnvironment 
    $TSEnv.Value("OSDComputerName") = "$OSDComputerName"
}
#>