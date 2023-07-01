
import 'package:flutter/material.dart';

// Clase para cada una de las opciones 
class MenuItem {

  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon
  });

}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card
  ),
  MenuItem(
    title: 'ProgressIndicators',
    subTitle: 'Barras de progreso',
    link: '/progress',
    icon: Icons.chair
  ),
  MenuItem(
    title: 'Snackbars',
    subTitle: 'Snackbars',
    link: '/snackbar',
    icon: Icons.scanner
  ),
  MenuItem(
    title: 'Animated container',
    subTitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.tab
  ),
  MenuItem(
    title: 'Ui-Controls',
    subTitle: 'Controls Screen',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined
  ),
  MenuItem(
    title: 'Tutorial',
    subTitle: 'Tutorial screen',
    link: '/tutorial',
    icon: Icons.interests_rounded
  ),
  MenuItem(
    title: 'Infinite Screen',
    subTitle: 'Listas infinitas y pull to refresh',
    link: '/infinite',
    icon: Icons.screen_lock_landscape
  ),
  MenuItem(
    title: 'Counter Screen',
    subTitle: 'Uso de Riverpod',
    link: '/counter',
    icon: Icons.star_outline_sharp
  ),
  MenuItem(
    title: 'Theme Screen',
    subTitle: 'Cambio del tema',
    link: '/theme_changer',
    icon: Icons.theater_comedy
  ),
];