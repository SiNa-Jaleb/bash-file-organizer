#! /bin/bash

path=$1

if [ -d $path ];then
    mkdir $path/Images 
    mkdir $path/Documents 
    mkdir $path/Videos 
    mkdir $path/Archives
    mkdir $path/Others
    
    for file in "$path"/*
    do
        if [ -f "$file" ];then
            case "$file" in 
            *.png|*.jpg|*.jpeg)
                mv "$file" "$path/Images/"
                ;;
            *.pdf|*.txt)
                mv "$file" "$path/Documents"
                ;;
            *.mp4|*.mkv)
                mv "$file" "$path/Videos"
                ;;
            *.zip|*.rar)
                mv "$file" "$path/Archives"
                ;;
            *)
                 mv "$file" "$path/Others"
                ;;

            esac
        fi

    done
else
    echo "path is wrong"
fi
