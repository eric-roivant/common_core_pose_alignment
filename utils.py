"""
align the R1 ligand back to L1:
1) copy the common core coordinates
2) keep the internal coordinates for soft core
"""

from copy import deepcopy
import os
from pathlib import Path
from rdkit import Chem
from rdkit.Geometry import Point3D
import numpy as np
from scipy.spatial.transform import Rotation

#from rdkit.Geometry.rdGeometry import Point3D
#from pyquaternion import Quaternion

def rotation_matrix_from_vectors(vec1, vec2):
    """ Find the rotation matrix that aligns vec1 to vec2
    :param vec1: A 3d "source" vector
    :param vec2: A 3d "destination" vector
    :return mat: A transform matrix (3x3) which when applied to vec1, aligns it with vec2.
    """
    a, b = (vec1 / np.linalg.norm(vec1)).reshape(3), (vec2 / np.linalg.norm(vec2)).reshape(3)
    v = np.cross(a, b)
    c = np.dot(a, b)
    s = np.linalg.norm(v)
    kmat = np.array([[0, -v[2], v[1]], [v[2], 0, -v[0]], [-v[1], v[0], 0]])
    rotation_matrix = np.eye(3) + kmat + kmat.dot(kmat) * ((1 - c) / (s ** 2))
    return rotation_matrix

def generate_sybyl_mol2(ligand_mol2_path: Path, out_sybyl_mol2_path: Path):
    """
    params:
    ligand_mol2_path: the path of vacuum.mol2 file, generated by Ffengine or ffgen
    out_sybyl_mol2_path: path of vacuum_1_sybyl.mol2 output
    """
    with open(out_sybyl_mol2_path, "w") as fh:
        for line in open(ligand_mol2_path, "r").readlines():
            if " L1" in line:
                _0, atom_name, _2, _3, _4, atom_type, *_ignored = line.split()
                atom_name = atom_name.strip("0123456789")
                new_line = line.replace(
                atom_type, f"{atom_name}.{atom_type}")
                fh.write(new_line)
            else:
                fh.write(line)



def get_mapped_ids(mapping_file_path: Path):
    """
    Args:
        mapping_file_path (Path): Path of the *.map file
    Out: Dictionary with mapped ID, starting from 0
    """
    atom_mapping = {}
    with open(mapping_file_path, "r") as fh:

        for line in fh.readlines():
            id1, id2 = line.split()
            atom_mapping.update({int(id1)-1:int(id2)-1})

    return atom_mapping

def get_neighbor_atoms(atom, seen_ids: list):
    """Look for neighbor atoms of 'atom', which haven't been seen before

    Args:
        atom (_type_): RDKit Atom object
        seen_ids (list): exlucde atom ids

    """
    #print(f"for atom id: {atom.GetIdx()}, it seen_ids: {seen_ids}")
    neighbor_ids = []

    neighbor_atoms =[]

    for bond in atom.GetBonds():

        neighbor_atom = bond.GetOtherAtom(atom) 

        neighbor_id = neighbor_atom.GetIdx()

        if neighbor_id not in seen_ids:
            neighbor_atoms.append(neighbor_atom)
            neighbor_ids.append(neighbor_id)

    
    return neighbor_ids, neighbor_atoms

def find_conncted_sc_atoms(mol,start_atom_id, seen_atom_ids: list):

    """
    find the soft-core atoms connected to the start_atom_id, which is the first sofe-core atom

    params:
        mol: the RDKIT mol object
        start_atom_id: the first soft-core atom
        seen_atom_ids: the atom ids of the common-core atoms
    retrun:


    """
    connected_sc_atom_ids = [start_atom_id]
    connected_sc_atoms = [mol.GetAtomWithIdx(start_atom_id)]
    seen_atom_ids.append(start_atom_id)

    stack =[ mol.GetAtomWithIdx(start_atom_id)]

  

    while stack:
        atom = stack.pop()
        #print(f"start atom id: {start_atom_id}, seen_atom_ids:{seen_atom_ids}")
        
        neighbor_ids, neighbor_atoms = get_neighbor_atoms(atom,seen_atom_ids)
        #print(f"for atom id {atom.GetIdx()}: , its not seen neighbor atom id {neighbor_ids}")
        connected_sc_atom_ids.extend(neighbor_ids)
        connected_sc_atoms.extend(neighbor_atoms)
        stack.extend(neighbor_atoms) if bool(neighbor_atoms) else None
        seen_atom_ids.extend(neighbor_ids) if bool(neighbor_ids) else None

        #print(f"seen_atom_ids: {seen_atom_ids}")
    
    return connected_sc_atom_ids, connected_sc_atoms


