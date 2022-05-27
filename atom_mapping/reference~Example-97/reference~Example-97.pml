load ligands/reference/ligand.sdf, reference
load ligands/Example-97/ligand.sdf, Example-97
hide everything
show sticks, reference
show sticks, Example-97
color red, reference
color green, Example-97
color deepteal, (id 47 and reference)
color deepteal, (id 33 and Example-97)
color dash, (id 48 and reference)
color dash, (id 32 and Example-97)
color aquamarine, (id 49 and reference)
color aquamarine, (id 49 and Example-97)
color gold, (id 50 and reference)
color gold, (id 31 and Example-97)
color bluewhite, (id 20 and reference)
color bluewhite, (id 7 and Example-97)
color purple, (id 21 and reference)
color purple, (id 6 and Example-97)
color cyan, (id 22 and reference)
color cyan, (id 5 and Example-97)
color magenta, (id 23 and reference)
color magenta, (id 4 and Example-97)
color blue, (id 24 and reference)
color blue, (id 3 and Example-97)
color lime, (id 25 and reference)
color lime, (id 28 and Example-97)
color lightorange, (id 26 and reference)
color lightorange, (id 27 and Example-97)
color dash, (id 27 and reference)
color dash, (id 2 and Example-97)
color blue, (id 28 and reference)
color blue, (id 1 and Example-97)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-97, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-97
