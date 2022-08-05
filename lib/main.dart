import 'package:flutter/material.dart';

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

        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Pokemon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _score = 0;
  bool selected = false;
  String default_image = 'images/jump.png';

  void _incrementCounter() {
    setState((){
      selected = !selected;
      _score++;
    });
    // default_image = "images/jump.png";
    Image.asset(default_image);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Score:',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              '$_score',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container (
              child: AnimatedContainer(
                width: selected ? 200.0 : 300.0,
                height: selected ? 200.0 : 300.0,
                alignment:Alignment.center,
                duration: const Duration(seconds: 1),
                    child: Image.asset('images/stay.png'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _incrementCounter();
              },
              child: Text('Jump'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red, // Text Color
              ),
            ),
          ],

        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
