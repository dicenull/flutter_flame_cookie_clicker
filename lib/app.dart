import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_cookie_clicker/cookie_clicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: GameWidget(
                  game: useProvider(cookieClicker),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
