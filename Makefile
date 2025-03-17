CC = gcc
CFLAGS = -o
LEX_FLAGS = -ll
BUILD_DIR = build

process: $(LEX_FILE) $(SOURCE_FILE)
	@echo "Processing $(SOURCE_FILE) using $(LEX_FILE)"
	@mkdir -p $(BUILD_DIR)
	@lex $(LEX_FILE)
	@$(CC) lex.yy.c $(CFLAGS) $(BUILD_DIR)/scanner $(LEX_FLAGS)
	@./$(BUILD_DIR)/scanner < $(SOURCE_FILE)
	@rm -rf $(BUILD_DIR)
	@rm -f lex.yy.c

process_folder: $(FOLDER)
	@echo "Processing folder $(FOLDER) using LEX file $(FOLDER)/lex.l"
	@mkdir -p $(BUILD_DIR)
	@lex $(FOLDER)/lex.l
	@$(CC) lex.yy.c $(CFLAGS) $(BUILD_DIR)/scanner $(LEX_FLAGS)
	@./$(BUILD_DIR)/scanner < $(FOLDER)/source.c
	@rm -rf $(BUILD_DIR)
	@rm -f lex.yy.c

assignment_1_c:
	@make process LEX_FILE=./assignment-1/valid_c_cpp_java_checker/c_checker/lex.l SOURCE_FILE=./assignment-1/valid_c_cpp_java_checker/c_checker/source.c

assignment_1_cpp:
	@make process LEX_FILE=./assignment-1/valid_c_cpp_java_checker/cpp_checker/lex.l SOURCE_FILE=./assignment-1/valid_c_cpp_java_checker/cpp_checker/source.cpp

assignment_1_java:
	@make process LEX_FILE=./assignment-1/valid_c_cpp_java_checker/java_checker/lex.l SOURCE_FILE=./assignment-1/valid_c_cpp_java_checker/java_checker/source.java

assignment_1_number_counter:
	@make process_folder FOLDER=./assignment-1/number_counter

assignment_1_vowel_counter:
	@make process_folder FOLDER=./assignment-1/vowel_counter
