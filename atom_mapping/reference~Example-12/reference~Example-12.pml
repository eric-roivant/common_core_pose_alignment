load ligands/reference/ligand.sdf, reference
load ligands/Example-12/ligand.sdf, Example-12
hide everything
show sticks, reference
show sticks, Example-12
color red, reference
color green, Example-12
color olive, (id 47 and reference)
color olive, (id 35 and Example-12)
color aquamarine, (id 48 and reference)
color aquamarine, (id 34 and Example-12)
color purple, (id 49 and reference)
color purple, (id 54 and Example-12)
color brown, (id 50 and reference)
color brown, (id 33 and Example-12)
color lightpink, (id 20 and reference)
color lightpink, (id 7 and Example-12)
color blue, (id 21 and reference)
color blue, (id 6 and Example-12)
color bluewhite, (id 22 and reference)
color bluewhite, (id 5 and Example-12)
color yellow, (id 23 and reference)
color yellow, (id 4 and Example-12)
color deepteal, (id 24 and reference)
color deepteal, (id 3 and Example-12)
color purple, (id 25 and reference)
color purple, (id 30 and Example-12)
color ruby, (id 26 and reference)
color ruby, (id 29 and Example-12)
color lime, (id 27 and reference)
color lime, (id 2 and Example-12)
color cyan, (id 28 and reference)
color cyan, (id 1 and Example-12)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-12, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-12
