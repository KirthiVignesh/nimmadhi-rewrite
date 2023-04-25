import 'package:nimmadhi/pages/emotions/Anxiety/eulogy.dart';
import 'package:nimmadhi/pages/emotions/Anxiety/regret_letter.dart';
import 'package:nimmadhi/pages/emotions/Anxiety/thought_journal.dart';
import 'package:flutter/material.dart';

class AwarenessSteps extends StatefulWidget {
  AwarenessSteps({Key? key}) : super(key: key);

  @override
  State<AwarenessSteps> createState() => _AwarenessStepsState();
}

class _AwarenessStepsState extends State<AwarenessSteps> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Self Awareness",
              style: TextStyle(fontSize: 26),
            ),
            backgroundColor: Colors.deepPurple,
          ),
          body: Column(
            children: [
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Scrollbar(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    // child: TabBar(
                    // minWidth: 120.0,
                    // fontSize: 14,
                    // cornerRadius: 7.0,
                    // customWidths: _customWidhts,
                    // activeBgColors: _activebgcolors,
                    // activeFgColor: Colors.white,
                    // inactiveBgColor: Color.fromARGB(251, 251, 251, 251),
                    // inactiveFgColor: Colors.black,
                    // //initialLabelIndex: 0,
                    // //totalSwitches: 5,
                    // labels: _categories,
                    // radiusStyle: true,
                    // customTextStyles: [
                    //   TextStyle(fontSize: 11, fontWeight: FontWeight.w200)
                    // ],
                    // ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: Card(
                        elevation: 5,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        child: new InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => _pages[index],
                              ),
                            );
                          },
                          child: SizedBox(
                              height: 270,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 200,
                                      child: Stack(children: [
                                        Container(
                                          foregroundDecoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/${entries[index]}'),
                                            fit: BoxFit.fitWidth,
                                          )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      95, 0, 0, 0),
                                                  shape: BoxShape.circle),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: IconButton(
                                                  icon: Icon(
                                                    _selections[index]
                                                        ? Icons
                                                            .favorite_border_sharp
                                                        : Icons.favorite_sharp,
                                                    color: _selections[index]
                                                        ? Colors.white
                                                        : Colors.red,
                                                    size: 20,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _selections[index] =
                                                          !_selections[index];
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            14.0, 20, 0, 10),
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              steps[index],
                                              style: TextStyle(
                                                fontSize: 22,
                                              ),
                                            )),
                                      ),
                                    ),
                                  ])),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}

final List<String> entries = <String>[
  'thought_journal.gif',
  'regret_letter.gif',
  'eulogy.gif'
];

final List<String> steps = <String>[
  'Thought Journal',
  'Regret Letter',
  'Eulogy'
];

final List<bool> _selections = List.generate(steps.length, (_) => true);

final List<Widget> _pages = [ThoughtJournal(), RegretLetter(), Eulogy()];
