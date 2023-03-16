import 'package:balance/pages/balance_page.dart';
import 'package:balance/pages/charts_page.dart';
import 'package:flutter/material.dart';
import 'package:balance/widgets/home_page_wt/custom_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../provider/ui_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      body: _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  // ignore: unused_element
  const _HomePage({super.key});
  @override
  Widget build(BuildContext context) {
  final uiProvider = Provider.of<UIProvider>(context);
  final currenIndex = uiProvider.bnbIndex;
    switch (currenIndex) {
      case 0:
        return const BalancePage();
      case 1:
        return const ChartsPage();
      default:
        return const BalancePage();
    }
  }
}