def vector_from_point3D(point_1, point_2):
    """
    params:
        mol: rdkit mol class
        id_1: the first atom index
        id_2: the second atom index
    return:
        normalized vector (numpy array) from atom_id_1 to atom_id_2
    """
    delta_p = point_2 - point_1
    vector = np.array([delta_p.x, delta_p.y, delta_p.z])

    vector_norm = vector / np.sqrt(vector*vector)

    return delta_p, vector_norm

def update_conformation(mol, id_point3D_dict):
    """
    params:
        mol: the original mol object
        new_pos: a dictitionary {id:point3D}. id is the atom idx, point3D is the point3D with new position
    return:
        modify mol's coordinate and return 0
    """
    conformer=mol.GetConformer()

    for id, point3D in id_point3D_dict.items():

        conformer.SetAtomPosition(id,point3D)
    
    return 0

def get_coordiates(mol, ids):
    """
    params:
        mol: rdkit mol class
        ids: a list of atom index
    return:
        numpy array in N*3, in which each row is the [x,y,z] 
    """
    conformer = mol.GetConformer()

    coords=np.zeros((len(ids),3))

    for row in range(len(ids)):
        id = ids[row]
        point3D = conformer.GetAtomPosition(id)
        coords[row] = np.array([point3D.x,point3D.y,point3D.z]) 
    
    return coords





