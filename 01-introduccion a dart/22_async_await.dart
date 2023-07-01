//Podemos decirle que main será asyncrono
void main() async{
  
  print('Inicio del programa');
  
  try {
    final value = await httpGet('www.google.com');
    print(value);
  } catch(error) {
    print('Algo salió mal.');
  } on Exception catch(err) {
		print("Excepción especifica")
	} finally {
    print("Final del try y catch");
  }
  
  print('Fin del programa');
  
}

//Usa la palabra reservada async
Future<String> httpGet( String url ) async{
  
  await Future.delayed( const Duration(seconds: 1) );
  return 'Tenemos un valor HTTP.';
  
}