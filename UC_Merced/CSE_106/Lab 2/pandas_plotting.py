import pandas as pd 
import matplotlib.pyplot as plt

data = pd.read_csv('weather_data.txt', sep = ',')

# Part a
# x = data.plot(x = 'date', y = 'actual_max_temp', color = 'red')
# data.plot(x = 'date', y = 'actual_min_temp', color = 'blue', ax = x)
# plt.ylabel('Temperature')
# plt.show()
# plt.savefig('pandas_plotting_a.png')

# Part b
data['actual_precipitation'].plot(kind = 'hist')
plt.xlabel('Actual Precipitation')
plt.show()
plt.savefig('pandas_plotting_b.png')
