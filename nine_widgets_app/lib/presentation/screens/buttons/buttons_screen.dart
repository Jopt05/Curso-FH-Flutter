import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ButtonsScreen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.arrow_back_ios_new_outlined ),
        onPressed: () {
          // Permite regresar
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text('Elevated Button'),
            ),
    
            const ElevatedButton(
              // Si colocas null, queda deshabilitado 
              onPressed: null,
              child: Text('Elevated disabled'),
            ),
    
            ElevatedButton.icon(
              // Permite agregar iconos
              onPressed: () {},
              icon: const Icon( Icons.access_alarm_rounded ),
              label: const Text('Elevated Icon'),
            ),

            FilledButton(
              onPressed: () {
                
              },
              child: const Text('Filled'),
            ),

            FilledButton.icon(
              icon: const Icon( Icons.accessibility_new ),
              onPressed: () {
                
              },
              label: const Text('Filled icon'),
            ),

            OutlinedButton(
              onPressed: () {
                
              },
              child: const Text('OutlinedButton'),
            ),

            OutlinedButton.icon(
              icon: const Icon( Icons.terminal ),
              onPressed: () {
                
              },
              label: const Text('Outlinedbutton icon'),
            ),

            TextButton(
              onPressed: () {
                
              },
              child: const Text('Text Button'),
            ),

            TextButton.icon(
              icon: const Icon( Icons.abc_rounded ),
              onPressed: () {
                
              },
              label: const Text('Text Button Icon'),
            ),

            CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {
            
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola mundo', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}