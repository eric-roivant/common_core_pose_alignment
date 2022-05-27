"""
test the roation 
"""
import numpy as np
from pyquaternion import Quaternion
from scipy.spatial.transform import Rotation
from utils import get_neighbor_atoms, get_mapped_ids, find_conncted_sc_atoms
from copy import deepcopy
import os
from pathlib import Path
from rdkit import Chem
from rdkit.Geometry import Point3D



ligand_name = "Example-344"

pose_path = Path("/Users/ericchen/Desktop/Lauren_alignment_test/after_equilibrium")
R_mol = Chem.rdmolfiles.MolFromMol2File(str(pose_path/ligand_name/"L1_relax_sybyl.mol2"), removeHs=False)
mapping_path = Path("/Users/ericchen/Desktop/Lauren_alignment_test/atom_mapping")
mapped_ids = get_mapped_ids(f"{mapping_path}/reference~{ligand_name}/reference~{ligand_name}.map")

R_common_core_ids = list(mapped_ids.values())

print(f"R_common_core: {R_common_core_ids}")

s_atom=R_mol.GetAtomWithIdx(1)

s_chain_ids, s_chain_atoms = find_conncted_sc_atoms(R_mol,s_atom.GetIdx(),seen_atom_ids=[i for i in R_common_core_ids])

print(s_chain_ids)





