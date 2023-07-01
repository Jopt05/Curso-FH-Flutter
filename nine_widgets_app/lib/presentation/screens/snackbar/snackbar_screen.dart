
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackbar( BuildContext context ) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      // Actua como un botón
      action: SnackBarAction(
        label: 'Ok!',
        onPressed:() {},
      ),
      // Esconde el snackbar después de dos segundos 
      duration: const Duration(seconds: 2)
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackbar
    );

  }

  void openDialog( BuildContext context ) {

    showDialog(
      context: context,
      // Permite controlar que la persona no cierre la ventana al dar click fuera
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Hola'),
        actions: [
          // Botones adicionales 
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Aceptar')
          ),
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),

      body: Center(
        child: Column(
          children: [
            FilledButton.tonal(
              onPressed: () {
                // Crea un cuadro de licencias
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Lorem ipsum')
                  ]
                );
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo de pantalla'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        onPressed: () => showCustomSnackbar(context),
        icon: const Icon( Icons.remove_red_eye_outlined ),
      ),
    );
  }
}