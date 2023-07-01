import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nine_widgets_app/menu/menu_items.dart';
import 'package:nine_widgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:nine_widgets_app/presentation/screens/cards/cards_screen.dart';
import 'package:nine_widgets_app/presentation/widgets/drawers/side_menu.dart';

class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      // Referencia para cerrar el drawer
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
        centerTitle: true,
      ),
      body: const _HomeView(),
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  final List<MenuItem> menuItems = appMenuItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];

        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    super.key,
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: theme.primary,
       ),
       trailing: const Icon(
        Icons.arrow_forward_ios_rounded
       ),
       onTap: () {

        // Se realiza un push o stack de tarjetas, poner una tarjeta sobre otra 
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );

        // Navigator.pushNamed(context, menuItem.link);

        // context.push(
        //   menuItem.link
        // );

        context.push( menuItem.link );

        // context.go(  )
         
       },
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
    );
  }
}