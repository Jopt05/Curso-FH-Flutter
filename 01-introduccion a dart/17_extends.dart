void main() {
  
  final windPlant = WindPlant(
    initialEnergy: 100
  );
  
  
  print( 'Wind: ${ chargePhone( windPlant ) }' );
  
}

double chargePhone( EnergyPlant plant ) {
  
  if ( plant.energyLeft < 10 ) {
    throw Exception('Not enough energy');
  }
  
  return plant.energyLeft - 10;
}

// Es como un typescrit
enum PlantType {
  nuclear,
  wind,
  water
}

abstract class EnergyPlant {
  
  double energyLeft;
  PlantType type;
  
  EnergyPlant({
    required this.energyLeft,
    required this.type
  });
  
  // Extendemos un método, como en Python, no se ejecuta
  // Pero otras clases pueden implementarlo
  void consumeEnergy( double amount );
  
}

//Palabra reservada para extender
class WindPlant extends EnergyPlant{
  
  WindPlant({
    required double initialEnergy
  }): super( 
    energyLeft: initialEnergy,
    type: PlantType.wind
  );
  
  @override
  void consumeEnergy( double amount ) {
    energyLeft -= amount;
  }
  
}