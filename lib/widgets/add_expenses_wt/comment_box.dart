import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          const Icon(
            Icons.sticky_note_2_outlined,
          size: 40,
          ),
          const SizedBox(width: 8,),
          Expanded(
            child: TextFormField(
              cursorColor: Colors.green,
              keyboardType: TextInputType.text,
              maxLength: 20,
              decoration: InputDecoration(
                counterText: '',
                hintText: "Puedes agregar un comentario.",
                hintStyle: const TextStyle(
                  fontSize: 15,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.green)
                )
                
              ),
              )
            )
        ],
      ),
    );
  }
}