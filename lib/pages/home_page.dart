// import 'package:nimmadhi/pages/chat_bot.dart';
// ignore_for_file: use_build_context_synchronously

import 'package:nimmadhi/pages/emotions/Anger/cognitive_reappraisal.dart';
import 'package:nimmadhi/pages/emotions/Anger/cognitive_restructuring.dart';
import 'package:nimmadhi/pages/emotions/Anxiety/being_mindful.dart';
import 'package:nimmadhi/pages/emotions/Sad/emotional_support.dart';
import 'package:nimmadhi/streamer/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nimmadhi/quiz/screens/quiz/welcome_screen.dart';

import '../quiz/screens/quiz/welcome_screen2.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState;
    _getUserDetails();
  }

  final user = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic>? _userDetails;
  Future<void> _getUserDetails() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((value) {
      setState(() {
        _userDetails = value.data();
      });
    });
  }

  final _summaryController = TextEditingController();

  void ask() async {
    var result = "";
    const url = "https://nimmadhi-assistant.onrender.com/ask";
    Map data = {"summary": _summaryController.text};
    var body = json.encode(data);
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    result = response.body;
    print(result);
    if (result == 'cognitive-reappraisal') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CognitiveReappraisal()));
    } else if (result == 'cognitive-restructuring') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CognitiveRestructuring()));
    } else if (result == 'all-or-nothing') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EmotionalSupport()));
    } else if (result == 'overgeneralization') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BeingMindful()));
    } else {
      // print('executed');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: Text('Move to the emotions page.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.of(context)
        //         .push(MaterialPageRoute(builder: (context) => Chatbot()));
        //   },
        //   child: const Icon(Icons.chat_rounded),
        // ),
        body: SafeArea(
      child: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //   image: AssetImage("images/bg.png"),
        //   fit: BoxFit.cover,
        // )),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              SizedBox(height: 40),
              // SizedBox(height: 10),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Container(
              //     height: 40,
              //     width: 110,
              //     color: Colors.white,
              //   ),
              // ),
              Text(
                'Welcome!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                _userDetails?['first_name'] == null
                    ? "User 👋"
                    : "${_userDetails?['first_name']} 👋",
                style: TextStyle(fontSize: 36),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                elevation: 5,
                child: Container(
                  color: Colors.deepPurple[100],
                  height: 220,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\"The way I see it, if you want the rainbow, you gotta put up with the rain.\"',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 22,
                                color: Colors.deepPurple[900]),
                          ),
                          Text(
                            '\n-Dolly Parton',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple[900]),
                          ),
                        ]),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Describe your current mood",
                  style: TextStyle(
                    fontSize: 28,
                  )),
              TextField(
                controller: _summaryController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.indigo),
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Describe your day',
                    filled: true),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                  child: Text("Redirect page"),

                  // Sicon: const Icon(Icons.send_rounded),
                  onPressed: ask,
                ),
              ),
              // Text(result),
              SizedBox(height: 20),
              Text("Evaluate yourself ✅",
                  style: TextStyle(
                    fontSize: 28,
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        // height: 50,
                        // width: 125,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                settings: RouteSettings(name: "/WelcomeScreen"),
                                builder: (context) => WelcomeScreen(),
                              ));
                            },
                            child: Text(
                              'Anxiety Test',
                              style: TextStyle(fontSize: 15),
                            )),
                      ),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      // height: 50,
                      // width: 125,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              settings: RouteSettings(name: "/WelcomeScreen2"),
                              builder: (context) => WelcomeScreen2(),
                            ));
                          },
                          child: Text(
                            'Stress Test',
                            style: TextStyle(fontSize: 15),
                          )),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Text('Videos 🎭',
                  style: TextStyle(
                    fontSize: 28,
                  )),
              SizedBox(height: 20),
              SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Player(
                                  video: videos[index],
                                );
                              },
                            ));
                          },
                          child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context).splashColor,
                              ),
                              child: Center(
                                  child: Text(
                                "${videos[index]}",
                                style: TextStyle(fontSize: 25),
                              ))),
                        ),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    ));
  }

  final List<String> videos = ["relaxation", "mindfulness"];
}
