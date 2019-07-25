# RSSFeedReader

# Requests library used for get()
import requests

# Set the RSS FeedURL
URL = 'http://www.motortrend.com/widgetrss/motortrend-stories.xml'

# Request RSS Feed for set URL and collect output
try:
  response = requests.get(URL)
  response.raise_for_status()
  response_output = response.content
  print(response.status_code)
  print(response_output)
except Exception as error:
  print(f'Error ocurred:\n{error}')

