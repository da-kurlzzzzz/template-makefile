# Makefile for C and C++
First of all - there is no such thing as C/C++. You code in either, not in
both nor in some mix of two. Aside from rambling, this Makefile was created
long time ago and I don't remember all blogs and stack overflow questions that
got me to this final result. Mainly I just use it blindly for all my C stuff
and this thing works fine.

# Usage
Put all your files to `./src/` and run `make`. It *should* just find all `*.c`
and `*.cpp` files, include all subdirectories and produce an executable. If,
for some reason, you don't like the executable file be named `executable_file`
then rename it (duh)

<!-- vim:set tw=78: -->
