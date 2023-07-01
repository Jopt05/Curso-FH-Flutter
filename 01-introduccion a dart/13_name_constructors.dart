void main() {
  
  // Mapa de ejemplo
  final Map<String, dynamic> rawJson = {
    'name': 'Wolverine',
    'power': 'Regeneración',
    'isAlive': true
  };
  
  // Creación de instancia
  final Hero wolverine = Hero.fromJson( rawJson );
  
  final Hero ironman = Hero(
    isAlive: false,
    name: 'Tony Stark',
    power: 'Money'
  );
  
  print( ironman );
  
}

class Hero {
  
  String name;
  String power;
  bool isAlive;
  
  Hero({
    required this.name,
    required this.power,
    required this.isAlive
  });
  
  //Name constructor
  Hero.fromJson( Map<String, dynamic> json )
    : name = json['name'] ?? 'No name found',
      power = json['power'] ?? 'No power found',
      isAlive = json['isAlive'] ?? false;
  
  @override
  String toString() {
    return '$name, $power, isAlive: ${ isAlive ? ' YES!' : 'Nope' }';
  }
  
}