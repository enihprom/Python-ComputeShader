from Bin import computeshader as CS

CS.StartTimer()

print('Info():')
info = CS.Info()
for key in sorted(info):
	print('|', key, info[key])

print(CS.GetTimer())
