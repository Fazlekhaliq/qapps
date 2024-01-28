
import 'package:flutter/material.dart';
import 'package:qapps/qz_brain.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(


        children: <Widget>[
          Expanded(
            flex: 5,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  height: 230 ,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 12,
                        spreadRadius: 2,
                      )
                    ]
                  ),
                  child: Text(
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  //The user picked true.
                  //check correct answer
                  if (quizBrain.getQuestionAnswer() == true) {
                    print('correct answer');
                    scoreKeeper.add(
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    print('wrong answer');
                    scoreKeeper.add(
                      const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  //Update Question and rebuild UI
                  quizBrain.nextQuestion();
                  setState(() {});
                },
                child: Container(
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  //The user picked false.

                  if (quizBrain.getQuestionAnswer() == false) {
                    print('correct answer');
                    scoreKeeper.add(
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    print('incorrect answer');
                    scoreKeeper.add(
                      const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }

                  quizBrain.nextQuestion();
                  setState(() {});
                },
                child: Container(
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

         Row(
           children:scoreKeeper,
         )
        ],
      ),
    );
  }
}