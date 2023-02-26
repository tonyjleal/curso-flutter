import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_set_state_sample/domain/providers/counter_provider.dart';
import 'package:provider_set_state_sample/ui/pages/my_second_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              counterProvider.counter.toString(),
              style: Theme.of(context).textTheme.displayLarge,
            ),
            ElevatedButton(
              child: const Text('Go to Decrement Screen'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MySecondPage(
                      title: 'My Second Page',
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterProvider.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
