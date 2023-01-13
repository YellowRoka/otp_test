
import 'package:flutter/material.dart';

import '../../../data/rank_data_model.dart';

class ScoreList extends StatelessWidget {
  
  final List< RankDataModel >? ranks;
  
  const ScoreList( { super.key, this.ranks } );

  @override
  Widget build(BuildContext context) {
    final BoxDecoration boxDecoration = 
      BoxDecoration(
        border:       Border.all( color: Colors.green ),
        borderRadius: const BorderRadius.all( Radius.circular( 10 ) ),
      );

    return Container(
      height:     MediaQuery.of( context ).size.height / 3,
      padding:    const EdgeInsets.all( 10.0 ),
      decoration: boxDecoration,
      child:      ListView( 
        children: 
        ( ranks != null && ranks!.isNotEmpty )?
        ( ranks!.map( buildLine ).toList()   ):
        ( [ const SizedBox() ]               ) 
      ),
    );
  }

  Widget buildLine( RankDataModel data ) => Builder(
    builder: ( context ){
      return Column(
        children: [
          Row(
            mainAxisAlignment:  MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                width: 20,
                child: Text( 
                  "${data.point}",
                  textAlign: TextAlign.center
                )
              ),

              const Spacer( flex: 1 ),

              Expanded( 
                flex:  10, 
                child: Text( data.word )
              ),
              
            ],
          ),
          const SizedBox( height: 10 )
        ],
      );
    }
  );

}
