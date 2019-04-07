import shutil, os

if os.path.isdir('bin'):
	shutil.rmtree('bin')
	
if os.path.isdir('tmp'):
	shutil.rmtree('tmp')
