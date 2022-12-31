import 'package:flutter/material.dart';

import 'package:animated_countdown/animated_countdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countdown Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Countdown Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _displayCountDown = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Stack(
        children: [
          if (_displayCountDown)
            Positioned.fill(
              child: Center(
                child: CountDownWidget(
                  totalDuration: 3,
                  maxTextSize: 100,
                  onEnd: () {
                    setState(() {
                      _displayCountDown = false;
                    });
                  },
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
            )
        ],
      ),
      floatingActionButton: _displayCountDown
          ? null
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  _displayCountDown = true;
                });
              },
              tooltip: 'Start',
              child: const Icon(Icons.play_arrow_rounded),
            ),
    );
  }
}
