import 'package:flutter/material.dart';

import '../../../data/rank_data_model.dart';

class FeedbackLine extends StatelessWidget {
  final List<RankDataModel>? latestWords;
  
  const FeedbackLine({super.key, this.latestWords});

  @override
  Widget build( BuildContext context ){
    final BoxDecoration boxDecoration = BoxDecoration(
      border:       Border.all( color: Colors.green ),
      borderRadius: const BorderRadius.all( Radius.circular( 10 ) ),
    );

    return Container(
      height:     MediaQuery.of( context ).size.height / 3,
      padding:    const EdgeInsets.all( 10.0 ),
      decoration: boxDecoration,
      child:      ListView( children: latestWords?.map( buildLine ).toList() ?? [] ),
    );
  }

  Widget buildLine( RankDataModel data ) => 
    Text( 
      data.word, 
      style: 
      ( data.count >= 1                               )?
      ( const TextStyle( fontWeight: FontWeight.bold) ):
      ( null                                          )
    );

}
