void main() {
  
  final numbers = [1,2,3,4,5,5,5,6,7,8,9,9,10];
  
  print('List original $numbers');
  print('Longitud ${ numbers.length }');
  print('Index 0: ${ numbers[0] }');
  print('Index 0: ${ numbers.first }');
  print('Reversed: ${ numbers.reversed }');
  
  final reversedNumbers = numbers.reversed;
  print('Iterable: $reversedNumbers');
  print('List: ${ reversedNumbers.toList() }');
  print('Set: ${ reversedNumbers.toSet() }');
  
  //List original [1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 9, 9, 10]
  //Longitud 13
  //Index 0: 1
  //Index 0: 1
  //Reversed: (10, 9, 9, 8, 7, 6, 5, 5, 5, 4, 3, 2, 1)
  //Iterable: (10, 9, 9, 8, 7, 6, 5, 5, 5, 4, 3, 2, 1)
  //List: [10, 9, 9, 8, 7, 6, 5, 5, 5, 4, 3, 2, 1]
  //Set: {10, 9, 8, 7, 6, 5, 4, 3, 2, 1}
  
  final numbersGreaterThan5 = numbers.where( (num) {
    return num > 5;
  });
  
  print('>5 Iterable: $numbersGreaterThan5');
  print('>5 Set: ${numbersGreaterThan5.toSet()}');
  //>5: (6, 7, 8, 9, 9, 10);
  //>5 Set: {6, 7, 8, 9, 10}
}