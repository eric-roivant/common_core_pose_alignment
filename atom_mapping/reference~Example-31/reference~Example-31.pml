load ligands/reference/ligand.sdf, reference
load ligands/Example-31/ligand.sdf, Example-31
hide everything
show sticks, reference
show sticks, Example-31
color red, reference
color green, Example-31
color violet, (id 47 and reference)
color violet, (id 38 and Example-31)
color deepteal, (id 48 and reference)
color deepteal, (id 37 and Example-31)
color lime, (id 49 and reference)
color lime, (id 58 and Example-31)
color dash, (id 50 and reference)
color dash, (id 36 and Example-31)
color lightorange, (id 20 and reference)
color lightorange, (id 7 and Example-31)
color yellow, (id 21 and reference)
color yellow, (id 6 and Example-31)
color grey, (id 22 and reference)
color grey, (id 5 and Example-31)
color lime, (id 23 and reference)
color lime, (id 4 and Example-31)
color violet, (id 24 and reference)
color violet, (id 3 and Example-31)
color cyan, (id 25 and reference)
color cyan, (id 33 and Example-31)
color yellow, (id 26 and reference)
color yellow, (id 32 and Example-31)
color lime, (id 27 and reference)
color lime, (id 2 and Example-31)
color lightorange, (id 28 and reference)
color lightorange, (id 1 and Example-31)
select selectred, color red
hide sticks, selectred
show lines, selectred
select selectgreen, color green
hide sticks, selectgreen
show lines, selectgreen
label reference, "%s"% ID
label Example-31, "%s"% ID
set label_shadow_mode, 2
set label_bg_color, back
set label_bg_color, red, reference
set label_bg_color, green, Example-31
