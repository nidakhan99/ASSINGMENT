#!/bin/bash 


command=$1
path=$2
dir=$3
cont=$4
case $command in
 
   addDir)
        echo "your directory is created : addDir $path $dir"     #creating directory
        mkdir "$2/$3 "
        ;;


   listDirs)                                                    #listing all the directories in directory.
        echo :"list of the directory"
      ls -l "$2" | grep '^d'
        ;;


   listfiles)                                                  #listing all files in a directory
        echo "list of the files : listfiles $path"

        ls -p "$2" | grep -v /
    

        ;;
  listAll)                                                          #listingcontent of  all files in a directory
        echo "list of content of the files : listALL $path"

        ls -la "$2"
    
        ;;


   addfile)

       echo "your file is created : addfile $3"
        touch "$2/$3"
 
        ;;

  addcontenttofile)
        echo "content added to your file : addcontenttofile $3 "
        echo "$3" >> "$2"
        ;;


    addcontenttofilebegining)
        echo "content added to the begining of file :addcontenttofilebegining $3"
        echo "$3" | cat - "$2" > temp && mv temp "$2"

        ;;




    showFileBeginingContent)
        echo "this is your content at the begining :showFileBeginingContent $2"
        head -n 2 "$2"

        ;;

   showFileEndContent)
        echo "this is your content at last line :showFileEndContent $2"
        tail  -n 2  "$2"

        ;;
        showFileContentAtLine)
        echo "this is your content at the line :showFileContentAtLine $2 at line $3"
         head -n "$3"  "$2" | tail -n "$3"

        ;;

  showFileContentForLineRange)
        echo "this is your content in range :showFileContentForLineRange $2 in range $3 to $4 "
        head -n "$4" "$2" | tail -n "$3" 

        ;;

   moveFile)
        echo "your file moved : movfile $2 to $3 "
        mv "$2" "$3"

       ;;


 copyfile)
        echo "your file has been copied : copied from $2 to $3 "
        cp -p "$2" "$3"

       ;;

  deletefile)
        echo "your file has been deleted : deletefile $3 "
        rm -r "$2" "$3"

       ;;

    *)

