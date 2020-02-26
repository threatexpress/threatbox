# THREATBOX

## Description

THREATBOX is an example of a standard attack platform. The concept and use of a standard attack platform is outlined in the book Red Team Development and Operations https://redteam.guide

## Quick Reference 

Item          | Value                                     | Description
--------------|-------------------------------------------|------------
Operator user | {{ operator_username }}                   | Default non-root user, has sudo rights
Tools         | {{ tools_root }}                          | Tools and git repository root directory
Events        | {{ logs_root }}                           | Event data root directory
Readme        | ~/Desktop/readme/                         | Directory containing instance information. Includes installed software versions
.Net Binaries | {{ tools_root }}/compiled_dotnet_projects | Some dotnet projects are compiled dynamically when the THREATBOX is built
Passwords     | {{ tools_root }}/rockyou                  | Rockyou password list 
pipenv        | pipenv shell                              | Most python projects are installed using pipenv. Use `pipenv shell` in the project directory to access. See https://realpython.com/pipenv-guide/ for pipenv usage guidance.
BurpSuite     | BurpSuiteCommunity                        | Command starts BurpSuiteCommunity

---------------------
## THREATBOX Commands

The following are commands that may help an operator.

**Platform Functions**

 * `threatbox_help` - Display help
 * `my_ip`          - Display the current local IP address
 * `external_ip`    - Reachout to ifconfig.me to get external IP address
 * `netstati`       - Get process using network communications
 * `ql`             - Log passed parameters to ~/logs/quick_logs.txt
 * `powershell`     - runs Microsoft PowerShell prompt
 * `get_timestamp`  - Get current UTC timestamp
 * `webserver`      - Quick webserver on port 8080 using twisted

**Event Functions**

 Pass the event name as a parameter to any of the following functions.
 * `create_event <event_name>`
 * `backup_event <event_name>`
 * `archive_event <event_name>`
 * `remove_event <event_name>`

**Console Display Theme**

Console themes provide additions prompt information.
Quick way to change the display of your console.
Can be great for screenshots

 * `theme_default` - Default terminal prompt (DEFAULT)
 * `theme_neutral` - Dark text on light background, no color
 * `theme_dark` - Light text and terminal colors for dark background
 * `theme_light` - Dark text and terminal colors for light background