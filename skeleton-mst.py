import networkx as nx
import numpy as np
from plyfile import PlyData, PlyElement
import sys

#############
# Functions #
#############

#
# PLY file stuff
#

def ply_to_graph(file_name, normalize_width_radius=False):
    """ Load a NetworkX graph from a PLY file. """
    print("Loading graph from", file_name, "...")

    plydata = PlyData.read(file_name)

    elements_with_type = plydata.elements
    for element in elements_with_type:
        el_name = element.name

        if el_name == 'vertex':
            num_verts = element.count
            keys = list(range(num_verts))

            v_property_list = dict()
            for prop in element.properties:
                prop_value = plydata[el_name][prop.name]

                # We store width and radius later if we want to normalize them. In a couple of lines,
                # you'll see that we need both the radius and the width to normalize. That way we
                # preserve the ratio.
                if normalize_width_radius and prop.name == "radius":
                    tmp_rad = prop_value
                elif normalize_width_radius and prop.name == "bt2":
                    tmp_wid = prop_value
                else:
                    v_property_list[prop.name] = dict(zip(keys, list(prop_value)))

            if normalize_width_radius:
                rad = tmp_rad
                wid = tmp_wid
                max_val = max(rad.max(), wid.max())
                min_val = min(rad.min(), wid.min())
                rad = (rad - min_val) / (max_val - min_val)
                wid = (wid - min_val) / (max_val - min_val)
                v_property_list["radius"] = dict(zip(keys, list(rad)))
                v_property_list["bt2"] = dict(zip(keys, list(wid)))

        elif el_name == 'edge':
            v1 = plydata[el_name]['vertex1']
            v2 = plydata[el_name]['vertex2']
            edges = list(zip(list(v1), list(v2)))

            e_property_list = dict()
            for prop in element.properties:
                if prop.name != 'vertex1' and prop.name != 'vertex2':
                    prop_value = plydata[el_name][prop.name]
                    e_property_list[prop.name] = dict(zip(edges, list(prop_value)))

    g = nx.Graph(edges)
    for name in v_property_list:
        nx.set_node_attributes(g, v_property_list[name], name)
    for name in e_property_list:
        nx.set_edge_attributes(g, e_property_list[name], name)

    print("Graph with", g.number_of_nodes(), "nodes and", g.number_of_edges(), " edges loaded.")

    return g, dict(zip(keys, list(tmp_rad))), dict(zip(keys, list(tmp_wid)))
        

# TODO: Make sure every array has ordering from 0 to num_vertex
def graph_to_ply(graph, file_name):
    """ Saves a NetworkX graph to a ply file """
    g = nx.convert_node_labels_to_integers(graph)

    print("Saving ply file...")

    # Extract the properties of the nodes
    sample = list(g.nodes())[0]
    vertex_properties = list(g.nodes[sample].keys())

    # Extract the values of said properties:
    vertex_prop_values = []
    dt = []
    for prop in vertex_properties:
        # Not ordered:
        v_props = []
        v_order = []
        for v in g.nodes():
            v_order.append(v)
            v_props.append(g.nodes[v][prop])
        to_sort = np.array([v_order, v_props]).transpose()
        to_sort = to_sort[np.argsort(to_sort[:, 0])]
        v_props = list(to_sort[:, 1])
        # v_props = list(nx.get_node_attributes(g, name=prop).values())

        if np.array(v_props[0]).dtype == np.dtype('i8'):
            dt_tmp = np.dtype('i4')
        else:
            dt_tmp = np.array(v_props[0]).dtype

        if type(v_props[0]) != list:
            dtype = (prop, dt_tmp)
        else:
            dtype = (prop, dt_tmp, (len(v_props),))

        vertex_prop_values.append(v_props)

        dt.append(dtype)
    vertex_prop_values = list(zip(*vertex_prop_values))
    vertex_prop_values = np.array(vertex_prop_values, dtype=dt)

    # Extract properties for the edges
    if type(g) == nx.MultiGraph:
        sample = list(g.edges(keys=True))[0]
    else:
        sample = list(g.edges())[0]
    edge_properties = list(g.edges[sample].keys())

    # Extract the values of said properties:
    edges = list(g.edges())
    edges = zip(*edges)  # I want it [[source1,source2,...],[target1,target2,...]]
    edge_prop_values = list(map(list, edges))  # Remove tuples
    dt = [('vertex1', 'i4'), ('vertex2', 'i4')]
    for prop in edge_properties:
        if prop == "extremes":
            continue  # TODO: this is bandaid code. Better way is to just not store lists in general
        e_props = list(nx.get_edge_attributes(g, name=prop).values())

        if np.array(e_props[0]).dtype == np.dtype('i8'):
            dt_tmp = np.dtype('i4')
        else:
            dt_tmp = np.array(e_props[0]).dtype

        if type(e_props[0]) != list:
            dtype = (prop, dt_tmp)
        else:
            dtype = (prop, dt_tmp, (len(e_props),))

        edge_prop_values.append(e_props)
        dt.append(dtype)
    edge_prop_values = list(zip(*edge_prop_values))
    edge_prop_values = np.array(edge_prop_values, dtype=dt)

    # Now for PlyFile stuff:
    v = PlyElement.describe(vertex_prop_values, 'vertex')
    e = PlyElement.describe(edge_prop_values, 'edge')
    PlyData([v, e], text=True).write(file_name)

    print("Graph saved to", file_name)


