void main() {
  
  final windPlant = EnergyPlant();
  
}

// Es como un typescrit
enum PlantType {
  nuclear,
  wind,
  water
}

abstract class EnergyPlant {
  
  double? energyLeft;
  PlantType? type;
  
  Energyplant({
    required energyLeft,
    required type
  });
  
  // Extendemos un método, como en Python, no se ejecuta
  // Pero otras clases pueden implementarlo
  void consumeEnergy( double amount );
  
}