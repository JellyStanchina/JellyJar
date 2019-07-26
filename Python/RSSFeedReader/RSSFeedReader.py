# RSSFeedReader

# Requests library used for get()
import requests
import xml.etree.ElementTree as ET

# Set the RSS FeedURL
URL = 'http://www.motortrend.com/widgetrss/motortrend-stories.xml'

# Request RSS Feed for set URL and collect output
try:
  response = requests.get(URL)
  response.raise_for_status()
  response_content = response.content
  # print(response_content)
except Exception as error:
  print(f'RSS Get Error ocurred:\n{error}')

def child_search(root, tag):
  for child in root:
    if child.tag == tag:
      print(child.text)
    child_search(child, tag)

try:
  root = ET.fromstring(response.content)
  child_search(root , 'title')
except Exception as error:
  print(f'Title Node Search Error ocurred:\n{error}')
