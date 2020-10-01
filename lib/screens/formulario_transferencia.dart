import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/Transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerAccountName = TextEditingController();
  final TextEditingController _controllerAccountValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: _controllerAccountName,
              dica: '0000',
              rotulo: 'Número da Conta',
            ),
            Editor(
              controller: _controllerAccountValue,
              dica: '00.00',
              rotulo: 'Valor',
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text("Confirmar"),
            )
          ],
        ),
      ),
    );
  }
  void _criaTransferencia(BuildContext context) {
    final int accountNumber = int.tryParse(_controllerAccountName.text);
    final double accountValue = double.tryParse(_controllerAccountValue.text);
    if (accountValue != null && accountNumber != null) {
      final transferenciaCriada = Transferencia(accountValue, accountNumber);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}