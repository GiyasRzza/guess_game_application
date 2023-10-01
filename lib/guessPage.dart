import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guess_lesson_application/resultPage.dart';



class GuessPage extends StatefulWidget {
  const GuessPage({super.key});

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
   var tfGuess = TextEditingController();
   int right = 5;
   int randomNumber = 0;
   String orientation ="";

    @override
  void initState() {
    super.initState();
    randomNumber =Random().nextInt(101);
    print("Random Number: $randomNumber");
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,

          title: const Center(child: Text("Guess Page")),
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Text("Your remaining right  $right",style: const TextStyle(
                  color: Colors.red,fontSize: 30
              ),
              ),
               Text("HELP:  $orientation",style: const TextStyle(
                  color: Colors.black54,fontSize: 24
              ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                      controller: tfGuess,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        label:  Text("Guess"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                        )
                      ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),
                  onPressed:() {
                      setState(() {
                        right--;
                      });
                      int userGuess = int.parse(tfGuess.text);
                      if(userGuess==randomNumber){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  ResultPage(result: true,),));
                        return;
                      }
                      if(userGuess > randomNumber){
                        setState(() {
                          orientation ="Reduce estimate";
                        });
                      }

                      if(userGuess < randomNumber){
                        setState(() {
                          orientation ="Increase estimate";
                        });
                      }
                      if(right==0){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  ResultPage(result:false),));
                      }

                        tfGuess.text="";
                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ResultPage(),));
                  },
                  child: const Text("Guess ",
                    style: TextStyle(fontSize: 18.0,
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
