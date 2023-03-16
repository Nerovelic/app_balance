import 'package:balance/provider/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    return BottomNavigationBar(   
        currentIndex: uiProvider.bnbIndex, 
        onTap: (int i) => uiProvider.bnbIndex = i, 
        elevation: 0,
        items: const
      [
      BottomNavigationBarItem(
        label: 'Balance',
        icon: Icon(Icons.account_balance_outlined),
      ),
      BottomNavigationBarItem(
        label: 'Gráficos',
        icon: Icon(Icons.bar_chart_outlined),
      ),
      BottomNavigationBarItem(
        label: 'Configuración',
        icon: Icon(Icons.settings_outlined),
      ),
    ]);
  }
}
