import os
import re

flag_only_exe = False

re_is_exe = re.compile(r'(?i).*\.exe')

for t,dd,nn in os.walk(u'c:\\'):
	nn = sorted(nn, key=lambda n: n.lower())
	if flag_only_exe: nn = (n for n in nn if re_is_exe.match(n))
	pp = (os.path.join(t, n) for n in nn)
	for p in pp: print p
