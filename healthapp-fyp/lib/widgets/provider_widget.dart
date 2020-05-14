import 'package:TMW/services/auth_service.dart';
import 'package:flutter/material.dart';

class Provider2 extends InheritedWidget {
  final AuthService auth;

  Provider2({Key key, Widget child, this.auth}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider2 of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<Provider2>());
}