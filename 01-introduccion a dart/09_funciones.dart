void main() {
  
  print( greetEveryone() );
  
  print(' Suma ${ addTwoNumbers(10,20) } ');
  
  print( addFlecha( 10, 20 ) );
}

String greetEveryone() {
  return 'Hello everyone!';
}

// Funcion de flecha
String otraFuncion() => 'Hello Everyone';

int addTwoNumbers( int a, int b) {
  return a + b;
}

int addFlecha( int a, int b ) => a + b;

// Argumentos opcionales
//int addOptional( int a, [int b = 0]{
int addOptional( int a, [int? b] ) {
  // If binario
  // b ??= 0;
  b = b ?? 0;
  return a + b;
}