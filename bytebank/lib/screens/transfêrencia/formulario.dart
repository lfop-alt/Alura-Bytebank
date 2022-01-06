import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transfêrencia';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = 'Insira o valor';
const _dicaCampoNumeroConta = 'Conta';
const _rotuloCampoNumeroConta = 'São quatro numeros';
const _botaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController _controladorCampoValor = TextEditingController();
  final TextEditingController _controladorCampoConta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(

        child: Column(

          children: <Widget>[
            Editor(
                controlador: _controladorCampoConta,
                rotulo: _rotuloCampoNumeroConta,
                dica: _dicaCampoNumeroConta
            ),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on
            ),
            ElevatedButton(
                onPressed: () => _criarTransferencia(context),
                child: const Text(_botaoConfirmar,)

            ),
          ],
        ),
      ),
    );
  }
  void _criarTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}