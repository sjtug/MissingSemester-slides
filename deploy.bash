for dir in slides/*; do
    if [ -d "$dir" ]; then 
       nr build $dir/main.md --base $1$(echo "$dir" | sed 's/slides\///; s/\//_/g')    
    fi
done

mkdir dist

for dir in slides/*/dist; do
    if [ -d "$dir" ]; then 
        source_folder=$(dirname "$dir")
        target_name=$(echo "$source_folder" | sed 's/slides\///; s/\//_/g')
        target_path="dist/${target_name}"
        echo "Moving $dir to $target_path"
        mv "$dir" "$target_path"
    fi
done