import sys, subprocess, os
data = sys.stdin.readlines()

obsidianPath = os.getenv('OBSIDIAN_DIR')
templatePath = obsidianPath + '/obsidian-nova/templates/Template - Standup Item.md'

with open(templatePath, 'r', encoding='utf-8') as templateFile:
    template = templateFile.read()
    for i, line in enumerate(data):
        if i == 0:
            continue

        id,labelStr = line.rstrip().split('\t')

        labelArr = labelStr.split(',')
        labels = ' '.join([f"#{label}" for label in labelArr])

        key,num = id.split('-', 1)

        print(f"{template.replace('foo', num)} {labels}")

