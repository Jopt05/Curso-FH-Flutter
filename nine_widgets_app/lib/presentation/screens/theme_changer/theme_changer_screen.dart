import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nine_widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  static const name = 'theme_changer_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final isDarkMode = ref.watch( isDarkModeProvider );

    // Con el themeNotifierProvider
    final isDarkMode = ref.watch( themeNotifierProvider ).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: () {
              // final bool valorActual = ref.read(isDarkModeProvider.notifier).state;
              // ref.read(isDarkModeProvider.notifier).state = !valorActual;

              // Con el Notifier para acceder a los metodos
              ref.read( themeNotifierProvider.notifier ).toggleDarkmode();
            },
            icon: Icon(
              isDarkMode
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined
            ),
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors = ref.watch(colorListProvider);

    // final int selectedColor = ref.watch(selectedColorProvider);
    final int selectedColor = ref.watch( themeNotifierProvider ).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];

        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${ color.value }'),
          activeColor: color,
          value: index, 
          groupValue: selectedColor, 
          onChanged: (value) {
            // todo: notificar el cambio
            // ref.read(selectedColorProvider.notifier).state = index;

            // Con el notifier
            ref.read( themeNotifierProvider.notifier ).changeColorIndex(index);
        },
        );
      },
    );
  }
}