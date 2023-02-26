import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/main.dart';
import 'package:riverpod_sample/ui/screens/my_home_page.dart';

class MySecondPage extends ConsumerWidget {
  const MySecondPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterProviderRef = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times :'),
            Text(
              counterProviderRef.counter.toString(),
              style: Theme.of(context).textTheme.displayLarge,
            ),
            ElevatedButton(
              child: const Text('Go to Increment Screen'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                      title: 'My Home Page',
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: counterProviderRef.decrement,
          tooltip: 'Decrement',
          backgroundColor: Colors.red,
          child: const Icon(Icons.indeterminate_check_box)),
    );
  }
}
