load ligands/reference/ligand.sdf, reference
load ligands/Example-23/ligand.sdf, Example-23
hide everything
show sticks, reference
show sticks, Example-23
color red, reference
color green, Example-23
color ruby, (id 47 and reference)
color ruby, (id 38 and Example-23)
color lime, (id 48 and reference)
color lime, (id 37 and Example-23)
color magenta, (id 49 and reference)
color magenta, (id 58 and Example-23)
color lime, (id 50 and reference)
color lime, (id 35 and Example-23)
color yellow, (id 20 and reference)
color yellow, (id 7 and Example-23)
color lightblue, (id 21 and reference)
color lightblue, (id 6 and Example-23)
color lime, (id 22 and reference)
color lime, (id 5 and Example-23)
color aquamarine, (id 23 and reference)
color aquamarine, (id 4 and Example-23)
color silver, (id 24 and reference)
color silver, (id 3 and Example-23)
color lightblue, (id 25 and reference)
color lightblue, (id 33 and Example-23)
color dash, (id 26 and reference)
color dash, (id 32 and Example-23)
color cyan, (id 27 and reference)
color cyan, (id 2 and Example-23)
color cyan, (id 28 and reference)
color cyan, (id 1 and Example-23)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-23, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-23
