import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'language_selection_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
options: const FirebaseOptions(
  apiKey: 'AIzaSyBT8kho5MugH5MLMlnQ6V3HZ6eVyCs6KL8',
  appId: '1:146110729177:android:9ff2425adee5eb01cf67c8',
  messagingSenderId: '146110729177',
  projectId: 'multi-step-form-ad3e5',
  storageBucket: 'multi-step-form-ad3e5.appspot.com', // NOTE: corrected .app to .com
)


  ); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Step Form',
      locale: _locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      
      
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
        Locale('bn'),
        Locale('mr'),
        Locale('te'),
        Locale('ta'),
      ],
      home: LanguageSelectionScreen(onLocaleChange: setLocale),
      
    );
  }
  
}
