# Requirements
Import-Module -Name Log-Rotate

# Variables
$State = "$env:LOCALAPPDATA\LogRotate\LogRotate.state"
$Config = "$env:APPDATA\LogRotate\LogRotate.conf"

# Main Process
Log-Rotate -Config $Config -State $State

# Cleanup
if ( $Error.Count -eq 0 ) {
    exit 0
}
else {
    exit 1
}
