import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cookie_controller.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cursor_controller.dart';
import 'package:flutter_flame_cookie_clicker/cookie_clicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        floatingActionButton: FloatingActionButton(
          onPressed: useProvider(canBuyCursorProvider).state
              ? () {
                  context.read(cursorProvider.notifier).buyCursor();
                }
              : null,
          child: Text(
            useProvider(cursorProvider).nextCost.round().toString(),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                '${useProvider(cookieProvider).bakeCount} cookies',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
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
