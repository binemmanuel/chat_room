import 'package:flutter/material.dart';
import 'package:frontend/src/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService())
      ],
      child: const App(),
    ),
  );
}
