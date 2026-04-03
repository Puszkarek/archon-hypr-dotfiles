#!/usr/bin/env python3
import os
import re

def get_colors(design_path, migration_path):
    with open(design_path, 'r', encoding='utf-8') as f:
        design_lines = f.read().splitlines()

    with open(migration_path, 'r', encoding='utf-8') as f:
        migration_lines = f.read().splitlines()

    colors_map = {}
    for old_line, new_line in zip(design_lines, migration_lines):
        old_match = re.search(r':\s*(.+?);', old_line)
        new_match = re.search(r':\s*(.+?);', new_line)
        
        if old_match and new_match:
            old_c = old_match.group(1).strip()
            new_c = new_match.group(1).strip()
            if old_c and new_c and old_c != new_c:
                colors_map[old_c] = new_c
                # Also support bare hex without '#'
                if old_c.startswith('#') and new_c.startswith('#'):
                    # Using replace to appease the linter over slices
                    bare_old = old_c.replace('#', '', 1)
                    bare_new = new_c.replace('#', '', 1)
                    colors_map[bare_old] = bare_new
                
    return colors_map

def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    project_root = os.path.dirname(script_dir)
    
    design_path = os.path.join(project_root, 'documentation/design.css')
    migration_path = os.path.join(project_root, 'documentation/migration-design.css')
    theme_path = os.path.join(project_root, 'vscode-theme/themes/color-theme.json')

    try:
        colors_map = get_colors(design_path, migration_path)
    except FileNotFoundError as e:
        print(f"Error: {e}")
        print("Please ensure documentation/design.css and migration-design.css exist in the project root.")
        return

    if not colors_map:
        print("No color differences found between design.css and migration-design.css")
        return

    sorted_replacements = sorted(colors_map.items(), key=lambda x: len(x[0]), reverse=True)
    regex_replacements = [(re.compile(re.escape(old), re.IGNORECASE), new) for old, new in sorted_replacements]

    try:
        with open(theme_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        orig_content = content
        
        for regex, new_c in regex_replacements:
            content = regex.sub(new_c, content)
            
        if content != orig_content:
            with open(theme_path, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f"Updated {theme_path}")
            print(f"Applied {len(colors_map)} color replacements:")
            for old, new in sorted_replacements:
                print(f"  {old} -> {new}")
        else:
            print("No updates needed for color-theme.json")
            
    except Exception as e:
        print(f"Error processing {theme_path}: {e}")

    print(f"\nUpdate complete!")

if __name__ == '__main__':
    main()
