import 'package:flutter/material.dart';
import 'counter_actions.dart';
import 'package:tests/reactive_builder.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, required this.title});
  final String title;
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
PageCounterActions action = PageCounterActions();

  @override
  Widget build(BuildContext context) {
    print('rebuidALL');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
//////////////////// aqui a página pega e mostra valores int reativos
//                   Text('     A: ${action.getA((){
//                     setState(() {});
//                   })}'),

                  ReactiveBuilder(action: action.getA,
                    builder: (int value) {
                    return Text('     A: $value');
                    },
                  ),
                  ReactiveBuilder(action: action.getAB,
                    builder: (int value) {
                      return Text('     A+B: $value');
                    },
                  ),
                  ReactiveBuilder(action: action.getABC,
                    builder: (int value) {
                      return Text('     A+B+C: $value');
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
/////////////////aqui a página faz incrementos nas variaveis
              TextButton(onPressed:
              action.incrementABC,
                  child: const Text('A+B+C')),
              TextButton(onPressed: action.incrementBC,
                  child: const Text('B+C')),
              TextButton(onPressed: action.incrementC,
                  child: const Text('C')),
            ],),
          ],
        ),
      ),
    );
  }
}