JAVA_HOME=/home1/irteam/apps/jdk

all: ptail test

ptail: src/ptail.cpp
	g++ -o ptail src/ptail.cpp -I$(JAVA_HOME)/include/ -I$(JAVA_HOME)/include/linux -I/usr/local/include -lhdfs -m64
	cp ptail ./bin

test: gtest test_lastest_file.o
	g++ -o test_main test_lastest_file.o gtest-all.o gtest_main.o -lpthread

test_lastest_file.o: test/test_lastest_file.cpp
	g++ -c test/test_lastest_file.cpp -I./

gtest: gtest-all.o gtest_main.o

gtest-all.o: gtest/gtest-all.cc gtest/gtest.h
	g++ -c gtest/gtest-all.cc -I./

gtest_main.o: gtest/gtest_main.cc gtest/gtest.h
	g++ -c gtest/gtest_main.cc -I./

