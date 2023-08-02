import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoga/controller/lessons_controler.dart';
import 'package:yoga/controller/programs_controller.dart';
import 'package:yoga/widgets/yoga_card.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var programjson;
  var eventjson;
  var lessonjson;
  var loading = true;

  Future readJsonprogram() async {
    var response = await rootBundle.loadString("assets/json/programs.json");
    var data = json.decode(response);

    setState(() {
      programjson = data;
    });
    print(programjson);
  }

  Future readJsonevent() async {
    var response1 = await rootBundle.loadString("assets/json/events.json");
    var data1 = json.decode(response1);

    setState(() {
      eventjson = data1;
    });
    print(eventjson);
  }

  Future readJsonlesson() async {
    var response2 = await rootBundle.loadString("assets/json/lesson.json");
    var data2 = json.decode(response2);

    setState(() {
      lessonjson = data2;
    });
    print(lessonjson);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
    readJsonprogram().whenComplete(() => readJsonevent()
        .whenComplete(() => readJsonlesson().whenComplete(() => setState(() {
              loading = false;
            }))));
    // readJsonevent();
    // readJsonlesson();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(3, 10, 3, 10),
        child: loading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Hello, Priya!",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text("what do you wanna learn today?"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 18),
                      Container(
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blue, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset("assets/images/Book-mark.png"),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Programs",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset("assets/images/help-circle.png"),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Get help",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 18),
                      Container(
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blue, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset("assets/images/Book-open.png"),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Learn",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset("assets/images/trello.png"),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "DD Tracker",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Programs for you",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Spacer(),
                      Text("View all"),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_right_alt_outlined),
                      SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .35,
                        width: MediaQuery.of(context).size.width * .89,
                        child: FutureBuilder(
                            future: ProgramsController().getPrograms(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                var items = snapshot.data["items"] as List;
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: items.length,
                                  shrinkWrap: true,
                                  itemBuilder: ((context, index) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 28,
                                        ),
                                        YogaWidget(
                                            programjson["program"][index]
                                                ["image"],
                                            items[index]["category"],
                                            items[index]["name"],
                                            "${items[index]["lesson"]} lessons",
                                            0),
                                      ],
                                    );
                                  }),
                                );
                              }
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Events and Experience",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Spacer(),
                      Text("View all"),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_right_alt_outlined),
                      SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .35,
                        width: MediaQuery.of(context).size.width * .89,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 28,
                                  ),
                                  YogaWidget(
                                      eventjson["events"][index]["image"],
                                      eventjson["events"][index]["title"],
                                      eventjson["events"][index]["course"],
                                      eventjson["events"][index]["session"],
                                      1),
                                ],
                              );
                            })),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Lessons for you",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Spacer(),
                      Text("View all"),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_right_alt_outlined),
                      SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .35,
                        width: MediaQuery.of(context).size.width * .89,
                        child: FutureBuilder(
                            future: LessonsController().getLessons(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                var items = snapshot.data["items"] as List;

                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: items.length,
                                    shrinkWrap: true,
                                    itemBuilder: ((context, index) {
                                      return Column(
                                        children: [
                                          SizedBox(
                                            height: 28,
                                          ),
                                          YogaWidget(
                                            lessonjson["lesson"][index]
                                                ["image"],
                                            items[index]["category"],
                                            items[index]["name"],
                                            "${items[index]["duration"]} hours",
                                            2,
                                            lock: items[index]['locked'],
                                          ),
                                        ],
                                      );
                                    }));
                              }
                            }),
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
