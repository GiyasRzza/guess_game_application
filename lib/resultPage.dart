import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  bool result;

  ResultPage({super.key, required this.result});


  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,

        title: const Center(child: Text("Your Result",style: TextStyle(
           color: Colors.black
        ),
        )
        ),
      ),
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
         Text(widget.result ? "Winn!":"Lose!",style:  TextStyle(
            color: widget.result?  Colors.green: Colors.red,
             fontSize: 25.0,
              fontWeight: FontWeight.w900
          ),
              ),
            SizedBox(
                width: 300,
                height: 300,
                child: widget.result ?  Image.asset("images/happy.png"): Image.asset("images/sad.png"),
            ),

            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed:() {
                  Navigator.pop(context);
                },
                child: const Text("Again",
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
