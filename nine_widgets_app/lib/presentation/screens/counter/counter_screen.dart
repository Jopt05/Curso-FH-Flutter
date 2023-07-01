import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nine_widgets_app/presentation/providers/counter_provider.dart';
import 'package:nine_widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  static String name = 'counter_screen';

  @override
  // Tenemos acceso a la referencia de el provider
  Widget build(BuildContext context, WidgetRef ref) {

    final int counterValue = ref.watch(counterProvider);

    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read( isDarkModeProvider.notifier )
                .update((state) => !state);
            },
            icon: Icon(
              isDarkMode
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Valor: $counterValue',
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tenemos acceso al provider
          int value = ref.read( counterProvider.notifier ).state;
          ref.read( counterProvider.notifier ).state = value + 1;

          // ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon( Icons.add ),
      ),
    );
  }
}