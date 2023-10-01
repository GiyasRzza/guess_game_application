import 'package:flutter/material.dart';
import 'package:guess_lesson_application/guessPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guess Number',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,

        title: Center(child: Text(widget.title,style: const TextStyle(
          color: Colors.black
        ),
        )
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           const Text("Guessing Game",style: TextStyle(
              color: Colors.black54,fontSize: 36
               ),
            ),
            Image.asset("images/dice.png"),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed:() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const GuessPage(),));
                  },
                  child: const Text("Play",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                    ),
                  ),

              ),
            )
          ],
        ),
      ),

    );
  }
}
