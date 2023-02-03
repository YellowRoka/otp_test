import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_test/bloc/state_manager_bloc.dart';
import 'package:otp_test/commons/constans.dart';
import 'package:otp_test/data/rank_data_model.dart';


class RouteHandler extends StatelessWidget {
  const RouteHandler({super.key});

  @override
  Widget build( BuildContext context ){
    return BlocListener<StateManagerBloc, StateManagerState>(
      listener: ( context, state ){
        if( state is SMSGoToInputPage ){ _dinamicRouteToInputPage( context ); }
        if( state is SMSGoToListPage  ){ _dinamicRouteToIListPage( context, state.rankList ); }
      },
      child: const SizedBox(),
    );
  }

  void _dinamicRouteToInputPage( BuildContext context ) => Navigator.pushNamed( context, constRouteInitPage );
  void _dinamicRouteToIListPage( BuildContext context, List<RankDataModel>? rankList ) => Navigator.pushNamed( context, constRouteListPage, arguments: rankList );
}
