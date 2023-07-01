void main() {
  
  print( greetPerson( name: 'Jesús' ) );
  
  // Con valor opcional
  
  print( greetPerson( name: 'Jesus', message: 'Que onda,' ) );
  
}

// Nombrar parámetros
//Los envuelves en llaves
String greetPerson({ required String? name, String? message = 'Hola, ' }) {
  
  
  return '$message$name';
}