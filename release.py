import os, shutil, zipfile, sys

if len(sys.argv) < 2:
	ver = 'beta'

else:
	ver = '-'.join(sys.argv[1:])

if not os.path.isdir('release'):
	os.mkdir('release')

package = zipfile.zipfile('release/release-%s.zip' % ver, 'w')

package.write('LICENSE')
package.write('README.md')

for example in ['test.py', 'primes.py']:
	data = open(example, 'rb').read()
	data = data.replace(b'from bin import ComputeShader', b'from modules import computeshader')
	package.writestr(example, data)

package.write('bin/computeshader.pyd', 'modules/computeshader.pyd')
