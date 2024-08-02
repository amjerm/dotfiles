import sys, subprocess, os, datetime

dateString = []
dateString.append(datetime.datetime.now().strftime("%Y-%m-%d"))

ticketId = sys.argv[1]
sprint = sys.argv[2]

if len(sys.argv) > 3:
    epic = sys.argv[3]
else:
    epic = "EPIC"

ticket = os.popen(f"jira issue list -q \"id = {ticketId}\" --plain --columns KEY,TYPE,SUMMARY,LABELS --no-headers").read().strip().split('\t')

ticketNumber = ticket[0].split('-')[1]
ticketType = ticket[1]
ticketSummary = ticket[2]
ticketLabels = ticket[3].split(',')

noteTitle = f"TI-{ticketNumber} ({ticketType}) - {ticketSummary}"

obsidianPath = os.getenv('OBSIDIAN_DIR')
templatePath = obsidianPath + "/obsidian-nova/templates/Template - Ticket (" + ticketType + ").md"

with open(templatePath, 'r', encoding='utf-8') as templateFile:
    template = templateFile.read()

    tags = '#' + ' #'.join(ticketLabels)

    noteContent = template.replace('TICKET', ticketNumber).replace('TYPE', ticketType).replace('SPRINT', sprint).replace('TAGS', tags).replace('{{title}}', noteTitle).replace('{{date}}', dateString[0])

    if epic:
        noteContent = noteContent.replace('EPIC', epic)

notePath = obsidianPath + "/obsidian-nova/tickets/ti-sprint-" + sprint + "/" + noteTitle + ".md"

with open(notePath, 'x', encoding='utf-8') as noteFile:
    noteFile.write(noteContent)

print(f"Note created at {notePath}")
