import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_test/data/rank_data_model.dart';

part 'state_manager_event.dart';
part 'state_manager_state.dart';


class StateManagerBloc extends Bloc< StateManagerEvent, StateManagerState > {

  List< RankDataModel > allCountedWorld = [];
  List< RankDataModel > rankList        = [];

  StateManagerBloc() : super( const SMSInitial() ){
    on< SMEInit          >( _initStateHandler );
    on< SMEGoToListPage  >( _goToListPage     );
    on< SMEGoToInputPage >( _goToMainPage     );
    on< SMEAddedNewWord  >( _addNewWord       );
  }

  FutureOr< void > _initStateHandler( SMEInit event, Emitter< StateManagerState > emit ){
    emit( const SMSInit() );
  }

  FutureOr< void > _goToListPage( SMEGoToListPage event, Emitter< StateManagerState > emit ){
    emit( SMSGoToListPage( rankList ) );
  }

  FutureOr< void > _goToMainPage( SMEGoToInputPage event, Emitter<StateManagerState> emit ){
    emit( SMSGoToInputPage( allCountedWorld ) );
  }

  FutureOr< void > _addNewWord( SMEAddedNewWord event, Emitter<StateManagerState> emit ){
    final String newWord = event.newWord.toLowerCase();
    int count = 0;

    for( var element in rankList ){
      if( element.word == newWord ){
        count++;
      }
    }
    
    final RankDataModel countedNewWord = RankDataModel( newWord, newWord.length, count: count );
    
    rankList.add( countedNewWord );
    rankList.sort( (a, b) => b.point.compareTo(a.point) );

    allCountedWorld.insert( 0, countedNewWord );
    emit( SMSUpdateWords( allCountedWorld ) );
  }
  

  @override
  void onEvent( StateManagerEvent event ){
    super.onEvent(event);
    if( kDebugMode ) print( "event: ${event.toString()}" );
  }
}
