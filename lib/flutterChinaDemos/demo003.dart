import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('计数器'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.amberAccent,
                onPressed: _increment,
                child: Text('Increment'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
              Text('count: $_counter'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CounterIncrementor(
                onPressed: _increment,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
              CounterDisplay(
                count: _counter,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  final int count;

  CounterDisplay({this.count});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Count: $count',
      style: TextStyle(
          color: Colors.blueAccent, textBaseline: TextBaseline.ideographic),
    );
  }
}

class CounterIncrementor extends StatelessWidget {
  final VoidCallback onPressed;

  CounterIncrementor({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueAccent,
      onPressed: onPressed,
      child: Text('Increment'),
    );
  }
}
