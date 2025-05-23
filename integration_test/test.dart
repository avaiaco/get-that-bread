import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:get_that_bread/flutter_flow/flutter_flow_icon_button.dart';
import 'package:get_that_bread/flutter_flow/flutter_flow_widgets.dart';
import 'package:get_that_bread/flutter_flow/flutter_flow_theme.dart';
import 'package:get_that_bread/index.dart';
import 'package:get_that_bread/main.dart';
import 'package:get_that_bread/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:get_that_bread/backend/firebase/firebase_config.dart';
import 'package:get_that_bread/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('US1 Account Creation Test', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: LoginWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 10000));
    await tester.tap(find.byKey(const ValueKey('Tab_mxm0')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('Tab_mxm0')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('emailAddress_Create_knye')),
        'meowcat1234@gmail.com');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('username_Create_woxo')), 'Meowcifer');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('password_Create_im95')), 'MeowMeowMeow');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('passwordConfirm_rl93')), 'MeowMeowMeow');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('Button_uecx')));
    await tester.pumpAndSettle(const Duration(milliseconds: 10000));
    expect(find.byKey(const ValueKey('ProfileCreation_2tm6')), findsOneWidget);
  });

  testWidgets('US2 Account Login', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: LoginWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 6000));
    await tester.enterText(
        find.byKey(const ValueKey('Email_otuq')), 'testAccount@email.com');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(const ValueKey('password_3sje')), 'password');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.tap(find.byKey(const ValueKey('Button_khu9')));
    await tester.pumpAndSettle(const Duration(milliseconds: 6000));
    expect(find.byKey(const ValueKey('Button_xzyy')), findsOneWidget);
  });

  testWidgets('US3 Backend Services', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: LoginWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 8000));
    await tester.enterText(
        find.byKey(const ValueKey('Email_otuq')), 'testuser69420@gmail.com');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 2000));
    await tester.enterText(
        find.byKey(const ValueKey('password_3sje')), 'Payolaaa');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 2000));
    await tester.tap(find.byKey(const ValueKey('Button_khu9')));
    await tester.pumpAndSettle(const Duration(milliseconds: 8000));
    expect(find.byKey(const ValueKey('Container_2wn6')), findsOneWidget);
  });

  testWidgets('US4 Golden Path Receipt Scanner and  Collection',
      (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'nickp123@gmail.com', password: '123456789');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: ReceiptsWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 10000));
    await tester.tap(find.byKey(const ValueKey('DeleteButton_zunb')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    expect(find.byKey(const ValueKey('DeleteButton_zunb')), findsNothing);
  });

  testWidgets('US5 Breadbot', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'meowcat12@gmail.com', password: 'MeowMeowMeow');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: BreadbotWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 10000));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('ChatPrompt_z13u')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(const ValueKey('ChatPrompt_z13u')), 'How are you?');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('IconButton_x0vf')));
    await tester.pumpAndSettle(const Duration(milliseconds: 10000));
    expect(find.byKey(const ValueKey('Greeting_ccsp')), findsOneWidget);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
