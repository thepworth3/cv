# Check triumf experiments list for my name
# Derek Fujimoto
# Nov 2022

import requests
import pandas as pd
from bs4 import BeautifulSoup
from tqdm import tqdm

# settings
target_name = 'D. Fujimoto'

# get all exp numbers for all time
url = 'https://mis.triumf.ca/science/experiment/list.jsf?schedule=View+all&discipline=View+all&status=View+all'

res = requests.get(url)
soup = BeautifulSoup(res.content, 'html.parser')
text = soup.find_all(name='a')

# get all links to experiments
links = [t.attrs['href'] for t in text if 'href' in t.attrs.keys()]
links = [link for link in links if 'science/experiment/view' in link]
links = [link for link in links if link.split('/')[-1][0] == 'M' and len(link.split('/')[-1])>4]

# look for me
for link in tqdm(links): 

    # open page
    url = f'https://mis.triumf.ca{link}'
    res = requests.get(url)
    soup = BeautifulSoup(res.content, 'html.parser')
    text = soup.find_all(id='expNum')

    # get exp number
    exp_num = link.split('/')[-1]

    # get status
    status = list(text[0].children)[-2].contents[0].split()[-1]

    # get names
    try:
        toplist = soup.find(id='spokespersons').text.split('\n')
        spokes = [lst for lst in toplist if lst and 'Spokesperson' not in lst]
    except AttributeError:
        tqdm.write(f'Error spokes: {exp_num}')
        continue
        
    try:
        toplist = soup.find(id='members').text.split('\n')
        members = [lst for lst in toplist if lst][4::3]
    except AttributeError:
        tqdm.write(f'Error members: {exp_num}')
        continue
    
    # print results
    if target_name in spokes:
        tqdm.write(f'Spokesperson {exp_num} {status}')
    elif target_name in members:
        tqdm.write(f'Member       {exp_num} {status}')