#
# Graph structure
#

def super_edges(skeleton, source=None):
    """
    Accumulate consecutive degree 2 nodes to a list of "super edges"
    INPUT:
    skeleton - NetworkX graph
    source - source node to start dfs algorithm (searches for one by default)
    OUTPUTS:
    s_edges - a list of lists. Each sublist has consecutive degree 2 nodes
    """

    # If a source node for dfs is not provided, just search for any leaf
    if source is None:
        for node in skeleton.nodes():
            if skeleton.degree(node) != 2:
                source = node
                break

    s_edges = []
    current_super_edge = [source]

    found = dict()

    for (v, u) in nx.edge_dfs(skeleton, source):
        # We iteratively add the target node in an edge. For empty super edges, we also add the first
        if current_super_edge == []:
            current_super_edge.append(v)

        # Add the target node, also tag it in the vertex locator
        current_super_edge.append(u)

        # If this is the final edge in a super edge, create a new super edge and continue from there
        if skeleton.degree(u) > 2 or skeleton.degree(u) == 1:
            s_edges.append(current_super_edge)
            current_super_edge = []

    return s_edges


def super_graph(skeleton, attr=[], node_attr=[], s_edges=[]):
    """
    Like the super_edges function, but returns a multi-graph instead of a list of super edges.
    INPUTS:
    skeleton - NetworkX graph
    attr - [String] or [(String, f:[Node-Attribute] -> Float)], where f is an aggregation function for node attributes
    node_attr - [String] attributes to directly move from skeleton nodes to multi-graph node, instead of to super-edge
    s_edges - [[Node]], in case super_edges have been calculated previously
    OUTPUT
    - hg - The multigraph with attribute "edge_locator" that maps multigraph edge to the super_edges list
    - super_edges - a list of lists. Each sublist has consecutive degree 2 nodes
    """
    if node_attr is None:
        node_attr = []

    # Maybe these edges have already been calculated
    if s_edges == []:
        edges = super_edges(skeleton)
    else:
        edges = s_edges

    hg = nx.MultiGraph()
    edge_locator = dict()

    # Graph creation from edges
    i = 0
    for edge in edges:

        source, destination = edge[0], edge[len(edge) - 1]

        # Check if this edge is part of stem. It's part of the stem if 
        # 1. inside the branch, any vertex is part of the stem:
        isstem = 0
        for stem_vert in edge[1:-1]:
            if skeleton.nodes[stem_vert]["stem"] == 1:
                isstem = 1
                break
        # 2. if both endpoints are part of the stem
        if skeleton.nodes[source]["stem"] * skeleton.nodes[destination]["stem"]:
            isstem = 1
        
        hg.add_node(source, stem=isstem)
        hg.add_node(destination, stem=isstem)

        k = hg.add_edge(source, destination)
        edge_locator[(source, destination, k)] = i
        edge_locator[(destination, source, k)] = i

        for a in attr:
            if a is tuple:
                a, agg = a
            else:
                agg = np.average
            og_weights = [skeleton.nodes[node][a] for node in edge]
            hg.edges[(source, destination, k)][a] = agg(og_weights)

        i = i + 1

    nx.set_edge_attributes(hg, edge_locator, "edge_locator")

    # Assign node attributes
    if node_attr != []:
        for node in hg.nodes():
            for a in node_attr:
                hg.nodes[node][a] = skeleton.nodes[node][a]

    return hg, edges


