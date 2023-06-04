import 'package:flutter/material.dart';
import 'package:frontend/src/models/fake_user.dart';

class AuthService extends ChangeNotifier {
  final _loggedInUser = FakeUser(
    id: '1',
    username: 'John Doe',
  );

  FakeUser get loggedInUser => _loggedInUser;
}
