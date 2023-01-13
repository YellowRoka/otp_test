import 'package:flutter/material.dart';

import '../data/rank_data_model.dart';
import '../pages/input_page/input_page.dart';
import '../pages/list_page/list_page.dart';

PageRouteBuilder< dynamic > animatedRouteToInputPage( RouteSettings settings ){
  return PageRouteBuilder(
    settings:           settings,
    pageBuilder:        (context, animation, secondaryAnimation        ) => const InputPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child ) => FadeTransition( opacity: animation, child: child )
  );
}

PageRouteBuilder< dynamic > animatedRouteToListPage( RouteSettings settings,  dynamic args ){
  List<RankDataModel>? rankList = args as List<RankDataModel>?;
  return PageRouteBuilder(
    settings:           settings,  
    pageBuilder:        ( context, animation, secondaryAnimation        ) => ListPage( rankList: rankList ),
    transitionsBuilder: ( context, animation, secondaryAnimation, child ) => FadeTransition( opacity: animation, child: child ),
  );
}
