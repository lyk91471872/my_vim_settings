import os, sys

os.environ['htmlfile'] = sys.argv[1].rstrip('markdown') + 'html'
os.system('echo $htmlfile')
