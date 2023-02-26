import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_set_state_sample/domain/providers/counter_provider.dart';
import 'package:provider_set_state_sample/ui/pages/my_home_page.dart';

class MySecondPage extends StatelessWidget {
  const MySecondPage({super.key, required this.title});

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
            const Text('You have pushed the button this many times :'),
            Text(
              counterProvider.counter.toString(),
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
          onPressed: counterProvider.decrement,
          tooltip: 'Decrement',
          backgroundColor: Colors.red,
          child: const Icon(Icons.indeterminate_check_box)),
    );
  }
}
