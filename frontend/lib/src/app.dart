import 'package:flutter/material.dart';
import 'package:frontend/src/utils/palette.dart';

import 'chat_room.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.red,

          // App bar theme
          appBarTheme: const AppBarTheme(
            backgroundColor: Palette.backgroundColor,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),

          // Input theme
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: Palette.backgroundColor.withOpacity(0.6),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: Palette.backgroundColor.withOpacity(0.6),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                width: 2,
                color: Palette.backgroundColor,
              ),
            ),
          )),

      //
      home: const ChatRoom(),
    );
  }
}
