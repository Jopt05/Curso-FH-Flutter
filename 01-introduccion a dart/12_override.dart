void main() {
  
  final Hero wolverine = Hero(
    name: 'Logan',
    power: 'Regeneracion'
  );
  //new Hero
  
  print( wolverine.toString() );
}

class Hero {
  // Atributos
  String name;
  String power;
  
  Hero({ 
    required this.name, 
    required this.power
  });
  
  @override
  String toString() {
    return '$name - $power';
  }
}