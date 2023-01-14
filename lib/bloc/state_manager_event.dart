part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerEvent {
  const StateManagerEvent();
}

class SMInit extends StateManagerEvent{
  const SMInit();
}

class SMEGoToListPage extends StateManagerEvent{
  const SMEGoToListPage();
}

class SMEGoToInputPage extends StateManagerEvent{
  const SMEGoToInputPage();
}

class SMEAddedNewWord extends StateManagerEvent{
  final String newWord;

  const SMEAddedNewWord(this.newWord);
}
