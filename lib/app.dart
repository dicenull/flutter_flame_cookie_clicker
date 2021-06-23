import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_cookie_clicker/components/cursor_store_tile.dart';
import 'package:flutter_flame_cookie_clicker/components/store_select_widget.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cookie_controller.dart';
import 'package:flutter_flame_cookie_clicker/cookie_clicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Center(
                  child: Text(
                    'Store',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              StoreSelectWidget(),
              CursorStoreTile(),
            ],
          ),
        ),
        appBar: AppBar(
          title: Center(
            child: Text(
              '${useProvider(cookieProvider).bakeCount} cookies',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
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
