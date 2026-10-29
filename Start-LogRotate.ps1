# Requirements
Import-Module -Name Log-Rotate

# Variables
$State = "$env:LOCALAPPDATA\Log-Rotate\Log-Rotate.status"
$Config = "$env:APPDATA\Log-Rotate\Log-Rotate.conf"

# Rotate logs
Log-Rotate -Config $Config -State $State

# Cleanup
if ( $Error.Count -eq 0 ) {
    exit 0
}
else {
    exit 1
}