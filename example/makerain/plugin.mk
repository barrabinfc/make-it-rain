# All paths here assume the PWD is plugin/something

FLAGS += -fPIC \
	-I../../include -I../../dep/include


include ../../arch.mk

ifeq ($(ARCH), linux)
	LDFLAGS += -shared
	TARGET = plugin.so
endif

ifeq ($(ARCH), mac)
	LDFLAGS += -shared -undefined dynamic_lookup
	TARGET = plugin.dylib
endif

ifeq ($(ARCH), win)
	LDFLAGS += -shared -L../../ -lVgluten
	TARGET = plugin.dll
endif


all: $(TARGET)

include ../../compile.mk

clean:
	rm -rfv build $(TARGET) dist
