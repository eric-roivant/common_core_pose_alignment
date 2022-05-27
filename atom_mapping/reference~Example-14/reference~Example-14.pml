load ligands/reference/ligand.sdf, reference
load ligands/Example-14/ligand.sdf, Example-14
hide everything
show sticks, reference
show sticks, Example-14
color red, reference
color green, Example-14
color aquamarine, (id 6 and reference)
color aquamarine, (id 21 and Example-14)
color purple, (id 39 and reference)
color purple, (id 51 and Example-14)
color gold, (id 8 and reference)
color gold, (id 23 and Example-14)
color grey, (id 7 and reference)
color grey, (id 22 and Example-14)
color aquamarine, (id 9 and reference)
color aquamarine, (id 24 and Example-14)
color grey, (id 10 and reference)
color grey, (id 25 and Example-14)
color lightpink, (id 40 and reference)
color lightpink, (id 52 and Example-14)
color aquamarine, (id 18 and reference)
color aquamarine, (id 28 and Example-14)
color dash, (id 19 and reference)
color dash, (id 29 and Example-14)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-14, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-14
