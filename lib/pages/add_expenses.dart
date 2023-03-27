import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/add_expenses_wt/bs_num_keyboard.dart';

class AddExpenses extends StatelessWidget {
  const AddExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Gastos'),
      ),
      body: Column(
        children: [
          const BSNumKeyboard(),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: Constants.sheetBoxDecoration(
                Theme.of(context).primaryColorDark
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Fecha 22 marzo del 2023'),
                  Text('Seleccionar Categoría'),
                  Text('Agregar Comentario'),
                  Expanded(
                    child: Center(
                      child: Text('Botón')
                    )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}