import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_test/bloc/state_manager_bloc.dart';

class FOB extends StatelessWidget {
  const FOB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.read<StateManagerBloc>().add( const SMEGoToListPage() ),
      child:     const Icon( Icons.list_rounded )
    );
  }
}
