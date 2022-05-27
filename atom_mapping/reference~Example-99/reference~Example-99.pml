load ligands/reference/ligand.sdf, reference
load ligands/Example-99/ligand.sdf, Example-99
hide everything
show sticks, reference
show sticks, Example-99
color red, reference
color green, Example-99
color aquamarine, (id 47 and reference)
color aquamarine, (id 35 and Example-99)
color orange, (id 48 and reference)
color orange, (id 54 and Example-99)
color dash, (id 49 and reference)
color dash, (id 34 and Example-99)
color deepteal, (id 50 and reference)
color deepteal, (id 32 and Example-99)
color lightpink, (id 20 and reference)
color lightpink, (id 7 and Example-99)
color purple, (id 21 and reference)
color purple, (id 6 and Example-99)
color lightorange, (id 22 and reference)
color lightorange, (id 29 and Example-99)
color cyan, (id 23 and reference)
color cyan, (id 30 and Example-99)
color blue, (id 24 and reference)
color blue, (id 3 and Example-99)
color lightblue, (id 25 and reference)
color lightblue, (id 4 and Example-99)
color cyan, (id 26 and reference)
color cyan, (id 5 and Example-99)
color deepteal, (id 27 and reference)
color deepteal, (id 2 and Example-99)
color aquamarine, (id 28 and reference)
color aquamarine, (id 1 and Example-99)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-99, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-99
