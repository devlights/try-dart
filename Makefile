
default: all

all: prepare run

prepare:
	@dart pub get

run:
	@dart run
