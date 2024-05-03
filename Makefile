# Compiler settings - Can change to clang++ if preferred
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Iinclude

# Build targets
TARGET = bin/monstera
SOURCES = $(wildcard src/*.cpp)
OBJECTS = $(SOURCES:src/%.cpp=bin/%.o)

# Default build
all: $(TARGET)

# Link objects to binary
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o $@

# Compile source files to objects
bin/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up
clean:
	rm -f $(TARGET) $(OBJECTS)

.PHONY: all clean
