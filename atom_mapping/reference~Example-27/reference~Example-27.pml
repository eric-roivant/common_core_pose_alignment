load ligands/reference/ligand.sdf, reference
load ligands/Example-27/ligand.sdf, Example-27
hide everything
show sticks, reference
show sticks, Example-27
color red, reference
color green, Example-27
color deepteal, (id 47 and reference)
color deepteal, (id 36 and Example-27)
color aquamarine, (id 48 and reference)
color aquamarine, (id 35 and Example-27)
color lightblue, (id 49 and reference)
color lightblue, (id 52 and Example-27)
color yellow, (id 50 and reference)
color yellow, (id 34 and Example-27)
color orange, (id 20 and reference)
color orange, (id 7 and Example-27)
color lime, (id 21 and reference)
color lime, (id 6 and Example-27)
color lightpink, (id 22 and reference)
color lightpink, (id 5 and Example-27)
color orange, (id 23 and reference)
color orange, (id 4 and Example-27)
color blue, (id 24 and reference)
color blue, (id 3 and Example-27)
color magenta, (id 25 and reference)
color magenta, (id 31 and Example-27)
color brown, (id 26 and reference)
color brown, (id 30 and Example-27)
color aquamarine, (id 27 and reference)
color aquamarine, (id 2 and Example-27)
color lightorange, (id 28 and reference)
color lightorange, (id 1 and Example-27)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-27, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-27
