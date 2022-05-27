load ligands/reference/ligand.sdf, reference
load ligands/Example-177/ligand.sdf, Example-177
hide everything
show sticks, reference
show sticks, Example-177
color red, reference
color green, Example-177
color grey, (id 6 and reference)
color grey, (id 24 and Example-177)
color cyan, (id 39 and reference)
color cyan, (id 57 and Example-177)
color gold, (id 8 and reference)
color gold, (id 26 and Example-177)
color ruby, (id 7 and reference)
color ruby, (id 25 and Example-177)
color dash, (id 9 and reference)
color dash, (id 27 and Example-177)
color orange, (id 10 and reference)
color orange, (id 28 and Example-177)
color cyan, (id 40 and reference)
color cyan, (id 58 and Example-177)
color ruby, (id 18 and reference)
color ruby, (id 31 and Example-177)
color magenta, (id 19 and reference)
color magenta, (id 32 and Example-177)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-177, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-177
