import 'package:flutter/material.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cursor_controller.dart';
import 'package:flutter_flame_cookie_clicker/gen/assets.gen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CursorStoreTile extends HookWidget {
  const CursorStoreTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final canBuy = useProvider(canBuyCursorProvider).state;

    return ListTile(
      tileColor: canBuy
          ? ListTileTheme.of(context).tileColor
          : Theme.of(context).disabledColor,
      leading: Assets.images.cursor.image(),
      title: Text(
        'Cursor',
        style: TextStyle(fontSize: 24),
      ),
      subtitle: Text(
        useProvider(cursorProvider).nextCost.toString(),
      ),
      trailing: Text(
        useProvider(cursorProvider).count.toString(),
        style: TextStyle(fontSize: 24),
      ),
      onTap: canBuy
          ? () {
              context.read(cursorProvider.notifier).buyCursor();
            }
          : null,
    );
  }
}
