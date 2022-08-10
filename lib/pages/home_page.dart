import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_pages.dart';

import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_providers.dart';

import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            onPressed: (){
                Provider.of<ScanListProvider>(context, listen: false)
                .borrarTodos();
            }, 
            icon: Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: _HomePageBody(),

     bottomNavigationBar: CustomNavigatorBar(),
     floatingActionButton: ScanButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //obtener el selected menu opt
    final uiProvider= Provider.of<Uiprovider>(context);
   
    // cambiar  currentinex para mostarr pagina respectiva
    //final currentIndex = 0;
    final currentIndex = uiProvider.selectedMenuOpt;

    // TODO: temporal leer la bd

    //final tempScan = new ScanModel(valor: 'http://google.com');
    //DBProvider.db.nuevoScan(tempScan);
    //DBProvider.db.getScanById(3).then((scan) => print(scan!.valor));
    //DBProvider.db.getTodosLosScans().then( print );
    //DBProvider.db.deleteAllScans().then( print );

    // Usar el ScanListProvider
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    
    switch(currentIndex){

      case 0:
        scanListProvider.cargarScanPorTipo('geo');
        return MapasPages();

      case 1: 
        scanListProvider.cargarScanPorTipo('http');
        return DireccionesPage();

      default:
        return MapasPages();
    }
  }
}