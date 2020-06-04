# zbx
Bash script for quick info about changes made with zbximport.py

Script extract information about added, updated or deleted items in Zabbix from zbximport log files.

Also can show all changes or errors during import.

To enable autocompletion copy zbx file (no zbx.sh) to /etc/bash_completion.d/zbx

### Examples

zbx add   - show added items

zbx upd   - show updated items

zbx del   - show deleted items

zbx all   - show all changes

zbx err   - show errors and warnings in format NUMBER_OF_ERRORS DATE TIME ERROR
