import 'package:flutter/material.dart';
import 'stream_irfan.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  late Stream<int> numberStream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream - Irfan | 2241720230'),
      ),
      body: StreamBuilder(
          stream: numberStream,
          initialData: 0,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('Error!');
            }
            if (snapshot.hasData) {
              return Center(
                  child: Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 96),
              ));
            } else {
              return const SizedBox.shrink();
            }
          }),
    );
  }

  @override
  void initState() {
    numberStream = NumberStream().getNumbers();
    super.initState();
  }
}
