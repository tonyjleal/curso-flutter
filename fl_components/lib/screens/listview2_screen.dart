import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  const ListView2Screen({Key? key}) : super(key: key);

  final options = const [
    'Meagaman',
    'Metal Gear',
    'Super Smash',
    'Final Fantasy'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Tipo 2'),
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(options[index]),
          trailing:
              const Icon(Icons.keyboard_arrow_right, color: AppTheme.primary),
          onTap: () {
            final game = options[index];
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
