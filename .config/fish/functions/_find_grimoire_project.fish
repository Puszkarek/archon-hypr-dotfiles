function _find_grimoire_project --description 'Find a project folder inside grimoire'
    set project_name $argv[1]
    set grimoire_path "$HOME/grimoire"

    # Search one level deep: grimoire/*/<project_name>
    for dir in $grimoire_path/*/$project_name
        if test -d "$dir"
            echo "$dir"
            return 0
        end
    end

    return 1
end
