import 'package:balance/utils/constants.dart';
import 'package:flutter/material.dart';

class FrontSheet extends StatelessWidget {
  const FrontSheet({super.key});

  @override
  Widget build(BuildContext context) {
      // ignore: no_leading_underscores_for_local_identifiers
      final _list = List.generate(10, (index) => Padding(padding: 
      const EdgeInsets.all(10),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(30)
        ),
      ),
    ));
    return Container(                     
      height: 800,
      decoration: Constants.sheetBoxDecoration(Theme.of(context).scaffoldBackgroundColor),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: _list,
      ), 
    );
  }
}