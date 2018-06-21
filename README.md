# PetalinuxExtendedDevmem
Extends the devmem function to multiple addresses

# Installation
Download d.sh to your board (through FTP or other means).  Navigate to the download directory and copy it to the bash directory for global access
`
cp d.sh /usr/local/bin/d
`


# Usage
Traditionally, `devmem` is used to display the value stored in a register.  This script file will allow for multiple registers to be displayed at once in a neat, formatted manner.  Each line will display the value from four registers.
`
d [START ADDR] [NUM LINES]
`
In order to account for alignment issues, the two least significant bits must be 0.  This is ensured automatically.
