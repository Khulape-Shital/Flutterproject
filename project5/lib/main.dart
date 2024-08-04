import 'package:flutter/material.dart';
import 'package:project5/Assignment1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Assignment1(imgurl: "https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/m/t/7/medium-bts-poster-bts-boys-group-poster-350gsm-bts01-p-original-imagmvjvkpgxjgcu.jpeg?q=90&crop=false"),
                const Assignment1(imgurl: "https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/m/t/7/medium-bts-poster-bts-boys-group-poster-350gsm-bts01-p-original-imagmvjvkpgxjgcu.jpeg?q=90&crop=false"),
                const Assignment1(imgurl: "https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/m/t/7/medium-bts-poster-bts-boys-group-poster-350gsm-bts01-p-original-imagmvjvkpgxjgcu.jpeg?q=90&crop=false"),
                const Assignment1(imgurl: "https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/m/t/7/medium-bts-poster-bts-boys-group-poster-350gsm-bts01-p-original-imagmvjvkpgxjgcu.jpeg?q=90&crop=false"),
                const Assignment1(imgurl: "https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/m/t/7/medium-bts-poster-bts-boys-group-poster-350gsm-bts01-p-original-imagmvjvkpgxjgcu.jpeg?q=90&crop=false"),
                const Assignment1(imgurl: "https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/m/t/7/medium-bts-poster-bts-boys-group-poster-350gsm-bts01-p-original-imagmvjvkpgxjgcu.jpeg?q=90&crop=false"),
                const Assignment1(imgurl: "https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/m/t/7/medium-bts-poster-bts-boys-group-poster-350gsm-bts01-p-original-imagmvjvkpgxjgcu.jpeg?q=90&crop=false"),
                const Assignment1(imgurl: "https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/m/t/7/medium-bts-poster-bts-boys-group-poster-350gsm-bts01-p-original-imagmvjvkpgxjgcu.jpeg?q=90&crop=false"),
                const Assignment1(imgurl: "https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/m/t/7/medium-bts-poster-bts-boys-group-poster-350gsm-bts01-p-original-imagmvjvkpgxjgcu.jpeg?q=90&crop=false"),
              ],
            ),
          ),
        ),
      )
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
