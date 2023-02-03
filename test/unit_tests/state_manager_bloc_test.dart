import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:otp_test/bloc/state_manager_bloc.dart';

void main() {

  blocTest( "1 StateManager test - init state",
    build:  ()     => StateManagerBloc(),
    act:    (bloc) => bloc.add( const SMEInit() ),
    expect: ()     => [ isA<SMSInit>() ]
    
  );

  blocTest( "2 StateManager test - go to input page",
    build:  ()     => StateManagerBloc(),
    act:    (bloc) => bloc.add( const SMEGoToInputPage() ),
    expect: ()     => [ isA<SMSGoToInputPage>() ]
  );
  
  blocTest( "3 StateManager test - add new word",
    build:  ()     => StateManagerBloc(),
    act:    (bloc) => bloc.add( const SMEAddedNewWord("word") ),
    expect: ()     => [ isA<SMSUpdateWords>() ],
    verify: (bloc){
      expect( (bloc.state as SMSUpdateWords).newWords![0].count, 0 );
      expect( (bloc.state as SMSUpdateWords).newWords![0].point, 4 );
      expect( (bloc.state as SMSUpdateWords).newWords![0].word, "word" );
    },
  );

  blocTest( "4 StateManager test - added new word converting to lower case",
    build:  ()     => StateManagerBloc(),
    act:    (bloc) => bloc.add( const SMEAddedNewWord("WORD") ),
    expect: ()     => [ isA<SMSUpdateWords>() ],
    verify: (bloc){
      expect( (bloc.state as SMSUpdateWords).newWords![0].word, "word" );
    },
  );

  blocTest( "5 StateManager test - added new words sorting",
    build: () => StateManagerBloc(),

    act: ( bloc ){
      bloc.add( const SMEAddedNewWord("and") );
      bloc.add( const SMEAddedNewWord("word") );
    },
    
    expect: () => [
      isA<SMSUpdateWords>(),
      isA<SMSUpdateWords>()
    ],
    
    verify: ( bloc ){
      expect( (bloc.state as SMSUpdateWords).newWords![0].count, 0 );
      expect( (bloc.state as SMSUpdateWords).newWords![0].point, 4 );
      expect( (bloc.state as SMSUpdateWords).newWords![0].word, "word" );

      expect( (bloc.state as SMSUpdateWords).newWords![1].count, 0 );
      expect( (bloc.state as SMSUpdateWords).newWords![1].point, 3 );
      expect( (bloc.state as SMSUpdateWords).newWords![1].word, "and" );
    },
  );

  blocTest( "6 StateManager test - test duplicated words markers",
    build: () => StateManagerBloc(),
    
    act: ( bloc ){
      bloc.add( const SMEAddedNewWord("and")  );
      bloc.add( const SMEAddedNewWord("word") );
      bloc.add( const SMEAddedNewWord("word") );
    },
    
    expect: () => [ 
      isA<SMSUpdateWords>(),
      isA<SMSUpdateWords>(),
      isA<SMSUpdateWords>() 
    ],
    
    verify: ( bloc ){
      expect( (bloc.state as SMSUpdateWords).newWords![0].count, 1 );
      expect( (bloc.state as SMSUpdateWords).newWords![0].point, 4 );
      expect( (bloc.state as SMSUpdateWords).newWords![0].word, "word" );

      expect( (bloc.state as SMSUpdateWords).newWords![1].count, 0 );
      expect( (bloc.state as SMSUpdateWords).newWords![1].point, 4 );
      expect( (bloc.state as SMSUpdateWords).newWords![1].word, "word" );

      expect( (bloc.state as SMSUpdateWords).newWords![2].count, 0 );
      expect( (bloc.state as SMSUpdateWords).newWords![2].point, 3 );
      expect( (bloc.state as SMSUpdateWords).newWords![2].word, "and" );
    },
  );

  blocTest( "7 StateManager test - go to list page and test it's data",
    build: () => StateManagerBloc(),
    
    act: ( bloc ){
      bloc.add( const SMEAddedNewWord("and")  );
      bloc.add( const SMEAddedNewWord("word") );
      bloc.add( const SMEAddedNewWord("word") );
      bloc.add( const SMEGoToListPage()       );
    },
    
    expect: () => [ 
      isA<SMSUpdateWords>(),
      isA<SMSUpdateWords>(),
      isA<SMSUpdateWords>(),
      isA<SMSGoToListPage>()
    ],
    
    verify: ( bloc ){
      if( bloc.state is SMSGoToListPage ){
        expect( (bloc.state as SMSGoToListPage).rankList![0].count, 0 );
        expect( (bloc.state as SMSGoToListPage).rankList![0].point, 4 );
        expect( (bloc.state as SMSGoToListPage).rankList![0].word, "word" );

        expect( (bloc.state as SMSGoToListPage).rankList![1].count, 1 );
        expect( (bloc.state as SMSGoToListPage).rankList![1].point, 4 );
        expect( (bloc.state as SMSGoToListPage).rankList![1].word, "word" );

        expect( (bloc.state as SMSGoToListPage).rankList![2].count, 0 );
        expect( (bloc.state as SMSGoToListPage).rankList![2].point, 3 );
        expect( (bloc.state as SMSGoToListPage).rankList![2].word, "and" );
      }
    },
  );
  
}
