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

all: test dirs build doc

build: $(OBJECTS) 
	$(CXX) $(LIBS) -o bin/$(EXECUTABLE) $^ $(CXXFLAGS)

$(BUILDDIR)/%.o: $(SOURCEDIR)/%.cpp $(DEPS)
	$(CXX) -c -o $@ $< $(CXXFLAGS)

test: $(UNITTESTSOURCES) $(SOURCESWITHOUTMAIN) $(DEPS)
	$(CXX) $^ -o $(TESTDIR)/$(UNITTESTEXECUTEABLE)
	
dirs:
	mkdir -p $(BUILDDIR) bin

doc: $(OBJECTS) $(DEPS)
	doxygen doc/Doxyfile

.PHONY: clean

clean:
	rm -f $(BUILDDIR)/*.o bin/$(EXECUTABLE)