void main() {
  
  final Map<String, dynamic> pokemons ={
    'name': 'Ditto',
    'hp': 100
  };
  
  final pokemon = {
    'name': 'Ditto',
    'hp': 100,
    'isAlive': true,
    'abilities': <String>['impostor'],
    'sprites': <int, String>{
      1: 'ditto/front.png',
      2: 'ditto/back.png'
    }
  };
  
  print(pokemon);
  
  print('Pokemon name');
  print('Name: ${ pokemon['name'] }');
  
  // Tarea: Imprimir front y back
  print('Front: ${ pokemon['sprites'][1] }');
  print('Back: ${ pokemon['sprites'][2] }');
  
}