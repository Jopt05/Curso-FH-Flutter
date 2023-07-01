import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nine_widgets_app/config/router/app_router.dart';
import 'package:nine_widgets_app/config/theme/app_theme.dart';
import 'package:nine_widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final bool isDarkMode = ref.watch( isDarkModeProvider );
    // final int selectedColor = ref.watch( selectedColorProvider );

    final AppTheme appTheme = ref.watch( themeNotifierProvider );

    // Se usa el método router para declarar nuestro router
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
      // theme: AppTheme(
      //   selectedColor: selectedColor,
      //   isDarkMode: isDarkMode
      // ).getTheme(),
    );
  }
}
