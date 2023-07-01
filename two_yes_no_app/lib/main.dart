import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_yes_no_app/config/theme/app_theme.dart';
import 'package:two_yes_no_app/presentation/providers/chat_provider.dart';
import 'package:two_yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // Creación de la instancia inicial
          create: ( context ) => ChatProvider()
          )
      ],
      child: MaterialApp(
        title: 'Material App',
        // Usamos la clase que creamos en el otro archivo
        theme: AppTheme(selectedColor: 0).theme(),
        home: const ChatScreen()
      ),
    );
  }
}