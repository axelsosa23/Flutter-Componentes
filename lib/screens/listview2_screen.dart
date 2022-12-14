import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  //PROPIEDADES
  const ListView2Screen({Key? key}) : super(key: key);
  final options = const [
    'Megaman',
    'Metal Gear',
    'Super Smash',
    'Final Fantasy'
  ];

  @override
  Widget build(BuildContext context) {
    //VARIABLES

    return Scaffold(
        appBar: AppBar(
          title: const Text('Listview Tipo 2')
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text(options[index]),
            trailing: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.indigo,),
            onTap: () {
              print(options[index]);
            },
          ),
          // separatorBuilder: (_, __) => const Divider(),
          separatorBuilder: ( _ , __ ) => const Text('SEPARACION '),
          itemCount: options.length,
        ));
  }
}
