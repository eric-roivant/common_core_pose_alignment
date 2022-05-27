load ligands/reference/ligand.sdf, reference
load ligands/Example-169/ligand.sdf, Example-169
hide everything
show sticks, reference
show sticks, Example-169
color red, reference
color green, Example-169
color violet, (id 6 and reference)
color violet, (id 16 and Example-169)
color gold, (id 39 and reference)
color gold, (id 40 and Example-169)
color lime, (id 8 and reference)
color lime, (id 18 and Example-169)
color magenta, (id 7 and reference)
color magenta, (id 17 and Example-169)
color cyan, (id 9 and reference)
color cyan, (id 19 and Example-169)
color grey, (id 10 and reference)
color grey, (id 20 and Example-169)
color lightblue, (id 40 and reference)
color lightblue, (id 41 and Example-169)
color dash, (id 18 and reference)
color dash, (id 23 and Example-169)
color lightpink, (id 19 and reference)
color lightpink, (id 24 and Example-169)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-169, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-169
