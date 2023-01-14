part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerState {
  const StateManagerState();
}

class StateManagerInitial extends StateManagerState {
  const StateManagerInitial();
}

class StateManagerInit extends StateManagerState {
  const StateManagerInit();
}

class SMSGoToListPage extends StateManagerState{
  final List<RankDataModel>? rankList;

  const SMSGoToListPage(this.rankList);
}

class SMSGoToInputPage extends StateManagerState{
  const SMSGoToInputPage();
}

class SMSUpdateWords extends StateManagerState{
  final List<RankDataModel>? newWords;

  const SMSUpdateWords(this.newWords);
}
