# Shelly
Shelly is a simple implementation of a shell in C, that is it is only able to interpret single line commands. It demonstrates the basics of how a shell works. That is: read, parse and exec. Reading and parsing is done via a lexical analyzer and LALR parser both generated using linux built-in utility lex and yacc, respectively. Since its purpose is demonstration (not feature completeness or even fitness for casual use), it has many limitations, including:

Commands must be on a single line.
Arguments must be separated by whitespace.
No quoting arguments or escaping whitespace.
No piping or redirection.

# License

This code is in the public domain (see UNLICENSE for more details). This means you can use, modify, and distribute it without any restriction. I appreciate, but don't require, acknowledgement in derivative works.