def remove_duplicate_coordinates(skeleton):
    """
    One problem with the skeleton is that it seems to have one or
    more vertices with the same coordinates. If these edges are connected,
    then this function removes them.
    """

    unique_coords = dict()

    for node in skeleton.nodes():
        x = skeleton.nodes[node]["x"]
        y = skeleton.nodes[node]["y"]
        z = skeleton.nodes[node]["z"]
        if (x, y, z) not in unique_coords:
            unique_coords[(x, y, z)] = []

        unique_coords[(x, y, z)].append(node)

    for nodes in unique_coords.values():
        if len(nodes) > 1:
            fix = nodes[0]
            for n in nodes[1:]:
                for neighbor in nx.neighbors(skeleton, n):
                    skeleton.add_edge(fix, neighbor)

                skeleton.remove_node(n)

    count = 0
    for (u, v) in skeleton.edges():
        if u == v:
            count += 1
            skeleton.remove_edge(u, v)


def get_mst_graph(super_graph):
    """
        Outputs a graph just like super-graph, but all the junctions are
        cliques, instead of vertices. When running mst on it, it should only
        cut out edges inside the cliques.
    """
    super_graph_radii = nx.get_edge_attributes(super_graph, "radius")
    node_name_gen = max(list(super_graph.nodes())) + 1
    mst_graph = nx.Graph()
    for (u, v, k) in super_graph.edges(keys=True):
        # (1) obtain the node properties we need for the weights and process it for edge data
        # w = super_graph.edges[(u, v, k)]['cap-0']
        w = 1

        # (2) add the nodes and edges to mst_graph
        mst_graph.add_node(u, stem=skeleton.nodes[u]["stem"])
        mst_graph.add_node(node_name_gen, stem=skeleton.nodes[u]["stem"]*skeleton.nodes[v]["stem"] )
        mst_graph.add_node(v, stem=skeleton.nodes[v]["stem"])


        mst_graph.add_edge(u, node_name_gen, weight=w, radius=super_graph_radii[(u, v, k)], \
                           edge_locator=super_graph.edges[(u, v, k)]["edge_locator"])
        mst_graph.add_edge(node_name_gen, v, weight=w, radius=super_graph_radii[(u, v, k)], \
                           edge_locator=super_graph.edges[(u, v, k)]["edge_locator"])
        mst_graph.nodes[node_name_gen]["is-super-edge"] = True
        mst_graph.nodes[node_name_gen]['key'] = k
        mst_graph.nodes[u]["is-super-edge"] = False
        mst_graph.nodes[v]["is-super-edge"] = False

        # Extremes contains the corner two nodes for each edge
        # useful for angle information
        (e1, e2, e3, e4) = super_graph.edges[(u, v, k)]["extremes"]

        if e1 == u:
            mst_graph.edges[(u, node_name_gen)]["closest-point"] = e2
            mst_graph.edges[(node_name_gen, v)]["closest-point"] = e3
        else:
            mst_graph.edges[(u, node_name_gen)]["closest-point"] = e3
            mst_graph.edges[(node_name_gen, v)]["closest-point"] = e2

        node_name_gen += 1

    return mst_graph


