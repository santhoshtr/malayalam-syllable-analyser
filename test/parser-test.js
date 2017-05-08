var should = require( 'should' );
var parser = require( '../' );

describe('Syllabalize tests', function() {
	var tests = {
		"മലയാളം":  ['മ', 'ല', 'യാ', 'ളം'],
		"അർജ്ജുനൻ":  ['അ', 'ർ', 'ജ്ജു', 'ന', 'ൻ'],
		"അത്": ['അ', 'ത്'],
		"അതു്": ['അ', 'തു്'],
		"വിദ്യാർത്ഥിയ്ക്കു": ['വി','ദ്യാ','ർ','ത്ഥി','യ്ക്കു'],
		"വിദ്യാർത്ഥിയ്ക്കു്": ['വി','ദ്യാ','ർ','ത്ഥി','യ്ക്കു്'],
		"ദുഃഖം": ['ദുഃ', 'ഖം'],
		"കുടുംബം": ['കു','ടും', 'ബം'],
		"ചട്ടീംകലോം": ['ച', 'ട്ടീം', 'ക', 'ലോം']
	};

	function parseTest(word, expected) {
		parser.parse( word ).should.eql( expected );
	}

	for (var word in tests) {
		var testDesc = 'given '+ word + ', parse should give '+ tests[word]
		it(testDesc, parseTest.bind(this, word, tests[word] ) );
	}
});

describe('Invalid syllables tests', function() {
	var tests = {
		"ആാ": "Vowel sign should not come after vowels",
		"ക്ക്ക്": "A same Consonant cannot repeat more than 2 times",
		"ക്ച്ട്ത്പ": "Maximum 5 consonants are allowed for a Conjunct",
		"ദുഃിഖം":"After visarga vowel sign cant come",
		"അതി്":"After ഇ vowel sign virama cant come"
	};

	function parseErrorTest(word ) {
		should.throws(parser.parse.bind(parser, word ))
	}

	for (var word in tests) {
		var testDesc = 'given '+ word + ', parse should throw error because ' + tests[word]
		it(testDesc, parseErrorTest.bind(this, word  ) );
	}
});
