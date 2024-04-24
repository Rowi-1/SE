import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Greeting App'),
        ),
        body: GreetingScreen(),
      ),
    );
  }
}

class GreetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hello! What is your name?',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          GreetingInput(),
        ],
      ),
    );
  }
}

class GreetingInput extends StatefulWidget {
  @override
  _GreetingInputState createState() => _GreetingInputState();
}

class _GreetingInputState extends State<GreetingInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Enter your name',
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
