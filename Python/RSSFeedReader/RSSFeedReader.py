# RSSFeedReader

# Requests library used for get()
# import requests
import urllib.request

import xml.etree.ElementTree as ET

# Set the RSS FeedURL
URL = 'http://www.motortrend.com/widgetrss/motortrend-stories.xml'

# Request RSS Feed for set URL and collect output
try:
  response = urllib.request.urlopen(URL)
  status_code = response.getcode()
  if not status_code == 200:
    print(f'URL Request Open Error: {status_code}')
    exit()
  with response as RSSPage:
    content = RSSPage.read()
except Exception as excepton:
  print(f'URL Request Open Exception:\n{excepton}')
  exit()

def child_search(root, tag):
  for child in root:
    if child.tag == tag:
      print(child.text)
    child_search(child, tag)

try:
  root = ET.fromstring(content)
  child_search(root , 'title')
except Exception as exception:
  print(f'Title Node Search Exception:\n{exception}')
  exit()
