.PHONY: all clean

all:
	./build-target.sh

clean:
	cd seabios && ../xgcc-seabios-make.sh clean
	cd coreboot && make clean
