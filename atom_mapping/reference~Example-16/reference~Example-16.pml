load ligands/reference/ligand.sdf, reference
load ligands/Example-16/ligand.sdf, Example-16
hide everything
show sticks, reference
show sticks, Example-16
color red, reference
color green, Example-16
color lightpink, (id 47 and reference)
color lightpink, (id 37 and Example-16)
color bluewhite, (id 48 and reference)
color bluewhite, (id 56 and Example-16)
color blue, (id 49 and reference)
color blue, (id 36 and Example-16)
color lightorange, (id 50 and reference)
color lightorange, (id 34 and Example-16)
color deepteal, (id 20 and reference)
color deepteal, (id 7 and Example-16)
color lightorange, (id 21 and reference)
color lightorange, (id 6 and Example-16)
color olive, (id 22 and reference)
color olive, (id 31 and Example-16)
color blue, (id 23 and reference)
color blue, (id 32 and Example-16)
color cyan, (id 24 and reference)
color cyan, (id 3 and Example-16)
color olive, (id 25 and reference)
color olive, (id 4 and Example-16)
color lightpink, (id 26 and reference)
color lightpink, (id 5 and Example-16)
color lightorange, (id 27 and reference)
color lightorange, (id 2 and Example-16)
color lightorange, (id 28 and reference)
color lightorange, (id 1 and Example-16)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-16, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-16
