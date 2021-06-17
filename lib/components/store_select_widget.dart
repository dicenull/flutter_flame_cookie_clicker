import 'package:flutter/material.dart';
import 'package:flutter_flame_cookie_clicker/controllers/store_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoreSelectWidget extends HookWidget {
  const StoreSelectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            HookBuilder(builder: (_) {
              final valid = useProvider(storeProvider).isBuy;
              final theme = Theme.of(context);
              return TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      valid ? theme.accentColor : theme.disabledColor),
                ),
                onPressed: () => context.read(storeProvider.notifier).toBuy(),
                child: Text('BUY'),
              );
            }),
            HookBuilder(builder: (_) {
              final valid = useProvider(storeProvider).isSell;
              final theme = Theme.of(context);
              return TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      valid ? theme.accentColor : theme.disabledColor),
                ),
                onPressed: () => context.read(storeProvider.notifier).toSell(),
                child: Text('SELL'),
              );
            }),
          ],
        ),
        HookBuilder(builder: (_) {
          final valid = useProvider(storeProvider).isSingleBulk;
          final theme = Theme.of(context);
          return TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                  valid ? theme.accentColor : theme.disabledColor),
            ),
            onPressed: () => context.read(storeProvider.notifier).single(),
            child: Text('1'),
          );
        }),
        HookBuilder(builder: (_) {
          final valid = useProvider(storeProvider).isBulk10;
          final theme = Theme.of(context);
          return TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                  valid ? theme.accentColor : theme.disabledColor),
            ),
            onPressed: () => context.read(storeProvider.notifier).bulk10(),
            child: Text('10'),
          );
        }),
        HookBuilder(builder: (_) {
          final valid = useProvider(storeProvider).isBulk100;
          final theme = Theme.of(context);
          return TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                  valid ? theme.accentColor : theme.disabledColor),
            ),
            onPressed: () => context.read(storeProvider.notifier).bulk100(),
            child: Text('100'),
          );
        }),
        const SizedBox.shrink(),
      ],
    );
  }
}
