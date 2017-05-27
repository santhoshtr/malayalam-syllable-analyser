Word = Syllable+
Syllable = s:( Vowel
	/ Chillu
	/ ( Conjunct / Consonant ) Signs
	/ ZWNJ
	) {
		if ( Array.isArray( s ) ) {
			return s.join( '' )
		}
		return s
	}
Vowel = [അആഇഈഉഊഋഎഏഐഒഓഔഔഅം]
VowelSign = [ാിീുൃെേൊോൗൂൈ]
Consonant = [കഖഗഘങചഛജഝഞടഠഡഢണതഥദധനപഫബഭമയരലവശഷസഹളഴറ]
Virama = [്]
Visarga = [ഃ]
Anuswara = [ം]
DotReph= [ൎ]
Chillu = [ൻർൽൾൿൺൔൕൖ] / (Consonant Virama ZWJ)
ZWNJ = [\u200C]
ZWJ = [\u200D]
HalfConsonant = (c1:Consonant x:Virama) { return [c1, x].join( '' ); }
	/ DotReph
Conjunct = c1x:HalfConsonant c2:( Conjunct / Consonant ) {
	return [c1x, c2].join( '' );
}

Signs = v:VowelSign? h:Visarga? a:Anuswara? x:Virama? & {
	if ( x && a ) {
		// Anuswara cant be with a virama
		return false;
	}
	if ( v && x ) {
		// Samvruthokaram, v must be u sign
		return v === 'ു';
	}
	if ( h && (a || x) ) {
		// Nothing comes with Visarga
		return false;
	}
	if ( x && location().start.offset === input.length ) {
		return true;
	}
	return true;
} {
	return [v, h, a, x].join( '' )
}
