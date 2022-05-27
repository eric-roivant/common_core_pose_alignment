load ligands/reference/ligand.sdf, reference
load ligands/Example-213/ligand.sdf, Example-213
hide everything
show sticks, reference
show sticks, Example-213
color red, reference
color green, Example-213
color brown, (id 47 and reference)
color brown, (id 31 and Example-213)
color grey, (id 48 and reference)
color grey, (id 47 and Example-213)
color gold, (id 49 and reference)
color gold, (id 30 and Example-213)
color aquamarine, (id 50 and reference)
color aquamarine, (id 29 and Example-213)
color brown, (id 20 and reference)
color brown, (id 7 and Example-213)
color magenta, (id 21 and reference)
color magenta, (id 6 and Example-213)
color dash, (id 22 and reference)
color dash, (id 25 and Example-213)
color lightpink, (id 23 and reference)
color lightpink, (id 26 and Example-213)
color olive, (id 24 and reference)
color olive, (id 3 and Example-213)
color grey, (id 25 and reference)
color grey, (id 4 and Example-213)
color gold, (id 26 and reference)
color gold, (id 5 and Example-213)
color dash, (id 27 and reference)
color dash, (id 2 and Example-213)
color lightpink, (id 28 and reference)
color lightpink, (id 1 and Example-213)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-213, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-213
