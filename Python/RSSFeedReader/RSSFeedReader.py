# RSSFeedReader

import urllib.request as UR
import xml.etree.ElementTree as ET

# Set the RSS FeedURL
URL = 'http://www.motortrend.com/widgetrss/motortrend-stories.xml'

# Request RSS Feed for set URL and collect output
try:
  response = UR.urlopen(URL)
  status_code = response.getcode()
  if not status_code == 200:
    print(f'URL Request Open Error: {status_code}')
    exit()
  content = response.read()
except Exception as excepton:
  print(f'URL Request Open Exception:\n{excepton}')
  exit()

# Node search for title
try:
  root = ET.fromstring(content)
  title_nodes = root.findall(".//channel/item/title")
  for title_node in title_nodes:
    print(title_node.text)
except Exception as exception:
  print(f'Node Search Exception:\n{exception}')
  exit()

