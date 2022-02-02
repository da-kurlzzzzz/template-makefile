TARGET_EXEC ?= executable_file

BUILD_DIR ?= build
SRC_DIRS ?= src

INC_DIRS := $(shell find $(SRC_DIRS) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

CPPFLAGS ?= $(INC_FLAGS) -MMD -MP
SHARED_FLAGS ?= -Wall -Wextra -Werror
CFLAGS ?= $(SHARED_FLAGS) -std=c99
CXXFLAGS ?= $(SHARED_FLAGS) -std=c++11
LDFLAGS ?= -pthread
LDLIBS ?= -lstdc++ -lm

SRCS := $(shell find $(SRC_DIRS) -name *.cpp -or -name *.c)
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) $(LDLIBS) -o $@

.PHONY: clean
clean:
	$(RM) -r $(BUILD_DIR)

$(BUILD_DIR)%/:
	mkdir -p $@

.SECONDEXPANSION:

$(BUILD_DIR)/%.c.o: %.c | $$(@D)/
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/%.cpp.o: %.cpp | $$(@D)/
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

-include $(DEPS)
