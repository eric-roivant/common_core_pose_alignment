load ligands/reference/ligand.sdf, reference
load ligands/Example-26/ligand.sdf, Example-26
hide everything
show sticks, reference
show sticks, Example-26
color red, reference
color green, Example-26
color lightpink, (id 47 and reference)
color lightpink, (id 36 and Example-26)
color lightpink, (id 48 and reference)
color lightpink, (id 53 and Example-26)
color dash, (id 49 and reference)
color dash, (id 35 and Example-26)
color bluewhite, (id 50 and reference)
color bluewhite, (id 34 and Example-26)
color lightorange, (id 20 and reference)
color lightorange, (id 7 and Example-26)
color lightblue, (id 21 and reference)
color lightblue, (id 6 and Example-26)
color magenta, (id 22 and reference)
color magenta, (id 30 and Example-26)
color ruby, (id 23 and reference)
color ruby, (id 31 and Example-26)
color gold, (id 24 and reference)
color gold, (id 3 and Example-26)
color gold, (id 25 and reference)
color gold, (id 4 and Example-26)
color yellow, (id 26 and reference)
color yellow, (id 5 and Example-26)
color olive, (id 27 and reference)
color olive, (id 2 and Example-26)
color orange, (id 28 and reference)
color orange, (id 1 and Example-26)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-26, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-26
