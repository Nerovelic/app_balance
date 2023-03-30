import 'package:balance/pages/add_entries.dart';
import 'package:balance/pages/add_expenses.dart';
import 'package:balance/widgets/balance_page_wt/animation_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({super.key});

  
  @override
  Widget build(BuildContext context) {
  List<SpeedDialChild> botones = [];
    // Boton para agregar gastos
    botones.add(
      SpeedDialChild(
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.remove_circle_outline),
        label: 'Gasto',
        labelStyle: const TextStyle(fontSize: 18),
        onTap: () {
          Navigator.push(
            context, 
            AnimationCustom(paginas: AddExpenses(), duracion: const Duration(milliseconds: 500), posicion: const Alignment(0.8, 1))
          );
        },
      ),
    );
    // Boton para agregar ingresos
    botones.add(
      SpeedDialChild(
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.add),
        label: 'Ingreso',
        labelStyle: const TextStyle(fontSize: 18),
        onTap: () {
          Navigator.push(
            context, 
            AnimationCustom(paginas: AddEntries(), duracion: const Duration(milliseconds: 500), posicion: const Alignment(0.8, 1))
          );
        }
      )
    );

    return SpeedDial(
      backgroundColor: Colors.grey[850],
      foregroundColor: Colors.white,
      childMargin: const EdgeInsets.symmetric(horizontal: 8),
      childrenButtonSize: const Size(60, 60),
      icon: Icons.add,
      activeIcon: Icons.close,
      children: botones,
    );
  }
}