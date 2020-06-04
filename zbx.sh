#!/bin/sh
# show added, updated and deleted items from Zabbix. Also show errors in import
# Author: Jan Polák


program_name=$(basename $0)

source_file="/path/to/log/zbximport.log*"

flags="--color=auto -h -E"
reg_add="--ADD--"
reg_del="--DEL--"
reg_upd="--UPD--"
reg_warn="WARNING"
reg_err="ERROR"
reg_date="[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}"

sub_help(){
    echo "Usage: zbx <subcommand>\n"
    echo "Subcommands:"
    echo "    add   show added items"
    echo "    upd   show updated items"
    echo "    del   show deleted items"
    echo "    all   show all changes"
    echo "    err   show errors and warnings in form:"
    echo "          NUMBER_OF_ERRORS DATE TIME ERROR"
    echo ""
}

sub_test(){
   echo $source_file
}

sub_add(){
    grep $flags "("$reg_add")" $source_file
}

sub_upd(){
    grep $flags "("$reg_upd")" $source_file
}

sub_del(){
    grep $flags "("$reg_del")" $source_file
}

sub_all(){
    grep $flags "("$reg_add"|"$reg_upd"|"$reg_del")" $source_file
}

sub_err(){
     grep $flags "("$reg_warn"|"$reg_err")" $source_file | uniq -c -f 2
    

}

  
subcommand=$1
case $subcommand in
    "" | "-h" | "--help")
        sub_help
        ;;
    *)
        shift
        sub_${subcommand}
        if [ $? = 127 ]; then
            echo "Error: '$subcommand' is not valid sub command." >&2
            echo "       Run 'zbx --help' for help." >&2
            exit 1
        fi
        ;;
esac
