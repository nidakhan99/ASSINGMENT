

#!/bin/bash


command=$1


case "${command}" in


addteam)
        grp=$2
        echo "hurray ! your group is created congrats : ${grp} "
        sudo addgroup "${grp}" 
        sudo mkdir "/etc/skel/team"
        sudo mkdir "/etc/skel/ninja"
        ;;

#for adding a user in a group.
    adduser)
        grp=$2
        usr=$3
        dir=$3
        
        echo "congrats ${usr} you are in the group ${grp} " 
        sudo useradd -g "${grp}" -m -s /bin/bash "${usr}" && sudo chmod -R 771 /home/"${usr}"
        ;;
#add a file into directory
    addfile)
        path=$2
        file=$3
        echo "yor file is created."
        touch "${path}" "${file}"
        ;;

#delete a user 
    deluser)
        usr=$2
        echo "this ${usr} is deleted"
        sudo deluser --Remove-home "${usr}"
        ;;


#change user password
    changepasswd)
         usr=$2
        sudo passwd "${usr}"
        echo "Dear ${usr} your password has been changed succesfully" 
        ;;

#change shell for user 
    changeshell)

         usr=$2c
        echo "${usr} your shell has been changed" 
        sudo usermod -s /bin/bash "${usr}"
        
        ;;


#delete a group
    delteam)
        grp=$2
        echo "this ${grp} is deleted"
        sudo delgroup "${grp}"
        ;;

#list the groups
    ls)
        grp=$1
        echo "this is the list of teams"
        getent group 
        ;;
    
    *)
        echo "command no found :sorry!"
        ;;
esac
