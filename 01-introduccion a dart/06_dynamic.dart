void main() {
  
  final String pokemon = 'Ditto';
  final int hp = 100;
  final bool isAlive = true;
  // bool? isAlive
  final abilities = <String>['impostor'];
  //final List<String> abilities = ['impostor'];
  final List<String> sprites = ['ditto/front.png', 'ditto/back.png'];
    
  // dynamic
  dynamic errorMessage = 'Hola';
  errorMessage = true;
  errorMessage = {1,2,3,4};
  errorMessage = () => true;
  
  print("""
    $pokemon
    $hp
    $isAlive
    $abilities
    $sprites
    $errorMessage
  """);
    
}