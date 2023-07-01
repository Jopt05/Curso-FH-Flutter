void main() {
  
  final Hero wolverine = Hero('Logan', 'Regeneración');
  //new Hero
  
  print( wolverine );
  
  print( wolverine.name );
}

class Hero {
  // Atributos
  String name;
  String power;
  
  //Constructor
  //Hero( String pName, String pPower )
     //: name = pName,
       //power = pPower;
  
  Hero( this.name, this.power );
  
//  Hero( String pName, String pPower ) {
    //This es opcional
//    name = pName;
//    power = pPower;
  //}
  
}