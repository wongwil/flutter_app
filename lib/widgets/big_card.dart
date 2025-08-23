import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});

  final String pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onSecondary,
    );

    return Card(
      color: theme.colorScheme.secondary,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Text(
          pair,
          style: style,
          textAlign: TextAlign.center,
          semanticsLabel: pair,
        ),
      ),
    );
  }
}
