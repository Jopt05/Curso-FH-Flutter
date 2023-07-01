import 'package:go_router/go_router.dart';
import 'package:nine_widgets_app/menu/menu_items.dart';
import 'package:nine_widgets_app/presentation/screens/screens.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key,
    required this.scaffoldKey,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  // Para saber opción seleccionada 
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    // Saber la distancia existente en el top
    // Si es más de 35 entonces sí hay un Notch considerable
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      // Saber el elemento seleccionado
      selectedIndex: navDrawerIndex,
      // Cuando das click a otra pantalla se ejecuta ésto
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        // Navegación
        final menuItem = appMenuItems[value];

        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 5 : 20, 16, 10),
          child: const Text('Main'),
        ),

        ...appMenuItems
          .sublist(0,3)
          .map(
          (item) => NavigationDrawerDestination(
            icon: Icon( item.icon ),
            label: Text( item.title ),
          )
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('More options'),
        ),

        ...appMenuItems
          .sublist(3)
          .map(
          (item) => NavigationDrawerDestination(
            icon: Icon( item.icon ),
            label: Text( item.title ),
          )
        ),



        // Hijo del navigationDrawer
        // NavigationDrawerDestination(
        //   icon: Icon( Icons.add ),
        //   label: Text('Home Screen'),
        // ),
        // NavigationDrawerDestination(
        //   icon: Icon( Icons.add_shopping_cart ),
        //   label: Text('Otra pantalla'),
        // ),
      ],
    );
  }
}