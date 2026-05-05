function c --description 'Open a grimoire project in VS Code'
    if test (count $argv) -eq 0
        echo "Usage: c <project-name>"
        return 1
    end

    set project_path (_find_grimoire_project $argv[1])

    if test -z "$project_path"
        echo "Error: Project '$argv[1]' not found in grimoire"
        return 1
    end

    code "$project_path"
end
