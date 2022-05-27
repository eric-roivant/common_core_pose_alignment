load ligands/reference/ligand.sdf, reference
load ligands/Example-19/ligand.sdf, Example-19
hide everything
show sticks, reference
show sticks, Example-19
color red, reference
color green, Example-19
color cyan, (id 47 and reference)
color cyan, (id 37 and Example-19)
color lime, (id 48 and reference)
color lime, (id 36 and Example-19)
color silver, (id 49 and reference)
color silver, (id 58 and Example-19)
color grey, (id 50 and reference)
color grey, (id 35 and Example-19)
color silver, (id 20 and reference)
color silver, (id 7 and Example-19)
color blue, (id 21 and reference)
color blue, (id 6 and Example-19)
color aquamarine, (id 22 and reference)
color aquamarine, (id 5 and Example-19)
color orange, (id 23 and reference)
color orange, (id 4 and Example-19)
color gold, (id 24 and reference)
color gold, (id 3 and Example-19)
color grey, (id 25 and reference)
color grey, (id 32 and Example-19)
color violet, (id 26 and reference)
color violet, (id 31 and Example-19)
color dash, (id 27 and reference)
color dash, (id 2 and Example-19)
color deepteal, (id 28 and reference)
color deepteal, (id 1 and Example-19)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-19, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-19
