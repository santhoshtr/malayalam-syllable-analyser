Malayalam Syllable Analyser
===========================
A syllable is a unit of organization for a sequence of speech sounds. Each syllable can be considered as pronounciation units that constitutes a word pronounciation.

This project is to formalize the syllable model for Malayalam language. Along with a verbal description of syllables in Malayalam we attempt to formalize a grammar using PEG - Parser Expression grammar. That grammar is then used for writing a parser to find the syllables in a given word. A web interface is also provided to try out the system.

Before starting with definition of syllable model, we need to define some terminology.

Definitions
----------
1. `Vowel` - Vowels of Malayalam -Any of the set: [അആഇഈഉഊഋഎഏഐഒഓഔഔഅം]
2. `VowelSign` - Vowel signs. - Any of the set  [ാിീുൃെേൊോൗൂൈ]
3. `Consonant` - Consonants - Any of the set [കഖഗഘങചഛജഝഞടഠഡഢണതഥദധനപഫബഭമയരലവശഷസഹളഴറ]
4. `Virama` - The sign ്.
5. `Visarga`  The sign ഃ
6. `Anuswara` - The vowel sign of അം.ie ം. This share some properties of Chillu.
7. `Chillu` - Pure consonants, without any vowels. Chillus are any of ൻ, ർ, ൽ, ൾ, ൺ, ൿ, ൔ, ൕ, ൖ. The last 4 chillus are rarely used or archaic. But we can consider them for our modeling. Due to historic encoding reasons, Chillus can also appear as base `Consonant`+`Virama`+`ZWJ` form. That means, ൻ = ന + ് + `ZWJ`. Chillus never appear in the begininning of word, but is not relevant for a syllable analyser.
8. `ZWNJ` Zero Width Non Joiner.\u200C
9. `ZWJ` Zero with Joiner \u200D
10. `Signs` A term used to address various signs that modify a `Consonant`. Any of `VowelSign`, `Virama`, `Anuswara`, `Visarga`.
11. `HalfConsonant` A `Consonant` with `Virama` Example: പ്, ര്, മ് etc. Or a `DotReph`
12. `DotReph`: The sign ൎ.
13. `Conjunct`: A `HalfConsonant` combined with another `Conjunct` or `Consonant`. Example: സ+ ് + ത => സ്ത , സ്ത + ് + ര = സ്ത്ര. ദ്ധ + ് ര = ദ്ധ്ര, ദ്ധ്ര + ് + യ = ദ്ധ്ര്യ

Syllable model
---------------
A syllable in Malayalam can be any of the following.
1. An independent `Vowel`. Vowels are often found at the begininning of the word. Example: അമ്മ. But for the specific case of Syllables, we can relax this rule of being in the start of word and generally state that a vowel is syllable. Note that vowel appearing as vowel sign is not what we are considering here. `Vowel signs` has its own properties.
2. A `Chillu` letter is a syllable.
3. A `Consonant` without any `Signs` is a syllable. For example, in the word തറ, both ത and റ are Syllables.
4. A `Consonant` or `Conjunct` with `Signs` is a syllable. Here the Signs can be repeated more than once, but not freely. This syllable has the following characteristics
 1. `Signs` can be `Virama` only if it is the last items of a given word. For example. അത് has അ, ത് as syllables, but അത്ഭുതം has അ, ത്ഭു, തം as syllables.
 2. `Signs` can occur 2 times in folllowing cases:(a) First Sign is ു and Second is `Virama` This combination is also called Samvruthokaram. Example: തു് in അതു്. (b)  First Sign is a `VowelSign` and Second is `Anuswara`. Examples: താം, തീം, തോം, തും etc.
5. A `ZWNJ` marks a syllable boundary. A ZWNJ inserted between two blocks of text inserts a ligature as well as syllable boundary. For example: തമിഴ്‌നാട്,The ZWNJ inserted after ഴ് and before നാ prevents possible ഴ്ന Conjunct and hence also makes a point that the pronounciation should break at that point. It is a bit wierd to say a ZWNJ forms a syllable since it is just a seperator.  But while analysing a series of letters from begininning to end, it is technically okey to consider ZWNJ as a syllable block.

Parser Expression grammar
-------------------------
See the prepared Parser Expression grammar for the above mentioned model: [malayalam-syllables.pegjs](https://github.com/santhoshtr/malayalam-syllable-analyser/blob/master/malayalam-syllables.pegjs)

You can try this in a PEG evaluator and try various conjucts to see if they all getting parsed. Use https://pegjs.org/online, copy paste the above grammar, and try some words as inputs.

Syllable boundaries
-------------------
If you want to know syllable boundaries and don't care about anything else, there is an easy way to find boundaries. A syllable boundary is after:

1. A vowel. Note that this not vowel sign. Example: അ|റ, ഇ|ര, ഉ|പ്പ്
2. A vowel sign, if not followed by virama, anuswara or visarga. Example: ത്തി|ൽ, പു|ക,
3. A consonant if followed by another consonant or chillu. Example: ത|റ, ഷ്ട|മി, ക|ൽ
4. A chillu. Example: സ|ർ|പ്പം
5. An Anuswara. Example: കു|ടും|ബം,
6. A Visarga. Example: ദുഃ|ഖം
7. A ZWNJ is syllable boundary.
