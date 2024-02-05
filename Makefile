#######################
# Makefile
#######################
# source object target
TARGET1 := test_x64
TARGET2 := test
# compile and lib parameter
CC      := gcc
LIBS    :=
LDFLAGS := -L.
DEFINES :=
INCLUDE := -I.
CFLAGS  := 
CXXFLAGS:= 

# link
$(TARGET1):
	$(CC) test_a.c test_b.c test_c.c --shared -fPIC -o libtest_x64.so
	$(CC) test_x64.c -L . -ltest_x64 -no-pie -g -o test_x64
	hexdump -C $(TARGET1) > hexdump-C_x64
	objdump -s $(TARGET1) > objdump-s_x64
	objdump -S $(TARGET1) > objdump-S_x64
	objdump -d $(TARGET1) > objdump-d_x64
	readelf -r $(TARGET1) > readelf-r_x64
	readelf -S $(TARGET1) > readelf-S_x64
	readelf -x .got $(TARGET1) > got_x64

$(TARGET2):
	$(CC) test_a.c test_b.c test_c.c -m32 -no-pie -g --shared -fPIC -o libtest.so
	$(CC) test.c -L . -ltest -m32 -no-pie -g -o test
	hexdump -C $(TARGET2) > hexdump-C
	objdump -s $(TARGET2) > objdump-s
	objdump -S $(TARGET2) > objdump-S
	objdump -d $(TARGET2) > objdump-d
	readelf -r $(TARGET2) > readelf-r
	readelf -S $(TARGET2) > readelf-S
	readelf -x .got $(TARGET2) > got
# clean
clean:
	rm -fr *.o *.so
	rm -fr $(TARGET1) hexdump-C_x64 objdump-s_x64 objdump-S_x64 objdump-d_x64 readelf-r_x64 readelf-S_x64 got_x64
	rm -fr $(TARGET2) hexdump-C objdump-s objdump-S objdump-d readelf-r readelf-S got