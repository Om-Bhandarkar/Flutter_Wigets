import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _controller = ScrollController();
  void _scrollToBottom() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: const Duration(seconds: 5),
      curve: Curves.easeOut,
    );
  }

  void _scrollToTop() {
    _controller.animateTo(
      _controller.position.minScrollExtent,
      duration: const Duration(seconds: 5),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("ScrollView Widget"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _scrollToBottom,
            child: const Text("Scroll to Bottom"),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                controller: _controller,
                child: Column(
                  children: List.generate(
                    50,
                    (index) => Container(
                      width: 300,
                      height: 200,
                      color: Colors.amber,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Center(child: Text("Index ${index + 1}")),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _scrollToTop,
            child: const Text("Scroll to Top"),
          ),
        ],
      ),
    );
  }
}
