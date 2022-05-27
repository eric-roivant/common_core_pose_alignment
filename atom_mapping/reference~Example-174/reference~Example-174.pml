load ligands/reference/ligand.sdf, reference
load ligands/Example-174/ligand.sdf, Example-174
hide everything
show sticks, reference
show sticks, Example-174
color red, reference
color green, Example-174
color cyan, (id 27 and reference)
color cyan, (id 9 and Example-174)
color purple, (id 28 and reference)
color purple, (id 10 and Example-174)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-174, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-174
