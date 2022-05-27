load ligands/reference/ligand.sdf, reference
load ligands/Example-103/ligand.sdf, Example-103
hide everything
show sticks, reference
show sticks, Example-103
color red, reference
color green, Example-103
color blue, (id 47 and reference)
color blue, (id 29 and Example-103)
color lightorange, (id 48 and reference)
color lightorange, (id 44 and Example-103)
color purple, (id 49 and reference)
color purple, (id 28 and Example-103)
color blue, (id 50 and reference)
color blue, (id 26 and Example-103)
color deepteal, (id 20 and reference)
color deepteal, (id 7 and Example-103)
color lightblue, (id 21 and reference)
color lightblue, (id 6 and Example-103)
color lightpink, (id 22 and reference)
color lightpink, (id 23 and Example-103)
color olive, (id 23 and reference)
color olive, (id 24 and Example-103)
color blue, (id 24 and reference)
color blue, (id 3 and Example-103)
color blue, (id 25 and reference)
color blue, (id 4 and Example-103)
color lightblue, (id 26 and reference)
color lightblue, (id 5 and Example-103)
color silver, (id 27 and reference)
color silver, (id 2 and Example-103)
color brown, (id 28 and reference)
color brown, (id 1 and Example-103)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-103, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-103
