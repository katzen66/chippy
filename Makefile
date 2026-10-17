compiler: compiler.cpp
	g++ compiler.cpp -o compiler
fib.hex: fib.casm compiler
	(echo v2.0 raw ; cat <( echo obase=16 ; echo ibase=2) <(cat fib.casm | ./compiler)|bc) > fib.hex
juggle.hex: juggle.casm compiler
	(echo v2.0 raw ; cat <( echo obase=16 ; echo ibase=2) <(cat juggle.casm | ./compiler)|bc) > juggle.hex
