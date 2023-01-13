part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerEvent {}

class SMInit extends StateManagerEvent{}

class SMEGoToListPage extends StateManagerEvent{}

class SMEGoToInputPage extends StateManagerEvent{}

class SMEAddedNewWord extends StateManagerEvent{
  final String newWord;

  SMEAddedNewWord(this.newWord);
  
  List<Object> get props => [ newWord ];
}
