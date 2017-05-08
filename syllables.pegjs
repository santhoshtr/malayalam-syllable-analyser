Word = S:Syllable*
Syllable = s:( Vowel
	/ (  Conjunct / Consonant  )  Signs
	/ Chillu
	)  {
		if(Array.isArray(s)){
			return   s.join('')
		}
		return s
	}
Vowel = [അആഇഈഉഊഋഎഏഐഒഓഔഔഅം]
VowelSign = [ാിീുൃെേൊോൗൂൈ]
Consonant = [കഖഗഘങചഛജഝഞടഠഡഢണതഥദധനപഫബഭമയരലവശഷസഹളഴറ]
Virama = [്]
Visarga = [ഃ]
Anuswara = [ം]
Chillu = [ൻർൽൾൿൺ]
Conjunct = c1:Consonant cv:(Virama Consonant)+  & {
	if(cv.length>5) return false;
	if(cv.length<=3) return true;
	if(cv[cv.length-1][1] !== 'യ') return false;
	return true;
} {
	return [c1,cv].join('');
}

Signs = v:VowelSign? h:Visarga? a:Anuswara? x:Virama? & {
	if ( x && a ) {
		// Anuswara cant be with a virama
		return false;
	}
	if( x && location().start.offset === input.length) {
		return true;
	}
	if( v && x ) {
		// Samvruthokaram, v must be u sign
		return v === 'ു';
	}
	if( h && (a || x) ) {
		// Nothing comes with Visarga
		return false;
	}
	return true;
	} {
		return [v,h,a,x].join('')
	}
