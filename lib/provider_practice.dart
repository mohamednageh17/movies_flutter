import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    var counter = context.read<Counter>();
                    counter.decrement();
                  },
                  child: const Text("decrement")),
              Consumer<Counter>(
                builder: (context, counter, child) =>
                    Text(counter.value.toString()),
              ),
              ElevatedButton(
                  onPressed: () {
                    var counter = context.read<Counter>();
                    counter.increment();
                  },
                  child: const Text("increment")),
            ],
          ),
          myCustomText()
        ],
      ),
    );
  }
}

Widget myCustomText() {
  return Consumer<Counter>(builder: (context, counter, child) {
    return counter.value > 0
        ? Text('the text changed to ${counter.value}')
        : const Text("no changes");
  });
}

class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    if (value < 20) {
      value += 1;
    }
    notifyListeners();
  }

  void decrement() {
    if (value > 0) {
      value -= 1;
    }
    notifyListeners();
  }
}
