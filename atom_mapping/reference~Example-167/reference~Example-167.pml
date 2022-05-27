load ligands/reference/ligand.sdf, reference
load ligands/Example-167/ligand.sdf, Example-167
hide everything
show sticks, reference
show sticks, Example-167
color red, reference
color green, Example-167
color silver, (id 6 and reference)
color silver, (id 7 and Example-167)
color lightorange, (id 39 and reference)
color lightorange, (id 28 and Example-167)
color cyan, (id 8 and reference)
color cyan, (id 22 and Example-167)
color lime, (id 7 and reference)
color lime, (id 6 and Example-167)
color lightblue, (id 9 and reference)
color lightblue, (id 23 and Example-167)
color brown, (id 10 and reference)
color brown, (id 3 and Example-167)
color bluewhite, (id 40 and reference)
color bluewhite, (id 42 and Example-167)
color lightorange, (id 18 and reference)
color lightorange, (id 4 and Example-167)
color cyan, (id 19 and reference)
color cyan, (id 5 and Example-167)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-167, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-167
