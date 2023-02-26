import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// type stless to generate stateless widget from snippets

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App3',
      home: Scaffold(
        backgroundColor: Colors.red[400],
        body: SafeArea(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16.00),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              verticalDirection: VerticalDirection.down,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.white70,
                      child: const Text('item 1'),
                    ),
                    Container(
                      height: 100.0,
                      width: 100.0,
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.white70,
                      child: const Text('item 2'),
                    ),
                    Container(
                      height: 100.0,
                      width: 100.0,
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.white70,
                      child: const Text('item 3'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 100.0,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.black12,
                  child: const Text('container 1'),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 100.0,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.black12,
                  child: const Text('container 3'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
