import 'package:balance/utils/constants.dart';
import 'package:balance/widgets/add_expenses_wt/bs_num_keyboard.dart';
import 'package:flutter/material.dart';

class AddEntries extends StatelessWidget {
  const AddEntries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Ingresos'),
        elevation: 0,
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
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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