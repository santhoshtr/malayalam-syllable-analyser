Syllable model
==============
A syllable in Malayalam can have any of the following models.

1. c - A consonant without any vowel signs. Example: ക, ച, ട
2. V - A vowel. Note that this not vowel sign. Example: അ, ഇ, ഉ
3. cv - A consonant with a vowel sign. Example: കി, കു, പു, സെ
4. cx - A consonant with virama. Should be at end of word. Example: ക്, ത്
5. cvx - A consonant with samvruthokaram Example: തു്, നു്
6. cvv- A conjunct with vowel and anuswara Example: തും , ഠിം തോം
7. C - a conjunct. It can be any of the following
    cxc - A conjunct formed by two consonants connected by a virama. Example: ക്ക, പ്ത, ക്ഷ
 1. cxcxc - A 3 consonant conjunct, and the last c must be any of യ, ര, ല, വ. Example: സ്ത്ര, ന്ത്യ
 2. cxcxcxc - A 4 consonant conjunct, and the last 2 c must be any of യ, ര, ല, വ. Example: ദ്ധ്ര്യ
 3. cxcxcxcxc - A 5 consonant conjunct, and the last 3 c must be any of യ, ര, ല, വ. Example: ഗ്ദ്ധ്ര്യ
8. Cv - A conjunct followed by vowel sign ക്ഷി, പ്തി, ഗ്ദ്ധ്ര്യൊ
9. Cx - A conjunct followed by virama. Example: ക്ഷ്. പ്ത്

Syllable splitter
=================

This is easier than above. A syllable boundary is after:

1. A vowel. Note that this not vowel sign. Example: അ|റ, ഇ|ര, ഉ|പ്പ്
2. A vowel sign, if not followed by virama, anuswara or visarga. Example: ത്തി|ൽ, പ്പു|ക, കു|ടും|ബം, ദുഃ|ഖം
3. A consonant if followed by another consonant or chillu. Example: ത|റ, ഷ്ട|മി, കി|ൽ
4. A chillu. Example: സ|ർ|പ്പം
