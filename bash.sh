#! /bin/bash

path=$1

get_uniq_name() {
    file=$1

    if [! -e "$file"];then
        echo "$file"
        return
    fi

    direc=$(dirname "$file")
    filename=$(basename "$file")
    
    name=${filename%.*}
    pasvand=${filename##*.}

    counter=1

    while [ -e "$direc/${name}_$counter.$pasvand" ]
    do
        counter=$((1 + counter))
    done
    
    echo "$direc/${name}_$counter.$pasvand"
}


if [ -d $path ];then
    mkdir "$path/Images" 
    mkdir "$path/Documents" 
    mkdir "$path/Videos" 
    mkdir "$path/Archives"
    mkdir "$path/Others"

    
    images_number=0
    documents_number=0
    videos_number=0
    archives_number=0
    others_number=0

    for file in "$path"/*
    do
        if [ -f "$file" ];then
            case "$file" in 
            *.png|*.jpg|*.jpeg)
                dest="$path/Images/$(basename "$file")"
                dest=$(get_uniq_name "$dest")
                mv "$file" "$dest"
                images_number=$((1 + images_number))
                echo "[ $(date) ] Moved $file ==> Images" >> "$path/log.txt"
                ;;
            *.pdf|*.txt)
                dest="$path/Documents/$(basename "$file")"
                dest=$(get_uniq_name "$dest")
                mv "$file" "$dest"
                documents_number=$((1 + documents_number))
                echo "[ $(date) ] Moved $file ==> Documents" >> "$path/log.txt"
                ;;
            *.mp4|*.mkv)
                dest="$path/Videos/$(basename "$file")"
                dest=$(get_uniq_name "$dest")
                mv "$file" "$dest"
                videos_number=$((1 + videos_number))
                echo "[ $(date ]) Moved $file ==> Videos" >> "$path/log.txt"
                ;;
            *.zip|*.rar)
                dest="$path/Archives/$(basename "$file")"
                dest=$(get_uniq_name "$dest")
                mv "$file" "$dest"
                archives_number=$((1 + archives_number))
                echo "[ $(date) ] Moved $file ==> Archives" >> "$path/log.txt"
                ;;
            *)
                dest="$path/Others/$(basename "$file")"
                dest=$(get_uniq_name "$dest")
                 mv "$file" "$dest"
                others_number=$((1 + others_number))
                echo "[ $(date) ] Moved $file ==> Others" >> "$path/log.txt"
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
