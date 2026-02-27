import pandas as pd 

data = pd.read_csv('weather_data.txt', sep = ',')

# Part a
high_precipitation = data.sort_values(['actual_precipitation'], ascending = False)
print('Highest precipitation: {}'.format(high_precipitation))

# Part b
data['date'] = pd.to_datetime(data['date'].astype(str), format = '%Y-%m-%d')

avg_actual_temperature = (data['date'] >= '2014-07-01') & (data['date'] <= '2014-07-31')
print('Average actual temperature July 2014: {}'.format(data.mean()['actual_max_temp']))

# Part c
print('Days actual max temperature = record max temperature:\n {}'.format(data.loc[data['actual_max_temp'] == data['record_max_temp']]))

# Part d
total_precipitation_in_october = (data['date'] >= '2014-10-01') & (data['date'] <= '2014-10-31')
print('Total precipitation in October 2014:\n {}'.format(data.loc[total_precipitation_in_october]))

# Part e
extreme_temperature = data[(data['actual_min_temp'] < 60) & (data['actual_max_temp'] > 90)]
print('Extreme temperature: {}'.format(extreme_temperature))
