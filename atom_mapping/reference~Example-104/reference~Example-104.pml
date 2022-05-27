load ligands/reference/ligand.sdf, reference
load ligands/Example-104/ligand.sdf, Example-104
hide everything
show sticks, reference
show sticks, Example-104
color red, reference
color green, Example-104
color silver, (id 47 and reference)
color silver, (id 29 and Example-104)
color lightblue, (id 48 and reference)
color lightblue, (id 44 and Example-104)
color aquamarine, (id 49 and reference)
color aquamarine, (id 28 and Example-104)
color lightpink, (id 50 and reference)
color lightpink, (id 26 and Example-104)
color olive, (id 20 and reference)
color olive, (id 7 and Example-104)
color purple, (id 21 and reference)
color purple, (id 6 and Example-104)
color orange, (id 22 and reference)
color orange, (id 23 and Example-104)
color purple, (id 23 and reference)
color purple, (id 24 and Example-104)
color cyan, (id 24 and reference)
color cyan, (id 3 and Example-104)
color magenta, (id 25 and reference)
color magenta, (id 4 and Example-104)
color brown, (id 26 and reference)
color brown, (id 5 and Example-104)
color cyan, (id 27 and reference)
color cyan, (id 2 and Example-104)
color orange, (id 28 and reference)
color orange, (id 1 and Example-104)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-104, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-104
