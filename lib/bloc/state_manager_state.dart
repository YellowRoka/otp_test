part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerState {
  const StateManagerState();
}

class SMSInitial extends StateManagerState {
  const SMSInitial();
}

class SMSInit extends StateManagerState {
  const SMSInit();
}

class SMSGoToListPage extends StateManagerState{
  final List<RankDataModel>? rankList;

  const SMSGoToListPage(this.rankList);
}

class SMSGoToInputPage extends StateManagerState{
  final List<RankDataModel>? rankedList;
  
  const SMSGoToInputPage(this.rankedList);
}

class SMSUpdateWords extends StateManagerState{
  final List<RankDataModel>? newWords;

  const SMSUpdateWords(this.newWords);
}
