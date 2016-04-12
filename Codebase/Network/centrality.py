from __future__ import division
import numpy as np


# Pipe definitions copies from DyNe
def degree_centrality(adj):
    centrality = np.sum(adj, axis=0).reshape(-1, 1)
    return centrality


def control_centrality(adj):
    def global_sync(adj_matr):
        """Compute synchronizability"""

        # Get the degree vector of the adj
        deg_vec = np.sum(adj_matr, axis=0)
        deg_matr = np.diag(deg_vec)

        # Laplacian
        lapl = deg_matr - adj_matr

        # Compute eigenvalues and eigenvectors, ensure they are real
        eigval, eigvec = np.linalg.eig(lapl)
        eigval = np.real(eigval)

        # Sort smallest to largest eigenvalue
        eigval = np.sort(eigval)
        sync = np.abs(eigval[1] / eigval[-1]).reshape(1, 1)

        return sync

    centrality = []
    base_sync = global_sync(adj)
    for node_r in np.arange(adj.shape[0]):
        adj_mod = adj.copy()
        adj_mod = np.delete(adj_mod, (node_r), axis=0)
        adj_mod = np.delete(adj_mod, (node_r), axis=1)

        mod_sync = global_sync(adj_mod)
        centrality.append((mod_sync-base_sync) / base_sync)
    centrality = np.array(centrality).reshape(-1, 1)

    return centrality