#
# Things related to costs
#

def assign_node_weights(skeleton, volume, func, name, normalize=False):
    """
    Adds an attribute to skeleton based on func's output
    INPUT:
    skeleton - NetworkX graph
    volume - 3D Numpy Array
    func - f:(skeleton, volume, node, property) -> Value
    name - name of attribute to be assigned
    """
    if normalize:
        vals = np.array([func(skeleton, volume, n) for n in skeleton.nodes()])
        vals = list((vals - vals.min()) / (vals.max() - vals.min()))
        keys = list(skeleton.nodes())
        assignments = dict(zip(keys, vals))
    else:
        assignments = {n: func(skeleton, volume, n) for n in skeleton.nodes()}

    nx.set_node_attributes(skeleton, assignments, name)


def extremes_assignment(graph, volume, edge, hyper_edges, edge_locator):
    """
    func input for assign_node_weights, represents the corner vertices at
    the super edge
    """
    hyp_edges = hyper_edges[edge_locator[edge]]
    if len(hyp_edges) >= 2:
        return (hyp_edges[0], hyp_edges[1], hyp_edges[-2], hyp_edges[-1])


def eccentricity_assignment(graph, volume, node):
    """
        func input for assign_node_weights, represents the eccentricity of
        the cross section at the node.
    """
    rad = graph.nodes[node]["radius"]
    wid = graph.nodes[node]["bt2"]

    if wid != 0:
        dist_to_focus = np.sqrt(np.abs(np.power(wid, 2) - np.power(rad, 2)))
        dist_to_focus = max(dist_to_focus, 0)  # in case of issue
        return np.power(dist_to_focus / wid, 3)
    else:
        return 0


def s_edge_to_vec(super_edge, x, y, z, t=2):
    """
    Convert a super-edge to a vector with direction.
    t represents how many nodes to travel the super-edge before
    creating the vector
    """
    t = min(t, len(super_edge))

    u = super_edge[-t]
    v = super_edge[-1]

    u_point = np.array([x[u], y[u], z[u]])
    v_point = np.array([x[v], y[v], z[v]])

    return v_point - u_point



# Some cost functions that take into consideration the intersection
def joint_cost(connectivity_graph, skeleton, s_graph, s_edges):
    """
    Assign a cost to the attribute 'joint-cost'
    Despite the name, this cost only takes into consideration the angle of the vectors
    obtained with the s_edge_to_vec function
    """
    vec_method = "long-vec"
    vec_t = 5

    x = nx.get_node_attributes(skeleton, "x")
    y = nx.get_node_attributes(skeleton, "y")
    z = nx.get_node_attributes(skeleton, "z")

    # For each node, minimize angle * change_radius cost
    for node in connectivity_graph:
        if connectivity_graph.nodes[node]["is-super-edge"]:
            continue

        p1 = np.array([x[node], y[node], z[node]])
        r1 = skeleton.nodes[node]['radius']

        # Obatain some important properties for each edge incident to that node
        incident_edges = []
        for neigh in nx.neighbors(connectivity_graph, node):
            closest_point = connectivity_graph.edges[(node, neigh)]['closest-point']
            key = connectivity_graph.nodes[neigh]["key"]
            p2 = np.array([x[closest_point], y[closest_point], z[closest_point]])
            r2 = connectivity_graph.edges[(node, neigh)]["radius"]
            incident_edges.append(((neigh, key), p2, r2))

        # Nested for. For each incident edge, look at its incident edges
        for i in range(len(incident_edges)):

            ((neigh_id, key), p2, r2) = incident_edges[i]
            opt_weight = np.inf
            vec1 = p1 - p2

            # Obtain a vector from the super edge
            neighs = [ni for ni in nx.neighbors(connectivity_graph, neigh_id)]
            if len(neighs) == 2: neighs.remove(node)  # only once, a second 'node' means self loop
            if len(neighs) != 0:
                s_edge = (node, neighs[0], key)
                s_edge_vertices = s_edges[s_graph.edges[s_edge]["edge_locator"]]

                if node == s_edge_vertices[0]:
                    s_edge_vertices.reverse()

                vec1 = s_edge_to_vec(s_edge_vertices, x, y, z, t=vec_t)

            vec1 = vec1 / np.linalg.norm(vec1)

            # For all neighbors, find the one with least angle
            for j in range(len(incident_edges)):
                if i == j: continue
                ((nid, key), p3, r3) = incident_edges[j]
                vec2 = p3 - p1

                # Obtain a vector from the super edge
                neighs = [ni for ni in nx.neighbors(connectivity_graph, nid) if ni != node]
                if len(neighs) == 2: neighs.remove(node)  # only once, a second 'node' means self loop
                if len(neighs) != 0:
                    s_edge = (node, neighs[0], key)
                    s_edge_vertices = s_edges[s_graph.edges[s_edge]["edge_locator"]]

                    if node == s_edge_vertices[0]:
                        s_edge_vertices.reverse()

                    vec2 = -1 * s_edge_to_vec(s_edge_vertices, x, y, z, t=vec_t)

                vec2 = vec2 / np.linalg.norm(vec2)
                prod = min(max(np.dot(vec1, vec2), -1.), 1.)
                angle = np.arccos(prod)
                radius = max(r2, r3) / max(min(r2, r3), 0.001)
                opt_weight = min(opt_weight, angle)  # * radius)

            if np.isinf(opt_weight):
                opt_weight = 0  # leaf
            connectivity_graph.edges[(node, neigh_id)]["joint-cost"] = opt_weight


