function ag --description 'Open a grimoire project in Antigravity'
    if test (count $argv) -eq 0
        echo "Usage: ag <project-name>"
        return 1
    end

    set project_path (_find_grimoire_project $argv[1])

    if test -z "$project_path"
        echo "Error: Project '$argv[1]' not found in grimoire"
        return 1
    end

    antigravity "$project_path"
end
