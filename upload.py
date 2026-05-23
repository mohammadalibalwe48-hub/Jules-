import urllib.request
import os

url = 'https://file.io'
files = {'file': open('build/app/outputs/flutter-apk/app-release.apk', 'rb')}

import requests
response = requests.post(url, files=files)
print(response.json())
