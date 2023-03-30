import 'package:balance/models/combined_model.dart';
import 'package:balance/utils/constants.dart';
import 'package:balance/widgets/add_expenses_wt/bs_num_keyboard.dart';
import 'package:balance/widgets/add_expenses_wt/comment_box.dart';
import 'package:flutter/material.dart';

class AddEntries extends StatelessWidget {
  CombinedModel combinedModel = CombinedModel();
  // const AddEntries({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /*Para cerrar el teclado al tocar cualquier lugar de la pantalla*/
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Agregar Ingresos'),
          elevation: 0,
        ),
        body: Column(
          children: [
            BSNumKeyboard(combinedModel: combinedModel,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: Constants.sheetBoxDecoration(
                  Theme.of(context).primaryColorDark
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Fecha 22 marzo del 2023'),
                    const Text('Seleccionar Categoría'),
                    CommentBox(combinedModel: combinedModel),
                    Expanded(
                      child: Center(
                          child: GestureDetector(
                          onTap: () {
                            print(combinedModel.comment);
                            print(combinedModel.amount);
                          },
                          child: const Text('Botón')
                        )
                      )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}