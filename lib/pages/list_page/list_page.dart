import 'package:flutter/material.dart';

import '../../data/rank_data_model.dart';
import 'parts/fab.dart';
import 'parts/highest_score_line.dart';
import 'parts/score_list.dart';

class ListPage extends StatelessWidget {
  final List<RankDataModel>? rankList;
  
  const ListPage({super.key, required this.rankList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FAB(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all( 20.0 ),
          child: SizedBox(
            width: 400,
            child: ListView(
              shrinkWrap: true,
              children:    [
                HighestScoreLine( highestPoint: (rankList != null && rankList!.isNotEmpty )?(rankList![0].point ):(0) ),
                const SizedBox( height: 10 ),
                ScoreList( ranks: rankList )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
