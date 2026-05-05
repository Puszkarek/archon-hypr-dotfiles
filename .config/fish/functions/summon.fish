function summon --description 'Command one of the 72 bound entities of the grimoire to reveal its source'
    set -l editors windsurf antigravity cursor code
    set -l selected_editor

    # Parse arguments
    set -l project_name
    for arg in $argv
        switch $arg
            case '-e' '--editor'
                set selected_editor $argv[(math (contains -i -- $arg $argv) + 1)]
            case '-*'
                echo "Unknown option: $arg"
                echo "Usage: g <project-name> [-e|--editor <editor>]"
                echo "Editors: windsurf, antigravity, cursor, code"
                return 1
            case '*'
                if test -z "$project_name"
                    set project_name $arg
                end
        end
    end

    if test -z "$project_name"
        echo "Usage: g <project-name> [-e|--editor <editor>]"
        echo "Editors: windsurf, antigravity, cursor, code"
        return 1
    end

    set project_path (_find_grimoire_project $project_name)

    if test -z "$project_path"
        echo "Error: Project '$project_name' not found in grimoire"
        return 1
    end

    # If editor specified, use it
    if test -n "$selected_editor"
        if not contains $selected_editor $editors
            echo "Error: Unknown editor '$selected_editor'"
            echo "Valid editors: windsurf, antigravity, cursor, code"
            return 1
        end
        $selected_editor "$project_path"
        return 0
    end

    # Otherwise, find first installed editor in priority order
    for editor in $editors
        if command -q $editor
            $editor "$project_path"
            return 0
        end
    end

    echo "Error: No supported editor found (windsurf, antigravity, cursor, code)"
    return 1
end
