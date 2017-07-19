CXX=g++
CXXFLAGS=-I.

EXECUTABLE = MyProgram

SOURCEDIR = src/code
IDIR = src/includes
BUILDDIR = build
DEPS = $(wildcard $(IDIR)/*.hpp)

LIBS=-lm

SOURCES = $(wildcard $(SOURCEDIR)/*.cpp)
OBJECTS = $(patsubst $(SOURCEDIR)/%.cpp,$(BUILDDIR)/%.o,$(SOURCES))

$(BUILDDIR)/%.o: $(SOURCEDIR)/%.cpp $(DEPS)
	$(CXX) -c -o $@ $< $(CXXFLAGS)

all: $(OBJECTS)
	$(CXX) -o bin/$(EXECUTABLE) $^ $(CFLAGS)

.PHONY: clean

clean:
	rm $(BUILDDIR)/*.o bin/$(EXECUTABLE)