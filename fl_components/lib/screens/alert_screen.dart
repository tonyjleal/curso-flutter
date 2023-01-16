import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text('Titulo'),
              content: Column(mainAxisSize: MainAxisSize.min, children: const [
                Text('Este es el contenido de la alerta'),
                SizedBox(
                  height: 10,
                ),
                FlutterLogo(
                  size: 100,
                )
              ]),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Aceptar'))
              ],
            ));
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(15)),
              elevation: 5,
              title: const Text('Titulo'),
              content: Column(mainAxisSize: MainAxisSize.min, children: const [
                Text('Este es el contenido de la alerta'),
                SizedBox(
                  height: 10,
                ),
                FlutterLogo(
                  size: 100,
                )
              ]),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Aceptar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            // onPressed: () => displayDialogAndroid(context),
            onPressed: () => Platform.isAndroid
                ? displayDialogAndroid(context)
                : displayDialogIOS(context),
            //style: ElevatedButton.styleFrom(
            //    backgroundColor: Colors.red, elevation: 100),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                'Mostrar alerta',
                style: TextStyle(fontSize: 16),
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.close),
      ),
    );
  }
}
