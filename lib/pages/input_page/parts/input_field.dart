import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved:    ( text ) => validator(text),
      decoration: const InputDecoration(
      hintText:   "Type a new english word",
      labelText:  'Input new word',
      border:     OutlineInputBorder(),
  ),
    );
  }

  bool validator( String? text ){
    return true;
  }
}
