import 'package:flutter/material.dart';
import 'package:quiz_for_intern/views/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List quizListData = [
    {
      "id": 1,
      "answer": "To Improve Skils",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "Why you apply for this job?",
      "options": [
        {
          "option": "a",
          "value": "To Improve Skils",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "For Money",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "For Famous",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "For Food",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 2,
      "answer": "because matro  max give greate  opportuinity to fresher",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "why matro max?",
      "options": [
        {
          "option": "a",
          "value": "because it  is big  company  ",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "because it it work from home",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "because matro  max give  opportuinity to fresher",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "because it is belong tto bangllore",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 3,
      "answer": "work hard and improve skill to get selected",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "What you do if you are not selected?",
      "options": [
        {
          "option": "a",
          "value": "Pray for company",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "Pray to company",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "work hard and improve skill to get selected",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Cry",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 4,
      "answer": "Widget",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "Everrthing in flutter is",
      "options": [
        {
          "option": "a",
          "value": "Variable",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "Class",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "Object",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "e",
          "value": "Widget",
          "color": "0xFFFFFFFF",
        }
      ],
    },
    {
      "id": 5,
      "answer": "Manoj Bajpai",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "Who is your Better actor?",
      "options": [
        {
          "option": "a",
          "value": "Salman Khan",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "Manoj Bajpai",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "Sharukh Khan",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Aamir Khan",
          "color": "0xFFFFFFFF",
        },
      ],
    },
  ];

  final _pageController = PageController(initialPage: 0);
  int questionINdex = 0;

  int userPercentage = 0;
  int wrongQ = 0;
  int ommitedQuestion = 0;
  int totalRight = 0;

  quizResult(context) {
    userPercentage = 0;
    wrongQ = 0;
    ommitedQuestion = 0;
    totalRight = 0;

    for (int i = 0; i < quizListData.length; i++) {
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 0) {
        ommitedQuestion++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 1) {
        totalRight++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 2) {
        wrongQ++;
      }
    }

    userPercentage = ((totalRight / quizListData.length) * 100).round();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            userPercentage: userPercentage,
            totalRight: totalRight,
            wrongQ: wrongQ,
            ommitedQuestion: ommitedQuestion,
          ),
        ),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF053251),
      appBar: AppBar(
        title: const Text("Quiz Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question :${questionINdex + 1}/${quizListData.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: quizListData.length,
                onPageChanged: (page) {
                  print("Current page $page");
                  setState(
                    () {
                      questionINdex = page;
                    },
                  );
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFAB40),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            quizListData[index]['title'],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      quizListData[index]
                                  ['is_answer_status_right_wrong_omitted'] ==
                              2
                          ? Text(
                              "Sorry : Right answer is -> ${quizListData[index]['answer']} ",
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 20,
                      ),
                      ...quizListData[index]['options']
                          .map(
                            (data) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: SizedBox(
                                width: double.infinity,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(
                                        int.parse(
                                          data['color'],
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (quizListData[index]['is_answered'] ==
                                          0) {
                                        setState(() {
                                          if (data['value'] ==
                                              quizListData[index]['answer']) {
                                            data['color'] = "0xFF31CD63";
                                            quizListData[index][
                                                'is_answer_status_right_wrong_omitted'] = 1;
                                          } else {
                                            data['color'] = "0xFFFF0000";
                                            quizListData[index][
                                                'is_answer_status_right_wrong_omitted'] = 2;
                                          }
                                          quizListData[index]['is_answered'] =
                                              1;
                                        });
                                      } else {}
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Color(
                                                int.parse(
                                                  data['color'],
                                                ),
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                data['option'].toUpperCase(),
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            data['value'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (questionINdex == quizListData.length - 1) {
            print("Submit ");
            quizResult(context);
          } else {
            print("ELSE PART");
            _pageController.nextPage(
              duration: const Duration(milliseconds: 5),
              curve: Curves.easeIn,
            );
          }
        },
        label:
            Text(questionINdex == quizListData.length - 1 ? "Submit" : "Next"),
      ),
    );
  }
}
