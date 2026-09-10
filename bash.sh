#! /bin/bash

path=$1

if [ -d $path ];then
    mkdir $path/Images 
    mkdir $path/Documents 
    mkdir $path/Videos 
    mkdir $path/Archives
    mkdir $path/Others
    
    images_number=0
    documents_number=0
    vidoes_number=0
    archives_number=0
    others_number=0

    for file in "$path"/*
    do
        if [ -f "$file" ];then
            case "$file" in 
            *.png|*.jpg|*.jpeg)
                mv "$file" "$path/Images/"
                images_number=$((1 + images_number))
                ;;
            *.pdf|*.txt)
                mv "$file" "$path/Documents"
                documents_number=$((1 + documents_number))
                ;;
            *.mp4|*.mkv)
                mv "$file" "$path/Videos"
                videos_number=$((1 + videos_number))
                ;;
            *.zip|*.rar)
                mv "$file" "$path/Archives"
                archives_number=$((1 + archives_number))
                ;;
            *)
                 mv "$file" "$path/Others"
                others_number=$((1 + others_number))
                ;;

            esac
        fi

    done
    echo "number of images: $images_number"
    echo "number of documents: $documents_number"
    echo "number of video: $videos_number"
    echo "number of archives: $archives_number"
    echo "number of others: $others_number"
else
    echo "path is wrong"
fi
