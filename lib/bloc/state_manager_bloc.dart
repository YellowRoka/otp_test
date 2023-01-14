import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/rank_data_model.dart';

part 'state_manager_event.dart';
part 'state_manager_state.dart';

//@injectable it is need for this project?
class StateManagerBloc extends Bloc< StateManagerEvent, StateManagerState > {

  List< RankDataModel > tmpMemory = [];
  List< RankDataModel > rankList  = [];

  StateManagerBloc() : super( StateManagerInitial() ){
    on< SMInit           >( _initStateHandler  );
    on< SMEGoToListPage  >( _goToListPage      );
    on< SMEGoToInputPage >( _goToMainPage      );
    on< SMEAddedNewWord  >( _addNewWord        );
  }

  FutureOr< void > _initStateHandler( SMInit event, Emitter< StateManagerState > emit ){
    emit( StateManagerInit() );
  }

  FutureOr< void > _goToListPage( SMEGoToListPage event, Emitter< StateManagerState > emit ){
    emit( SMSGoToListPage( rankList ) );
  }

  FutureOr< void > _goToMainPage( SMEGoToInputPage event, Emitter<StateManagerState> emit ){
    emit( SMSGoToInputPage() );
  }

  FutureOr< void > _addNewWord( SMEAddedNewWord event, Emitter<StateManagerState> emit ){
    final String newWord = event.newWord.toLowerCase();
    int count = 0;
    rankList.forEach(
      ( element ){
        if( element.word == newWord ){
          count++;
        }
      }
    );
    
    final RankDataModel countedNewWord = RankDataModel( newWord, newWord.length, count: count );

    
    rankList.add( countedNewWord );
    rankList.sort( (a, b) => b.point.compareTo(a.point) );

    tmpMemory.insert( 0, countedNewWord );
    emit( SMSUpdateWords( tmpMemory ) );
  }
  

 @override
  void onEvent( StateManagerEvent event ){
    super.onEvent(event);
    print( "event: ${event.toString()}" );
  }
}
