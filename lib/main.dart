import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_test/bloc/state_manager_bloc.dart';
import 'package:otp_test/commons/constans.dart';

import 'route_handler/route_handler.dart';
import 'route_handler/routes.dart';

void main() {
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      BlocProvider(
        create: ( BuildContext context ) => StateManagerBloc()..add( const SMEGoToInputPage() ),
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          
          onGenerateRoute: ( settings ){
            if( settings.name?.startsWith( constRouteInitPage ) ?? false ){ return animatedRouteToInputPage( settings ); }
            if( settings.name?.startsWith( constRouteListPage )  ?? false ){ return animatedRouteToListPage( settings, settings.arguments );  }

            return null;
          },

          title: constTitle,
          theme: ThemeData( primarySwatch: Colors.green ),
          home:  const Scaffold( body: RouteHandler() )
      ),
    );
  }
}
