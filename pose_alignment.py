from copy import deepcopy
import os
from pathlib import Path
from rdkit import Chem
from rdkit.Geometry import Point3D
import numpy as np
from scipy.spatial.transform import Rotation


from utils import rotation_matrix_from_vectors, generate_sybyl_mol2, get_mapped_ids, find_conncted_sc_atoms, update_conformation, vector_from_point3D
from utils import vector_from_point3D, get_coordiates

pose_path = Path("/Users/ericchen/Desktop/Lauren_alignment_test/after_equilibrium")
mapping_path = Path("/Users/ericchen/Desktop/Lauren_alignment_test/atom_mapping")

for lig_path in pose_path.iterdir():

    if lig_path.is_dir():

        generate_sybyl_mol2(lig_path/"L1_relax.mol2", lig_path/"L1_relax_sybyl.mol2")


ref_mol = Chem.rdmolfiles.MolFromMol2File(str(pose_path/"reference"/"L1_relax_sybyl.mol2"), removeHs=False)

for lig_path in [ lig_dir for lig_dir in pose_path.iterdir() if (lig_dir.is_dir() and os.path.basename(lig_dir) != "reference")]:

   
    lig_name = os.path.basename(lig_path)

    print(f"ligand name: {lig_name}")

    R_mol = Chem.rdmolfiles.MolFromMol2File(str(lig_path/"L1_relax_sybyl.mol2"),removeHs=False)
    R_ori_mol = Chem.rdmolfiles.MolFromMol2File(str(lig_path/"L1_relax_sybyl.mol2"),removeHs=False)

    # read the common-core map
    mapped_ids = get_mapped_ids(f"{mapping_path}/reference~{lig_name}/reference~{lig_name}.map")

    R_common_core_ids = list(mapped_ids.values())
    R_common_core_atoms = [R_mol.GetAtomWithIdx(i) for i in R_common_core_ids]


    #print(R_common_core_ids)

    for ref_id, R_id in mapped_ids.items():

        ref_point3D = ref_mol.GetConformer().GetAtomPosition(ref_id)
        R_point3D = R_mol.GetConformer().GetAtomPosition(R_id)

        update_conformation(R_mol,{R_id:ref_point3D})

        # update the R common core coordiate

        c_atom = R_mol.GetAtomWithIdx(R_id)

        neighbor_heavy_common_atoms = [atom for atom in c_atom.GetNeighbors() if (atom.GetIdx() in R_common_core_ids and atom.GetAtomicNum() !=1)]

        neighbor_soft_atoms = [atom for atom in c_atom.GetNeighbors() if atom.GetIdx() not in R_common_core_ids]

        
        if bool(neighbor_soft_atoms):

            #print(f"for common atom id: {R_id},"
            #f"\n   its neighbor soft atoms: {[atom.GetIdx() for atom in neighbor_soft_atoms]}"
            #f"\n   its neighbor heavy common atoms: {[atom.GetIdx() for atom in neighbor_heavy_common_atoms]}")
            
            # to avoid tranlating a closed ring for multiple times
            s_chain_ids_temp = [] 

            for s_atom in neighbor_soft_atoms:

                s_chain_ids, s_chain_atoms = find_conncted_sc_atoms(R_mol,s_atom.GetIdx(),seen_atom_ids=[i for i in R_common_core_ids])


                # when the neighbor soft atom is a termimal atom
                
                    

                delta_point3D, _vector_norm= vector_from_point3D(R_point3D, ref_point3D)

                #s_atom_updated_point3D = R_mol.GetConformer().GetAtomPosition(s_chain_ids[0]) + delta_point3D
                #print(f"c_atom_id: {R_id}, s_chain_ids: {s_chain_ids}")
                

                if set(s_chain_ids) != set(s_chain_ids_temp):
                    #print(f"updateing all soft atom cooridates by shift of: {R_id}")
                    for s_id in s_chain_ids:
                        update_conformation(R_mol,{s_id: R_mol.GetConformer().GetAtomPosition(s_id) + delta_point3D})
                    s_chain_ids_temp=deepcopy(s_chain_ids)
                    

                """
                elif len(s_chain_ids) < 1:


                    s_chain_ori_coords = get_coordiates(R_mol, s_chain_ids)
                    most_rigid_bond = R_mol.GetBondBetweenAtoms(R_id,neighbor_heavy_common_atoms[0].GetIdx())

                    for nbr_atom in neighbor_heavy_common_atoms:

                        bond=R_mol.GetBondBetweenAtoms(R_id,nbr_atom.GetIdx())

                        if bond.GetBondTypeAsDouble() >  most_rigid_bond.GetBondTypeAsDouble():

                            most_rigid_bond = bond
                    
                    other_atom_id = most_rigid_bond.GetOtherAtomIdx(R_id)

                    print(f"using rigid bond vector from atom id: {other_atom_id} to {R_id}")

                    # get the vector before and after updating R common core

                    c_atom_ori_point3D = R_ori_mol.GetConformer().GetAtomPosition(R_id)
                    heacy_atom_ori_point3D = R_ori_mol.GetConformer().GetAtomPosition(other_atom_id)
                    _1, vector_ori = vector_from_point3D(heacy_atom_ori_point3D,c_atom_ori_point3D)

                    c_atom_new_point3D = R_mol.GetConformer().GetAtomPosition(R_id)
                    heavey_atom_new_point3D = R_mol.GetConformer().GetAtomPosition(other_atom_id) 
                    _2, vector_new = vector_from_point3D(heavey_atom_new_point3D,c_atom_new_point3D)

                    rot_matrix = rotation_matrix_from_vectors(vector_ori, vector_new)

                    rot = Rotation.from_matrix(rot_matrix)

                    s_chain_new_coords = rot.apply(s_chain_ori_coords)

                    s_id_point3D={}
                
                    for row in range(len(s_chain_ids)):
                        s_id = s_chain_ids[row]
                        s_coords = s_chain_new_coords[row]
                        s_point3D = Point3D(s_coords[0],s_coords[1],s_coords[2])
                        s_id_point3D.update({s_id:s_point3D })
                    
                    update_conformation(R_mol,s_id_point3D)
                """

    with Chem.SDWriter(f"{str(lig_path)}/{lig_name}_aligned.sdf") as fh:
                        fh.write(R_mol)


