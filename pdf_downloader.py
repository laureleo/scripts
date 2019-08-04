import os
import requests
from urllib.parse import urljoin
from bs4 import BeautifulSoup

print("Welcome. Extraction of all pdfs from website will begin shortly")

url = "https://www.math.kth.se/matstat/gru/sf2940/oldtentor.html"

#If there is no such folder, the script will create one automatically
print("Creating download folder if not exist")
folder_location = './pdf_download_results'
if not os.path.exists(folder_location):os.mkdir(folder_location)

print("Parsing {}".format(url))
response = requests.get(url)
soup= BeautifulSoup(response.text, "html.parser")     

pdf_count = 0
for link in soup.select("a[href$='.pdf']"):
    #Name the pdf files using the last portion of each link which are unique in this case
    filename = os.path.join(folder_location, link['href'].split('/')[-1])
    print("Saving {} as\n{}\n".format( link['href'], filename))
    with open(filename, 'wb') as f:
        f.write(requests.get(urljoin(url,link['href'])).content)
    pdf_count += 1
print("Done. {} PDF:s downloaded".format(pdf_count))
