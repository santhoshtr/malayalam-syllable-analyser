BIN = "./node_modules/.bin"

build:
	@mkdir -p lib
	@$(BIN)/pegjs -e malayalamSyllableParser malayalam-syllables.pegjs lib/malayalam-syllables.js

test: build
	@$(BIN)/mocha -c

clean:
	@rm -rf lib dist
