#!/usr/bin/env python3
import os
import re
import json

def extract_colors_from_design(design_path):
    with open(design_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    colors = {}
    # Match CSS variable definitions
    matches = re.findall(r'--([^:]+):\s*([^;]+);', content)
    for name, value in matches:
        colors[f'--{name}'] = value.strip()
    
    return colors

def update_theme_colors(theme_path, design_colors):
    # Read the file as text to preserve comments
    with open(theme_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    updated = False
    
    # Update highlight colors specifically using regex
    if '--find-highlight-background' in design_colors:
        new_color = design_colors['--find-highlight-background']
        # Use regex to find and replace the color value
        pattern = r'("editor\.findMatchHighlightBackground":\s*")[^"]+(")'
        match = re.search(pattern, content)
        if match:
            old_color = match.group(0).split(':')[1].strip().strip('"')
            new_line = f'{match.group(1)}{new_color}{match.group(2)}'
            content = re.sub(pattern, new_line, content)
            print(f"Updated findMatchHighlightBackground: {old_color} -> {new_color}")
            updated = True
    
    if '--hover-highlight-background' in design_colors:
        new_color = design_colors['--hover-highlight-background']
        # Use regex to find and replace the color value
        pattern = r'("editor\.hoverHighlightBackground":\s*")[^"]+(")'
        match = re.search(pattern, content)
        if match:
            old_color = match.group(0).split(':')[1].strip().strip('"')
            new_line = f'{match.group(1)}{new_color}{match.group(2)}'
            content = re.sub(pattern, new_line, content)
            print(f"Updated hoverHighlightBackground: {old_color} -> {new_color}")
            updated = True
    
    if updated:
        with open(theme_path, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Updated {theme_path}")
    else:
        print("No updates needed")
    
    return updated

def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    project_root = os.path.dirname(script_dir)
    
    design_path = os.path.join(project_root, 'documentation/design.css')
    theme_path = os.path.join(project_root, 'vscode-theme/themes/color-theme.json')

    try:
        design_colors = extract_colors_from_design(design_path)
        update_theme_colors(theme_path, design_colors)
    except FileNotFoundError as e:
        print(f"Error: {e}")
        return
    except Exception as e:
        print(f"Error: {e}")
        return

    print("Update complete!")

if __name__ == '__main__':
    main()
