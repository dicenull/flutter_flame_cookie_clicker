import 'package:flutter/material.dart';
import 'package:flutter_flame_cookie_clicker/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(
    child: App(),
  ));
}
