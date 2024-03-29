import 'package:flutter/material.dart';
import 'package:otp_test/bloc/state_manager_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:otp_test/commons/constans.dart';

class InputButton extends StatelessWidget {
  const InputButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child:  ElevatedButton(
        child: const Text( constEnter ),
        onPressed: () {
          var form = FormBuilder.of(context)!;
          if( form.saveAndValidate() ){
            context.read< StateManagerBloc >().add( SMEAddedNewWord( form.value[ constInputTextField ] as String ) );
          }
        }
      ),
    );
  }
}
