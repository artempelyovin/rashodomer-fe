import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TitleText extends StatelessWidget {
  final String text;

  const TitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleLarge);
  }
}

class DescriptionText extends StatelessWidget {
  final String text;

  const DescriptionText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodyMedium);
  }
}

class PriceText extends StatelessWidget {
  final String text;

  const PriceText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.headlineSmall?.copyWith(color: Colors.green),
    );
  }
}

class CopyableId extends StatelessWidget {
  final String id;

  const CopyableId({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.copy),
      tooltip: 'Скопировать ID',
      onPressed: () async {
        await Clipboard.setData(ClipboardData(text: id));
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Скопировано: $id')));
      },
    );
  }
}
