CXX=g++
CXXFLAGS=-I.

EXECUTABLE = MyProgram
UNITTESTEXECUTEABLE = MyTestProgram

SOURCEDIR = src/code
IDIR = src/includes
BUILDDIR = build
TESTDIR = test

LIBS=-pthread

DEPS = $(wildcard $(IDIR)/*.hpp)

SOURCES = $(wildcard $(SOURCEDIR)/*.cpp)
OBJECTS = $(patsubst $(SOURCEDIR)/%.cpp,$(BUILDDIR)/%.o,$(SOURCES))

SOURCESWITHOUTMAIN = $(filter-out $(SOURCEDIR)/main.cpp,$(SOURCES))

UNITTESTSOURCES = $(wildcard $(TESTDIR)/UNIT/*.cpp)

all: dirs build

build: $(OBJECTS) 
	$(CXX) $(LIBS) -o bin/$(EXECUTABLE) $^ $(CXXFLAGS)

$(BUILDDIR)/%.o: $(SOURCEDIR)/%.cpp $(DEPS)
	$(CXX) -c -o $@ $< $(CXXFLAGS)

test: $(UNITTESTSOURCES) $(SOURCESWITHOUTMAIN) $(DEPS)
	$(CXX) $^ -o $(UNITTESTEXECUTEABLE)
	
dirs:
	mkdir -p build bin

.PHONY: clean

clean:
	rm -f $(BUILDDIR)/*.o bin/$(EXECUTABLE) $(UNITTESTEXECUTEABLE)