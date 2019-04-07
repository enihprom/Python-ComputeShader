COMP = g++ -std=c++11 -fpermissive -c
LINK = g++ -O3

PY = python
MK = make

PY_TARGET = python3.5m

PY_INC = -I /usr/include/$(PY_TARGET)
PY_LIB = /usr/lib/$(PY_TARGET).so

DEPS = -lopengl32 $(PY_LIB)

all: clean bin/computeshader.pyd release-beta

prepare:
	$(PY) prepare.py

clean:
	$(PY) clear.py

release-beta:
	$(PY) release.py beta $(PY_TARGET) 

bin/computeshader.pyd: prepare tmp/module.o tmp/opengl.o src/module.def
	$(LINK) -shared tmp/module.o tmp/opengl.o $(DEPS) -o bin/computeshader.pyd

tmp/module.o: prepare src/module.cpp src/opengl.hpp
	$(COMP) $(PY_INC) src/module.cpp -o tmp/module.o
	
tmp/opengl.o: prepare src/opengl.cpp src/opengl.hpp
	$(COMP) $(PY_INC) src/opengl.cpp -o tmp/opengl.o

Run:
	$(PY) test.py
