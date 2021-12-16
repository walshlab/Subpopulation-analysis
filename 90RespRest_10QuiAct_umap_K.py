# Follows general format found at https://umap-learn.readthedocs.io/en/latest/basic_usage.html

import pandas as pd
import seaborn as sns
import umap.umap_ as umap
from sklearn.preprocessing import StandardScaler
from matplotlib import patches
import matplotlib.pyplot as plt


data = pd.read_csv('C:/Users/Elizabeth/Documents/Eliza-Kev Python codes/90RespRest_10QuiAct_csv.csv')


# README
# !!
# Uncomment one section or the other
# !!
# README

# ################################# SECTION 1 - UMAP ###################################################################
# reducer = umap.UMAP()
# endpoints = data[ ['rr', 'nt1', 'ft1', 'nt2', 'ft2', 'na1', 'fa1'] ].values
# scaled_endpoints = StandardScaler().fit_transform(endpoints)
# embedding = reducer.fit_transform(scaled_endpoints)

# plt.scatter(
#     embedding[:, 0],
#     embedding[:, 1],
#     c=[sns.color_palette()[x] for x in data.Identifier.map({0:0, 1:1, 2:2, 3:3})])

# plt.gca().set_aspect('equal', 'datalim')

# color0 = patches.Patch(color=sns.color_palette()[0], label='Responsive Cancer Cell ')
# color1 = patches.Patch(color=sns.color_palette()[1], label='Resistant Cancer Cell')
# color2 = patches.Patch(color=sns.color_palette()[2], label='Quiescent T cell')
# color3 = patches.Patch(color=sns.color_palette()[3], label='Activated T cell')
# plt.legend(handles=[color0, color1, color2, color3], loc="lower left")
# # prop={'size':18}
# plt.xlabel('UMAP Dimension 1', fontsize=17)
# plt.ylabel('UMAP Dimension 2', fontsize=17)
# #plt.title('Responsive(0): n=6000, Resistant(1): n=5000 \n Quiescent CD3+ T(2): n=3234, Activated CD3+ T(3): n=1643')
# plt.suptitle('UMAP Projection of 7 Fluorescene Endpoints', fontsize=18)
# #####################################################################################################################


################################### SECTION 2 - Pairplot ###############################################################
sns.pairplot(data, hue='Identifier')._legend.remove()
plt.subplots_adjust(.05, .05, .95, .95)
plt.suptitle('Endpoint Analysis of Cell Set', fontsize=40)
color0 = patches.Patch(color=sns.color_palette()[0], label='Responsive Cancer Cell')
color1 = patches.Patch(color=sns.color_palette()[1], label='Resistant Cancer Cell')
color2 = patches.Patch(color=sns.color_palette()[2], label='Quiescent T Cell')
color3 = patches.Patch(color=sns.color_palette()[3], label='Activated T Cell')
plt.figlegend(handles=[color0, color1, color2, color3], loc="upper right")
########################################################################################################################


plt.show()
