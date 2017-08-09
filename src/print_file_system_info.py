import os
import re

re_is_exe = re.compile(r'(?i).*\.exe')

for t,dd,nn in os.walk(u'c:\\'):
	nn = sorted(nn, key=lambda n: n.lower())
	nn = (n for n in nn if re_is_exe.match(n))
	for n in nn:
		print os.path.join(t, n)
