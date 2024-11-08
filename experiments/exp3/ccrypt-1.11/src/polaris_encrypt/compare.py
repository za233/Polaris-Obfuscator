import subprocess
import time
import os
def test_one(test_bin):
	process = subprocess.Popen(['dd', 'if=/dev/zero', 'of=testfile', 'count=100', 'bs=1024'])
	process.wait()
	if os.path.exists('testfile.cpt'):
		os.remove('testfile.cpt')
	start_time = time.perf_counter()
	process = subprocess.Popen([test_bin, '-e', '-K', '1' * 16, 'testfile'])
	process.wait()
	end_time = time.perf_counter()
	return end_time - start_time 
print(test_one('./ccrypt_gcc'))
print(test_one('./ccrypt_polaris'))
print(test_one('./ccrypt_vmp'))
