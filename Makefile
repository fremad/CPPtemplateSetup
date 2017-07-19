CXX=g++
CXXFLAGS=-c -Wall
LDFLAGS=

SOURCEDIR = src/code
BUILDDIR = build

EXECUTABLE = MyProgram

output: main.o 
	$(CXX) main.o -o $(EXECUTABLE)

main.o: $(SOURCEDIR)/main.cpp
	$(CXX) -c $(SOURCEDIR)/main.cpp -o $(BUILDDIR)/main.o

.PHONY: clean
clean:
	rm *.o $(EXECUTABLE)













#SOURCES = $(wildcard $(SOURCEDIR)/*.cpp)
#OBJECTS = $(SOURCES:.cpp=.o)


#all: dir $(SOURCES) $(EXECUTABLE)
    
#$(EXECUTABLE): $(OBJECTS) 
#	$(CXX) $(LDFLAGS) $(OBJECTS) -o $@

#dir:
#	mkdir -p $(BUILDDIR)

#.cpp.o:
#	$(CXX) $(CXXFLAGS) $< -o $@

#.PHONY : clean
#clean :
#	-rm hello $(OBJECTS)