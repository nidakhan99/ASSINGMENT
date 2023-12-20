#!/bin/bash 
#set -x

conf="$HOME/.ssh/config"

local servername host username port identity_file
    while getopts ":n:h:u:p:i:" Flags; do
        case $Flags in
            n)
                host=${OPTARG}
                ;;
            h)
                hostname=${OPTARG}
                ;;
            u)
                user=${OPTARG}
                ;;
            p)
                port=${OPTARG}
                ;;
            i)
                identity_file=${OPTARG}
                ;;

            \? ) echo "Invalid option: -$OPTARG exiting" >&2
             exit
                ;;
            : )  echo "Option -$OPTARG requires an argument" >&2
              exit
               ;;

            *)
                echo "Invalid option: provide appropriate -${OPTARG}"
                ;;
        esac
    done

#establishing a connection to a server
function add_ssh() {
    # Adding entry to the file.


 echo -e "host ${host}\nhostname ${hostname}\nuser ${user}\nPort ${port}\nIdentityFile ${identity_file}" >> "$conf"


}





#2.List SSH connection


ls_sh() {
    local ls=$1
       local f=$2
     if [[ $# -eq 0 ]];then
     # awk '/<host/> {print $2}' "$conf" 
     grep -w host "$conf"


     elif [[ "$f"="-d" ]];then
     awk {print}' "$conf"

     fi < $conf

}

   












action=$1

case ${action} in
    -a)
        shift
        add_ssh "$@"
        ;;
    ls)
        shift
        ls_sh "$@"
        ;;

    -u)
        shift
        update_ssh_connection "$@"
        ;;
    rm)
        shift
        delete_ssh_connection "$@"
        ;;
    *)
        connect_to_server "$@"
        ;;
esac