def reassign_weights(graph, tree, root=None, eps=0.5):
    """
    Modifies graph based on spanning tree decision, and radius.
    We want a monotonically decreasing radius from the root.
    """
    # If no root is provided, find the first leaf, choose that
    if root is None:
        for n in graph.nodes():
            if nx.degree(graph, n) == 1:
                root = n
                break

    di_tree = nx.dfs_tree(tree, root)  # Returns a digraph
    for (u, v) in di_tree.edges():
        neighbors = [n for n in nx.neighbors(graph, v) if n != u]
        for neighbor in neighbors:
            if graph.edges[(v, neighbor)]["radius"] > graph.edges[(u, v)]["radius"]:
                graph.edges[(v, neighbor)]["weight"] += eps


##########
# Script #
##########

#
# Command line arguments
#

if len(sys.argv) > 1:
    inf = sys.argv[1]  # input file name
else:
    print('No input file provided (ie "python skeleton-mst.py <input-file>.ply <output-file>.ply")')
    quit()
if len(sys.argv) > 2:
    outf = sys.argv[2] # output file name
else:
    print('No output file provided (ie "python skeleton-mst.py <input-file>.ply <output-file>.ply")')
    quit()
if len(sys.argv) > 3:
    root = int(sys.argv[3])
    iters = 4
else:
    root = None
    iters = 1
if len(sys.argv) > 4:
    iters = int(sys.argv[4])  # You can specify the number of iterations of MST

#
# Import skeleton
#

skeleton, og_radius, og_bt2 = ply_to_graph(inf, normalize_width_radius=True)

# Skeletons seem to have duplicate coordinates
remove_duplicate_coordinates(skeleton)

#
# Create "super-graph"
#

print("Assigning weights to skeleton nodes")
assign_node_weights(skeleton, None, eccentricity_assignment, "eccentricity")
assign_node_weights(skeleton, None, lambda sk, vo, no: 0.1 / max(sk.nodes[no]["radius"], 0.01), "rad-0")

print("Creating super graph")
sg, s_edges = super_graph(skeleton, ["radius", "bt2", "eccentricity", "rad-0", "stem"], \
                          ["x", "y", "z", "radius", "bt2", "stem"])

el = nx.get_edge_attributes(sg, "edge_locator")
for edge in sg.edges(keys=True):
    sg.edges[edge]["extremes"] = extremes_assignment(skeleton, None, edge, s_edges, el)

