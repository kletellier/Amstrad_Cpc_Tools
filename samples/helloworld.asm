org #6000
TXT_OUTPUT    EQU #BB5A
KM_WAIT_CHAR    EQU #BB06

LD A, 'H'
CALL TXT_OUTPUT
LD A, 'e'
CALL TXT_OUTPUT
LD A, 'l'
CALL TXT_OUTPUT
LD A, 'l'
CALL TXT_OUTPUT
LD A, 'o'
CALL TXT_OUTPUT
LD A, ' '
CALL TXT_OUTPUT
LD A, 'w'
CALL TXT_OUTPUT
LD A, 'o'
CALL TXT_OUTPUT
LD A, 'r'
CALL TXT_OUTPUT
LD A, 'l'
CALL TXT_OUTPUT
LD A, 'd'
CALL TXT_OUTPUT

CALL KM_WAIT_CHAR

RET