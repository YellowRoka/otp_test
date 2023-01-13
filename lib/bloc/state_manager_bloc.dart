import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/rank_data_model.dart';

part 'state_manager_event.dart';
part 'state_manager_state.dart';

//@injectable it is need for this project?
class StateManagerBloc extends Bloc< StateManagerEvent, StateManagerState > {

  List<String>         tmpMemory = [];
  List<RankDataModel>? rankList  = [];

  StateManagerBloc() : super( StateManagerInitial() ){
    on < SMInit           >( _initHandler  );
    on < SMEGoToListPage  >( _goToListPage );
    on < SMEGoToInputPage >( _goToMainPage );
    on < SMEAddedNewWord  >( _addNewWord   );
  }

  FutureOr<void>_initHandler( SMInit event, Emitter< StateManagerState > emit ){
    emit( StateManagerInit() );
  }

  FutureOr<void>_goToListPage( SMEGoToListPage event, Emitter< StateManagerState > emit ){
    
    if( tmpMemory.isNotEmpty ){
      rankList = [];
      tmpMemory.forEach((element) => rankList!.add( RankDataModel( element, element.length ) ) );
    }
    
    emit( SMSGoToListPage( rankList ) );
  }

  FutureOr<void>_goToMainPage( SMEGoToInputPage event, Emitter<StateManagerState> emit ){
    emit( SMSGoToInputPage() );
  }

  FutureOr<void>_addNewWord( SMEAddedNewWord event, Emitter<StateManagerState> emit ){
    tmpMemory.add(event.newWord);
    emit( SMSUpdateWords( tmpMemory ) );
  }
  
}
