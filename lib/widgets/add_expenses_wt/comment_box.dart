import 'package:balance/models/combined_model.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  final CombinedModel combinedModel;
  const CommentBox({super.key, required this.combinedModel});
  @override
  Widget build(BuildContext context) {
    String _text = '';
    _text = combinedModel.comment;
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
              initialValue: _text,
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
                onChanged: (texto) {
                  combinedModel.comment = texto;
              },
            ),
          ),
        ],
      ),
    );
  }
}