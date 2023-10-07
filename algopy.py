import pandas as pd
import numpy as np

data0 = pd.read_csv(path0)
data1 = pd.read_csv(path1)
data2 = pd.read_csv(path2)
data3 = pd.read_csv(path3)
data4 = pd.read_csv(path4)
data5 = pd.read_csv(path5)
data6 = pd.read_csv(path6)
data7 = pd.read_csv(path7)

data_list = [data0, data1, data2, data3, data4, data5, data6, data7]

multipliers = [1.0, 0.9375, 0.8750, 0.8125, 0.7500, 0.6875, 0.6250, 0.5625]

importance_list = [1,2,0,4,3,7,5,6] # Sıralama sonucu gelenler

state_list = ['Alabama', 'Arkansas', 'Arizona', 'California', 'Colorado', 'Connecticut',
                'District of Columbia', 'Delaware', 'Florida', 'Georgia', 'Iowa', 'Idaho', 'Illinois',
                'Indiana', 'Kansas', 'Kentucky', 'Louisiana', 'Massachusetts', 'Maryland', 'Maine',
                'Michigan', 'Minnesota', 'Missouri', 'Mississippi', 'Montana', 'North Carolina',
                'North Dakota', 'Nebraska', 'New Hampshire', 'New Jersey', 'New Mexico', 'Nevada',
                'New York', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina',
                'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Virginia', 'Vermont', 'Washington',
                'Wisconsin', 'West Virginia', 'Wyoming']


state_point_list = [0 for i in range(50)]

for i, state in enumerate(state_list):
    for j, point in enumerate(importance_list):
        state_point_list[i] += data_list[j][data_list[j]['State'] == state]['Rank'].values[0] * point


state_score_tuples = list(zip(state_list, state_point_list))

sorted_state_score_tuples = sorted(state_score_tuples, key=lambda x: x[1], reverse=True)

sorted_states = [state for state, score in sorted_state_score_tuples]

print(sorted_states)
