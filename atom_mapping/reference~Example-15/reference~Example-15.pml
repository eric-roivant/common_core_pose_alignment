load ligands/reference/ligand.sdf, reference
load ligands/Example-15/ligand.sdf, Example-15
hide everything
show sticks, reference
show sticks, Example-15
color red, reference
color green, Example-15
color blue, (id 47 and reference)
color blue, (id 34 and Example-15)
color dash, (id 48 and reference)
color dash, (id 33 and Example-15)
color blue, (id 49 and reference)
color blue, (id 53 and Example-15)
color brown, (id 50 and reference)
color brown, (id 32 and Example-15)
color magenta, (id 20 and reference)
color magenta, (id 7 and Example-15)
color orange, (id 21 and reference)
color orange, (id 6 and Example-15)
color deepteal, (id 22 and reference)
color deepteal, (id 5 and Example-15)
color deepteal, (id 23 and reference)
color deepteal, (id 4 and Example-15)
color blue, (id 24 and reference)
color blue, (id 3 and Example-15)
color orange, (id 25 and reference)
color orange, (id 29 and Example-15)
color purple, (id 26 and reference)
color purple, (id 28 and Example-15)
color brown, (id 27 and reference)
color brown, (id 2 and Example-15)
color lightpink, (id 28 and reference)
color lightpink, (id 1 and Example-15)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-15, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-15
