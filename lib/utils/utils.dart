import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

launchURL( BuildContext context, ScanModel scan  ) async {

  //final url = scan.valor;
  final Uri _url = Uri.parse(scan.valor.toString());

  //print(_url);
  //print(scan.tipo);

  if ( scan.tipo == 'http' ) {
    // Abrir el sitio web
    if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
    }else{
      await launchUrl(_url);
    }


  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan );
  }

}
