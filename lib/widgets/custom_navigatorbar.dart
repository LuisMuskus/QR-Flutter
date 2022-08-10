import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/ui_providers.dart';

class CustomNavigatorBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider= Provider.of<Uiprovider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    //final currentIndex = 0;

    return BottomNavigationBar(
      //onTap: (int i) => print('opt: $i'),
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      elevation: 0,
      items: <BottomNavigationBarItem> [

        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
        BottomNavigationBarItem(icon: Icon(Icons.compass_calibration), label: 'Direcciones'),

      ],
    );
  }
}