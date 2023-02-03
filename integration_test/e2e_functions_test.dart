import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';

import 'package:otp_test/main.dart';
import 'package:otp_test/pages/input_page/parts/feeback_line.dart';
import 'package:otp_test/pages/input_page/parts/input_button.dart';
import 'package:otp_test/pages/input_page/parts/input_field.dart';
import 'package:otp_test/pages/list_page/parts/highest_score_line.dart';

//flutter test --coverage
//flutter test -d windows --update-goldens integration_test/e2e_functions_test.dart 
void main() {

  //group('Start end-to-end functions test', () {
    var binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    
    testWidgets( 
      '1 E2E - open app', 
      ( WidgetTester tester ) async {
        //await tester.setScreenSize(width: 800, height: 600);

        await tester.pumpWidget( const MyApp() );
        await waitForAction( tester );
        await createGoldenFile( binding, "1_input_page");
      }
    );

    testWidgets( 
      '2 E2E - try add empthy word', 
      ( WidgetTester tester ) async {
        //await tester.setScreenSize(width: 800, height: 600);

        await tester.pumpWidget( const MyApp() );
        await waitForAction( tester );

        expect( find.text("Enter"), findsOneWidget );
        expect( find.text("Input new word"), findsOneWidget );
        
        final Finder enterButton = find.byType( InputButton );
        
        await tester.tap(enterButton);
        await waitForAction( tester );
        await tester.pumpAndSettle();
        
        expect( find.text("A word is required"), findsOneWidget );
        
        await createGoldenFile( binding, "2_input_page_missing_word" );
      }
    );

    testWidgets( 
      '3 E2E - add not valid english word', 
      ( WidgetTester tester ) async {
        //await tester.setScreenSize(width: 800, height: 600);

        await tester.pumpWidget( const MyApp() );
        await waitForAction( tester );

        expect( find.text("Enter"), findsOneWidget );
        expect( find.text("Input new word"), findsOneWidget );

        final Finder inputText = find.byType( InputField );
        await tester.enterText(inputText,"cetli");

        final Finder enterButton = find.byType( InputButton );
        await tester.tap(enterButton);
        await waitForAction( tester );

        await tester.pumpAndSettle();
        await waitForAction( tester );
        
        expect( find.text("Enter a real english word"), findsOneWidget );
        
        await createGoldenFile( binding, "3_input_page_not_valid_english_word" );
      }
    );

    testWidgets( 
      '4 E2E - try to add non english alphabetic character', 
      ( WidgetTester tester ) async {
        //await tester.setScreenSize(width: 800, height: 600);

        await tester.pumpWidget( const MyApp() );
        await waitForAction( tester );

        expect( find.text("Enter"), findsOneWidget );
        expect( find.text("Input new word"), findsOneWidget );

        final Finder inputText = find.byType( InputField );
        await tester.enterText( inputText, "áá" );

        final Finder enterButton = find.byType( InputButton );
        await tester.tap(enterButton);

        await waitForAction( tester );

        await tester.pumpAndSettle();

        await waitForAction( tester );
        
        expect( find.text("Only allow letters from the english alphabet"), findsOneWidget );
        
        await createGoldenFile( binding, "4_input_page_not_valid_english_character" );
      }
    );

    testWidgets( 
      '5 E2E - add valid english word', 
      ( WidgetTester tester ) async {
        //await tester.setScreenSize(width: 800, height: 600);

        await tester.pumpWidget( const MyApp() );
        await waitForAction( tester );

        expect( find.text("Enter"), findsOneWidget );
        expect( find.text("Input new word"), findsOneWidget );
        expect( find.byType( FeedbackLine ), findsOneWidget );

        final Finder inputText = find.byType( InputField );
        await tester.enterText(inputText,"word");

        final Finder enterButton = find.byType( InputButton );
        await tester.tap(enterButton);

        await waitForAction( tester );

        await tester.pumpAndSettle();
        
        final Finder feedBackLine = find.widgetWithText( FeedbackLine, "word" );
        expect( feedBackLine, findsOneWidget );
        
        await createGoldenFile( binding, "5_input_page_add_valid_english_word" );
      }
    );

    testWidgets( 
      '6 E2E - test duplicated word marker', 
      ( WidgetTester tester ) async {
        //await tester.setScreenSize(width: 800, height: 600);

        await tester.pumpWidget( const MyApp() );
        await waitForAction( tester );

        expect( find.text("Enter"), findsOneWidget );
        expect( find.text("Input new word"), findsOneWidget );
        expect( find.byType( FeedbackLine ), findsOneWidget );

        final Finder inputText   = find.byType( InputField );
        final Finder enterButton = find.byType( InputButton );

        final List<String> newWords = [ "word", "letter", "word" ];
        
        for( var it in newWords){
          await tester.enterText(inputText, it );
          await tester.tap(enterButton);
          await tester.pumpAndSettle();
        }
        
        await waitForAction( tester );
        await tester.pumpAndSettle();
        
        final Finder feedBackLine = find.byType( FeedbackLine );
        expect( feedBackLine, findsOneWidget );
        
        await createGoldenFile( binding, "6_input_page_duplicated_marker_test" );
      }
    );
    
    testWidgets( 
      '7 E2E - go to list view page and test data', 
      ( WidgetTester tester ) async {
        //await tester.setScreenSize(width: 800, height: 600);

        await tester.pumpWidget( const MyApp() );
        await waitForAction( tester );

        expect( find.text("Enter"), findsOneWidget );
        expect( find.text("Input new word"), findsOneWidget );
        expect( find.byType( FeedbackLine ), findsOneWidget );

        final Finder inputText   = find.byType( InputField );
        final Finder enterButton = find.byType( InputButton );

        final List<String> newWords = [ "word", "letter", "and" ];
        
        for( var it in newWords){
          await tester.enterText(inputText, it );
          await tester.tap(enterButton);
          await tester.pumpAndSettle();
        }

        createGoldenFile( binding, "7_1_input_page_with_test_data" );

        final Finder fab = find.byIcon( Icons.list_rounded );
        await tester.tap(fab);
        await tester.pumpAndSettle();
        await waitForAction( tester );

        final Finder scoreDataLine = find.byType( HighestScoreLine );
        expect( scoreDataLine, findsOneWidget );

        final Finder scoreData = find.text( '6' );
        expect( scoreData, findsWidgets );
        
        await waitForAction( tester );

        createGoldenFile( binding, "7_2_go_to_list_page_with_data_test" );
      }
    );
    testWidgets( 
      '8 E2E - go to back to input page', 
      ( WidgetTester tester ) async {
        //await tester.setScreenSize(width: 800, height: 600);

        await tester.pumpWidget( const MyApp() );
        await waitForAction( tester );

        expect( find.text("Enter"), findsOneWidget );
        expect( find.text("Input new word"), findsOneWidget );
        expect( find.byType( FeedbackLine ), findsOneWidget );

        final Finder fabOnInput = find.byIcon( Icons.list_rounded );
        await tester.tap(fabOnInput);
        await tester.pumpAndSettle();

        createGoldenFile( binding, "8_1_go_to_list_page" );

        await waitForAction( tester );

        final Finder fabOnList = find.byIcon( Icons.woo_commerce_rounded );
        await tester.tap(fabOnList);
        await tester.pumpAndSettle();
        
        createGoldenFile( binding, "8_2_back_to_input_page" );
      }
    );

  //});

}

Future<void> waitForAction( WidgetTester tester, {int duration = 2000} ) async {
  await tester.pumpAndSettle( Duration(milliseconds: duration), EnginePhase.sendSemanticsUpdate, const Duration( minutes: 10 ) );
}

Future<void> createGoldenFile( IntegrationTestWidgetsFlutterBinding binding, String name ) async {
  
  if(Platform.isAndroid) {
    await binding.takeScreenshot(name);
    await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_shots/$name.png'));
    if( kDebugMode ){
      print("created golden file: $name.png - droid");
    }
  }

  if(Platform.isWindows) {
    await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/$name.png'));
    if( kDebugMode ){
      print("created golden file: $name.png - windows");
    }
  }

}

extension SetScreenSize on WidgetTester {
  Future<void> setScreenSize({
    double width = 540,
    double height = 960,
    double pixelDensity = 1
  }) 
  async {
    final size = Size(width, height);
    await binding.setSurfaceSize(size);
    binding.window.physicalSizeTestValue = size;
    binding.window.devicePixelRatioTestValue = pixelDensity;
  }
}
