load ligands/reference/ligand.sdf, reference
load ligands/Example-98/ligand.sdf, Example-98
hide everything
show sticks, reference
show sticks, Example-98
color red, reference
color green, Example-98
color lightblue, (id 47 and reference)
color lightblue, (id 34 and Example-98)
color ruby, (id 48 and reference)
color ruby, (id 52 and Example-98)
color ruby, (id 49 and reference)
color ruby, (id 33 and Example-98)
color gold, (id 50 and reference)
color gold, (id 32 and Example-98)
color violet, (id 20 and reference)
color violet, (id 7 and Example-98)
color brown, (id 21 and reference)
color brown, (id 6 and Example-98)
color lightpink, (id 22 and reference)
color lightpink, (id 28 and Example-98)
color violet, (id 23 and reference)
color violet, (id 29 and Example-98)
color dash, (id 24 and reference)
color dash, (id 3 and Example-98)
color brown, (id 25 and reference)
color brown, (id 4 and Example-98)
color orange, (id 26 and reference)
color orange, (id 5 and Example-98)
color cyan, (id 27 and reference)
color cyan, (id 2 and Example-98)
color orange, (id 28 and reference)
color orange, (id 1 and Example-98)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-98, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-98
