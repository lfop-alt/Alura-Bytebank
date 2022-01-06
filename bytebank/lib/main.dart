import 'package:flutter/material.dart';

import 'screens/transfêrencia/lista.dart';

void main() => runApp(const ByteBankApp());

 class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ListaTransferencia(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.green
          )
        )
    );
  }
}

