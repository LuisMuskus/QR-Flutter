import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/home_page.dart';
import 'package:qr_reader/pages/mapa_page.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_providers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Uiprovider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR READER',
        initialRoute: 'home',
        routes: {
          'home': ( _ ) => HomePage(),
          'mapa': ( _ ) => MapaPage(),
        },
        //theme: ThemeData.dark(),
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          floatingActionButtonTheme: FloatingActionButtonThemeData( backgroundColor: Colors.deepPurple)
        ),
        
      ),
    );
  }
}