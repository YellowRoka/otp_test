import 'package:flutter/material.dart';
import 'package:otp_test/bloc/state_manager_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputButton extends StatelessWidget {
  const InputButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child:  ElevatedButton(
        child: const Text('Enter'),
        onPressed: () => context.read< StateManagerBloc >().add( SMEAddedNewWord("TEST") ),
      ),
    );
  }
}
