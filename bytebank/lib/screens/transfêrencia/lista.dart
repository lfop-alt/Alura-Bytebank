import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transf%C3%AArencia/formulario.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Transferência';

class ListaTransferencia extends StatefulWidget {

  final List<Transferencia> _transferencias = [];

  ListaTransferencia({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text(_tituloAppBar),
      ),
      floatingActionButton:
      FloatingActionButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
          return const FormularioTransferencia();
        })).then((transferenciaRecebida) {
          if(transferenciaRecebida != null){
            setState(() {
              widget._transferencias.add(transferenciaRecebida!);
            });
          }
        });
      }, child: const Icon(Icons.add),
        backgroundColor: Colors.amber,),

      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice){
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: const Icon(
            Icons.monetization_on,
            size: 50,
          ),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString()),
        ));
  }
}