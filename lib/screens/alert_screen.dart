import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  //PROPIEDADES
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
      barrierDismissible: false, //PERMITE SALIR DEL DIALOGO TOCANDO FUERA (TRUE)
      context: context, 
      builder: (context) {
        return CupertinoAlertDialog(
          title:  const Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
               Text('Este es el contenido de una alerta'),
               SizedBox(height: 20,),
               FlutterLogo(size: 100,),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Cancelar', style: TextStyle(color: Colors.red),)
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Ok')
            ),
          ],
        );
      },
    );
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
      barrierDismissible: false, //PERMITE SALIR DEL DIALOGO TOCANDO FUERA (TRUE)
      context: context, 
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          title: const Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
               Text('Este es el contenido de una alerta'),
               SizedBox(height: 20,),
               FlutterLogo(size: 100,),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Cancelar')
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Ok')
            ),
          ],
        );
      },);
  }

  @override
  Widget build(BuildContext context) {
    //VARIABLES

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          // style: ElevatedButton.styleFrom(
          //   backgroundColor: Colors.indigo,
          //   shape: const StadiumBorder(),
          //   elevation: 0
          // ), EN CASO DE QUERER UN ESTILO DISTINTO SE SOBREESCRIBE EL STYLE DEL THEME AQUI
          // onPressed: () => displayDialogAndroid(context), 
          onPressed: () => Platform.isAndroid ? displayDialogAndroid(context) : displayDialogIOS(context), 
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Mostrar alerta', style: TextStyle(fontSize: 16),),
          )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.close),
      ),
    );
  }
}
