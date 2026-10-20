fib.hex: fib.casm asembler.lsp
	(echo v2.0 raw ; cat <( echo obase=16 ; echo ibase=2) <(cat fib.casm | tr -s '\n' | clisp asembler.lsp 2>/dev/null) |bc) > fib.hex

