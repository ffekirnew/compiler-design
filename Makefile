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

