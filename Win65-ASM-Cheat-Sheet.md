#Win64 ASM Cheat-sheet
Return Values:
tl:dr;
int -> rax
float -> xmm0
Any scalar return value 64 bits or less in size is returned in rax.
Any floating-point value is returned in xmm0.
