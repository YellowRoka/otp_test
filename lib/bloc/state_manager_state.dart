part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerState {}

class StateManagerInitial extends StateManagerState {}

class StateManagerInit extends StateManagerState {}

class SMSGoToListPage extends StateManagerState{
  final List<RankDataModel>? rankList;

  SMSGoToListPage(this.rankList);

  List<Object> get props => [ rankList! ];
}

class SMSGoToInputPage extends StateManagerState{}

class SMSUpdateWords extends StateManagerState{
  final List<RankDataModel>? newWords;

  SMSUpdateWords(this.newWords);

  List<Object> get props => [ newWords! ];
}
