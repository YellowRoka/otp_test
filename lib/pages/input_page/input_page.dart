import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_test/bloc/state_manager_bloc.dart';

import 'parts/feeback_line.dart';
import 'parts/fob.dart';
import 'parts/input_button.dart';
import 'parts/input_field.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  static List<String>? latestWords = [];

  @override
  Widget build( BuildContext context ){
    return BlocBuilder<StateManagerBloc, StateManagerState>(
      builder: ( context, state ){
        if( state is SMSUpdateWords ){
          latestWords = state.newWords;
        }

        return Scaffold(
          floatingActionButton: const FOB(),

          body: Center(
            child: Padding(
              padding: const EdgeInsets.all( 20.0 ),
              child: SizedBox(
                width: 400,
                child: ListView(
                  shrinkWrap: true,
                  children:   [
                    const InputField(),
                    const SizedBox( height: 10 ),
                    const InputButton(),
                    const SizedBox( height: 10 ),
                    FeedbackLine( latestWords: latestWords ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}