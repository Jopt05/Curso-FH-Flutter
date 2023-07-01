void main() {
  
  final mySquare = Square(
    side: 10
  );
  
  mySquare.side = 5;
  
  print(' area: ${ mySquare.area } ');
  
}

class Square {
  
  //Propiedaes privadas
  double _side;
  
  Square({ required double side })
    : _side = side;
  
  // Palabra reservada get
  double get area {
    return _side * _side;
  }
  
  // Setter
  set side( double value ) {
    print('Setting new value $value');
    if ( value < 0 ) throw 'Value must be +0';
    
    _side = value;
  }
  
  //  double calculateArea() {
  //    return side*side;1
  //}
  
}