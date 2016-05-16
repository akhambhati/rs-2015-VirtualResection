from __future__ import division

import os
import sys
import glob
import h5py

import numpy as np
import pandas as pd

from ..Common.display import my_display
from ..Network import centrality

def execute(event_name, dyne_out_path, dyne_log_path, save_path, n_null=100):
    n_null = int(n_null)
    dyne_out_path = str(dyne_out_path)
    dyne_log_path = str(dyne_log_path)
    save_path = str(save_path)

    # Get data from DyNe
    my_display('\nProcessing: {}'.format(event_name), True)

    df_log = pd.read_csv(dyne_log_path, delimiter=',')
    pipe_hash_ccentral = np.array(df_log[df_log.PIPE_NAME == 'VirtualResection'].DOWNSTREAM_HASH)[0]
    pipe_hash_dcentral = np.array(df_log[df_log.PIPE_NAME == 'DegreeCentrality'].DOWNSTREAM_HASH)[0]
    pipe_hash_funcnetw = np.array(df_log[df_log.PIPE_NAME == 'MTCoh'].DOWNSTREAM_HASH)[0]

    df_outp = h5py.File(dyne_out_path, 'r')
    ev_ccentral = df_outp[pipe_hash_ccentral]['data'][:, :, 0]
    ev_dcentral = df_outp[pipe_hash_dcentral]['data'][:, :, 0]
    ev_funcnetw = df_outp[pipe_hash_funcnetw]['data'][:, :, :]
    df_outp.close()

    # Rewire the network
    n_win = ev_funcnetw.shape[0]
    n_node = ev_funcnetw.shape[1]
    triu_ix, triu_iy = np.triu_indices(n_node, k=1)

    ev_ccentral_null = np.zeros((n_null, n_win, n_node))
    ev_dcentral_null = np.zeros((n_null, n_win, n_node))

    for null_ix in xrange(n_null):
        my_display('\n{} of {}'.format(null_ix+1, n_null), True)

        for win_ix in xrange(n_win):
            conn = ev_funcnetw[win_ix, triu_ix, triu_iy]
            A_rewire = np.zeros((n_node, n_node))
            A_rewire[triu_ix, triu_iy] = np.random.permutation(conn)
            A_rewire += A_rewire.T

            ev_ccentral_null[null_ix, win_ix, :] = centrality.control_centrality(A_rewire)[:, 0]
            ev_dcentral_null[null_ix, win_ix, :] = centrality.degree_centrality(A_rewire)[:, 0]

    np.savez(save_path,
             control_centrality=ev_ccentral,
             control_centrality_null=ev_ccentral_null,
             degree_centrality=ev_dcentral,
             degree_centrality_null=ev_dcentral_null)