"""

pose_path = Path("/Users/ericchen/Desktop/Lauren_alignment_test/after_equilibrium")

mapping_path = Path("/Users/ericchen/Desktop/Lauren_alignment_test/atom_mapping")

for lig_path in pose_path.iterdir():

    if lig_path.is_dir():

        generate_sybyl_mol2(lig_path/"L1_relax.mol2", lig_path/"L1_relax_sybyl.mol2")


ref_mol = Chem.rdmolfiles.MolFromMol2File(str(pose_path/"reference"/"L1_relax_sybyl.mol2"), removeHs=False)
R_mol = Chem.rdmolfiles.MolFromMol2File(str(pose_path/"Example-12"/"L1_relax_sybyl.mol2"),removeHs=False)
R_aligned_mol = Chem.rdmolfiles.MolFromMol2File(str(pose_path/"Example-12"/"L1_relax_sybyl.mol2"),removeHs=False)

# read the common-core map
mapped_ids = get_mapped_ids(mapping_path/"reference~Example-12"/"reference~Example-12.map")

# update the common core coordiates for R1

ref_conf = ref_mol.GetConformer()
R_conf = R_mol.GetConformer()
R_aligned_conf = R_aligned_mol.GetConformer()


point=ref_conf.GetAtomPosition(0)

for ref_id, R_id in mapped_ids.items():
    # get the coordinate of ref_id:
    ref_atom_pos=ref_conf.GetAtomPosition(ref_id)

    #print(f"x: {ref_atom_pos.x}, y: {ref_atom_pos.y}, z: {ref_atom_pos.z}")

    R_aligned_conf.SetAtomPosition(R_id,ref_atom_pos)


with Chem.SDWriter("common_core_copied_12.sdf") as fh:
    fh.write(R_aligned_mol)



# in the R molecule, there are a few types of soft core atoms:

# 1-connection sc atom: only bond with common-core:
   # common_core -- F

# 2-connection sc atom: bond with common-core and another soft-core atom
   # common_core -- O-H

# 3-connection sc atom: bond with common-core and two other soft-core atoms

   # common_core - NH2

R_common_core_ids =list(mapped_ids.values())
print(f"begining R_common_core_ids: {R_common_core_ids}")


R_soft_core_ids =[]

bridge_common_core_atoms =[]
bridge_soft_core_atoms = []
connected_common_core_atoms=[]

for atom in R_mol.GetAtoms():

    idx = atom.GetIdx()

    if idx in R_common_core_ids:
        nbr_s_idxs =[]
        nbr_c_idxs =[]

        nbr_s_atoms = []
        nbr_c_atoms = []

        for nbr in atom.GetNeighbors():
            nbr_idx =  nbr.GetIdx()

            if nbr_idx not in R_common_core_ids:
                nbr_s_idxs.append(nbr_idx)
                if atom not in bridge_common_core_atoms:
                    bridge_common_core_atoms.append(atom)
                nbr_s_atoms.append(R_mol.GetAtomWithIdx(nbr_idx))
            else:
                nbr_c_idxs.append(nbr_idx)
                nbr_c_atoms.append(R_mol.GetAtomWithIdx(nbr_idx))


        if bool(nbr_s_atoms):
            bridge_soft_core_atoms.append(nbr_s_atoms)
        if bool(nbr_c_atoms):
            connected_common_core_atoms.append(nbr_c_atoms)

        print(f"For common core {idx}, it has {nbr_s_idxs} soft-core neighbors and {nbr_c_idxs} comom-core neighbors")

    else:
        pass
        #print(f"soft-core atom id: {idx}")


# idea:
# calculate the rotational matrix from the rigid bond between the bridge_common_core atoms and its connected common-atoms



print(f"the number of briding common core atoms: {len(bridge_common_core_atoms)}")
#print(bridge_soft_core_atoms)

print(bridge_common_core_atoms[0].GetIdx())


# loop over every bridging common core atom

for i in range(len(bridge_common_core_atoms)):

    c_atom = bridge_common_core_atoms[i]

    if len(bridge_soft_core_atoms[i]):

        # the softcore atom maybe one or many
        s_atoms = bridge_soft_core_atoms[i]



        for s_atom in s_atoms:

            rotation_matrix = np.zeros((3,3))
            #print(f"first soft-core id: {s_atom.GetIdx()}, R_common_core_ids: {R_common_core_ids}")

            connected_sc_atom_ids, connected_sc_atoms = find_conncted_sc_atoms(R_mol,s_atom.GetIdx(),seen_atom_ids=[i for i in R_common_core_ids])

            print(f"For common-core atom: {c_atom.GetIdx()}, its connected sc atom is: {s_atom.GetIdx()}, which conects to {len(connected_sc_atom_ids)} other sc atoms, their ids are: {connected_sc_atom_ids}, its neighbor common-core atoms: {[atom.GetIdx() for atom in connected_common_core_atoms[i]]}")

            connected_sc_coodinates =[] 
            for connected_sc_atom_id in connected_sc_atom_ids:

                connected_sc_atom_point_3D=R_conf.GetAtomPosition(connected_sc_atom_id)

                connected_sc_coodinates.extend([connected_sc_atom_point_3D.x, connected_sc_atom_point_3D.y, connected_sc_atom_point_3D.z])
            connected_sc_coordinate_array= np.asarray(connected_sc_coodinates).reshape(len(connected_sc_atom_ids),3)


            if len(connected_sc_atom_ids) == 1:  

                print(f"softcore coordinate N*3 array: {connected_sc_coordinate_array}, shape: {connected_sc_coordinate_array.shape}")

                # only 1 softcore atom, just update its coordiate by its connected conmon-core atom: NOT a GOOD IDEA but maybe a this terminal bond can be equilbrated back?

                c_atom_aligned_coordinates = R_aligned_conf.GetAtomPosition(c_atom.GetIdx())
                #print(f"c_atom_aligned_coordinates: x: {c_atom_aligned_coordinates.x}, y: {c_atom_aligned_coordinates.y}, z: {c_atom_aligned_coordinates.z}")
                c_atom_coordinates=R_conf.GetAtomPosition(c_atom.GetIdx())

                #print(f"original c_atom_coordiate: x: {c_atom_coordinates.x}, y: {c_atom_coordinates.y}, z: {c_atom_coordinates.z}")

                vector = c_atom_aligned_coordinates - c_atom_coordinates

                s_atom_ori_pos = R_conf.GetAtomPosition(s_atom.GetIdx())

                print(f" for s_atom id: {s_atom.GetIdx()}, ori position: x: {s_atom_ori_pos.x}, y: {s_atom_ori_pos.y}, z: {s_atom_ori_pos.z}")
                print(f" vector: x: {vector.x}, y: {vector.y} , z: {vector.z}")

                s_atom_new_pos = R_aligned_conf.GetAtomPosition(s_atom.GetIdx()) + vector

                print(f"s_atom_new_pos: x: {s_atom_new_pos.x}, y: {s_atom_new_pos.y}, z: {s_atom_new_pos.z}")

                R_aligned_conf.SetAtomPosition(s_atom.GetIdx(),s_atom_new_pos)

                print(f"writing file for {s_atom.GetIdx()}")

                with Chem.SDWriter(f"12_atom_id{s_atom.GetIdx()}.sdf") as fh:
                    fh.write(R_aligned_mol)  


            
            elif len(connected_sc_atom_ids) > 1:  # Somehow the translationa and rotation does not work as expected.

                # more than two soft-core atoms connected to this common-core atom

                # find the rigid bond of this common-core atom:

                c_atom_id = c_atom.GetIdx()

                c_atom_bond_types=[]
                c_atom_bonded_atom_is_ring=False

                neighboring_common_core_atoms = [atom for atom in c_atom.GetNeighbors() if atom.GetIdx() in R_common_core_ids]

                #print(f"R_common_core ids: {R_common_core_ids}")
                print(f"for briding common core atom: {c_atom.GetIdx()}, its neighboring common core ids: {[atom.GetIdx() for atom in neighboring_common_core_atoms]}")
                for neighbor_c_atom in neighboring_common_core_atoms:

                    # if the connected_c_atom is not H, F, Cl, Br: 

                    # FIXME: Maybe there is a better way to find the rigidest bond of c_atom ?

                    if neighbor_c_atom.GetAtomicNum() not in [1,9,17,35]:
                        bond_vector_ori = R_conf.GetAtomPosition(c_atom_id) - R_conf.GetAtomPosition(neighbor_c_atom.GetIdx())
                        bond_vector_aligned = R_aligned_conf.GetAtomPosition(c_atom_id) - R_aligned_conf.GetAtomPosition(neighbor_c_atom.GetIdx())

                        print(f"rigid bond between: {c_atom_id} and {neighbor_c_atom.GetIdx()} ")
                        bond_vector_ori = np.asarray([bond_vector_ori.x,bond_vector_ori.y,bond_vector_ori.z])

                        bond_vector_ori_norm = bond_vector_ori/ np.sqrt(np.sum(bond_vector_ori**2))

                        bond_vector_aligned = np.asarray([bond_vector_aligned.x, bond_vector_aligned.y, bond_vector_aligned.z])

                        bond_vector_aligned_norm = bond_vector_aligned / np.sqrt(np.sum(bond_vector_aligned**2))

                        print(f"original bond vector: {bond_vector_ori_norm}, aligned bond vector: {bond_vector_aligned_norm}")

                        rotation_matrix = rotation_matrix_from_vectors(bond_vector_ori_norm, bond_vector_aligned_norm)

                        #print(f"Rotation matrix: {rotation_matrix}")

                        break
                    else:
                        pass
                
            r = Rotation.from_matrix(rotation_matrix)

            #print("testing applying rotation")

            #print(f"after applying rotation to original vector: {r.apply(bond_vector_ori_norm)}")

            connected_sc_aligned_coordinate_array = r.apply(connected_sc_coordinate_array)

            for i in range(len(connected_sc_atom_ids)):
                connected_sc_atom_id = connected_sc_atom_ids[i]

                new_coordinates= connected_sc_aligned_coordinate_array[i]

                connect_sc_atom_new_pos = R_aligned_conf.SetAtomPosition(connected_sc_atom_id,Point3D(new_coordinates[0],new_coordinates[1],new_coordinates[2]))



with Chem.SDWriter("common_core_copied_12_final.sdf") as fh:
    fh.write(R_aligned_mol)           



"""
