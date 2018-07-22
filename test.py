import os
import pprint

for key, value in os.environ.items():
	print key, ":", value