#
# Create MST-graph (cliques at each joint)
#

print("Generating the graph to process with MST")
mst_graph = get_mst_graph(sg)

print("Assigning cost")
# Assign different weights to mst-graph, based on angles
joint_cost(mst_graph, skeleton, sg, s_edges)

# "Amplify" joint costs.
#   Any "H" shape will be penalized. We do this by penalizing edges where both sides
#   have large angle.
for node in mst_graph.nodes():
    neighbors = [neigh for neigh in nx.neighbors(mst_graph, node)]

    if mst_graph.nodes[node]["is-super-edge"] and len(neighbors) == 2:
        new_weight = mst_graph.edges[(node, neighbors[0])]["joint-cost"] * mst_graph.edges[(node, neighbors[1])][
            "joint-cost"]
        mst_graph.edges[(node, neighbors[0])]["joint-cost"] = new_weight
        mst_graph.edges[(node, neighbors[1])]["joint-cost"] = new_weight

jc = nx.get_edge_attributes(mst_graph, "joint-cost")
for k in jc:
    if jc[k] > 1:
        jc[k] = 1
    elif jc[k] < 0:
        jc[k] = 0

nx.set_edge_attributes(mst_graph, jc, "joint-cost")
nx.set_edge_attributes(mst_graph, jc, "weight")

ct = 0
for (u, v) in mst_graph.edges():
    if mst_graph.nodes[u]["stem"] and mst_graph.nodes[v]["stem"]:
        ct += 1
        mst_graph.edges[(u, v)]["weight"] = -10000

#
# Run minimum spanning tree
#

# If root is provided, we may enforce a monotonically decreasing radius
# by running spanning tree time and again.

print("Running mst")
if iters is None:
    tree = nx.minimum_spanning_tree(mst_graph)
else:
    for i in range(iters):
        tree = nx.minimum_spanning_tree(mst_graph)
        reassign_weights(mst_graph, tree, root)


#
# We want unnormalized radius in skeleton, and no other property
#

for node in skeleton.nodes():
    if "eccentricity" in skeleton.nodes[node]:
        del skeleton.nodes[node]["eccentricity"]
    if "rad-0" in skeleton.nodes[node]:
        del skeleton.nodes[node]["rad-0"]

nx.set_node_attributes(skeleton, og_radius, "radius")
nx.set_node_attributes(skeleton, og_bt2, "bt2")

#
# Remove edges in the skeleton that correspond
# to removed edges in the clique graph
#

skel = skeleton.copy()

for s_node in tree.nodes():
    if mst_graph.nodes[s_node]["is-super-edge"] and nx.degree(tree, s_node) == 1:
        neighs = list(nx.neighbors(mst_graph, s_node))
        if len(neighs) == 1: neighs.append(neighs[0])  # loop to itself
        e_locator = sg.edges[(neighs[0], neighs[1], mst_graph.nodes[s_node]["key"])]["edge_locator"]
        super_edge = s_edges[e_locator]

        # Remove entire branch:
        # for i in range(len(super_edge) - 1):
        #     skel.remove_edge(super_edge[i], super_edge[i + 1])
        # for node in super_edge[1:-2]:
        #     skel.remove_node(node)

        # Remove one edge:
        tree_neigh = list(nx.neighbors(tree, s_node))[0]
        cut_part = [n for n in neighs if n != tree_neigh]

        if len(cut_part) != 1:
            cut_part = tree_neigh  # self loop
        else:
            cut_part = cut_part[0]  # 1-element list

        if super_edge[0] != cut_part:
            skel.remove_edge(super_edge[-1], super_edge[-2])
        else:
            skel.remove_edge(super_edge[0], super_edge[1])

for (u, v) in skeleton.edges():
    br = skeleton.nodes[u]["stem"] * skeleton.nodes[v]["stem"]
    if br and (u, v) not in skel.edges():
        print("Added back to skeleton")
        skel.add_edge(u, v)

#
# Save the graph in a ply file
#

graph_to_ply(skel, outf)