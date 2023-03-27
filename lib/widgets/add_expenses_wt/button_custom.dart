import 'package:flutter/material.dart';

class ButtonCustom extends StatefulWidget {
  const ButtonCustom({super.key, this.texto = "", this.color, required Null Function() onPressed});
  final String texto;
  final Color? color;
  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), 
        backgroundColor: widget.color,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(widget.texto),
    );
  }
}