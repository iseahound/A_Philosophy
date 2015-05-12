/* RANDOM FUNCTION
Rand() ; - A random float between 0.0 and 1.0 (many uses)
Rand(6) ; - A random integer between 1 and 6 (die roll)
Rand("") ; - New random seed (selected randomly)
Rand("", 12345) ; - New random seed (set explicitly)
Rand(50, 100) ; - Random integer between 50 and 100 (typical use)
*/

Rand( a=0.0, b=1 ) {
   IfEqual,a,,Random,,% r := b = 1 ? Rand(0,0xFFFFFFFF) : b
   Else Random,r,a,b
   Return r
}