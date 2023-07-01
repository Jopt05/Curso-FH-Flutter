
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nine_widgets_app/config/theme/app_theme.dart';

// Lista de colors inmutable
final colorListProvider = Provider((ref) => colorList);

final isDarkModeProvider = StateProvider((ref) => false);

final selectedColorProvider = StateProvider((ref) => 0);

// Un objeto de tipo AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// Se encarga de mantener un estado en particular, en este caso una instancia del AppTheme
class ThemeNotifier extends StateNotifier<AppTheme> {

  // Crea una instancia de AppTheme, es el Estado.
  // State = new AppTheme()
  // state.isDarkMode
  ThemeNotifier(): super( AppTheme() );

  void toggleDarkmode() {

    // Cambio de estado 
    state = state.copyWith(
      isDarkMode: !state.isDarkMode
    );

  }

  void changeColorIndex( int colorIndex ) {

    state = state.copyWith(
      selectedColor: colorIndex
    );

  }

}