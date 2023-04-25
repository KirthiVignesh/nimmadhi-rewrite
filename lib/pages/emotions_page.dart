// ignore_for_file: prefer_const_constructors, unnecessary_const, unnecessary_new
import 'package:nimmadhi/utils/constants.dart';
import 'package:flutter/material.dart';

class EmotionsPage extends StatefulWidget {
  EmotionsPage({Key? key}) : super(key: key);

  @override
  State<EmotionsPage> createState() => _EmotionsPageState();
}

class _EmotionsPageState extends State<EmotionsPage> {
  final titleStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.w200);
  final subTitleStyle = const TextStyle(
    fontSize: 12,
    fontFamily: 'Roboto Thin',
    color: Color.fromRGBO(66, 66, 66, 1),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 3,
          child: Column(children: [
            TabBar(labelStyle: TextStyle(fontSize: 22), tabs: [
              Tab(text: 'Anger'),
              Tab(text: 'Anxiety'),
              Tab(text: 'Sadness')
            ]),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Scrollbar(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: entries1.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              child: Card(
                                elevation: 10,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                // ignore: unnecessary_new
                                child: new InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => pages1[index],
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                      height: 270,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 200,
                                              child: Stack(children: [
                                                Container(
                                                  foregroundDecoration:
                                                      BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/${entries1[index]}'),
                                                    fit: BoxFit.fitWidth,
                                                  )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      height: 35,
                                                      width: 35,
                                                      decoration:
                                                          const BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(95,
                                                                      0, 0, 0),
                                                              shape: BoxShape
                                                                  .circle),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 10.0),
                                                        child: IconButton(
                                                          icon: Icon(
                                                            angerselections[
                                                                    index]
                                                                ? Icons
                                                                    .favorite_border_sharp
                                                                : Icons
                                                                    .favorite_sharp,
                                                            color:
                                                                angerselections[
                                                                        index]
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .red,
                                                            size: 20,
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              angerselections[
                                                                      index] =
                                                                  !angerselections[
                                                                      index];
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        14.0, 20, 0, 10),
                                                child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      anger[index],
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
                  ),
                  Column(
                    children: [
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Scrollbar(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: entries2.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              child: Card(
                                elevation: 10,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                child: new InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => pages2[index],
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                      height: 270,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 200,
                                              child: Stack(children: [
                                                Container(
                                                  foregroundDecoration:
                                                      BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/${entries2[index]}'),
                                                    fit: BoxFit.fitWidth,
                                                  )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      height: 35,
                                                      width: 35,
                                                      decoration:
                                                          const BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(95,
                                                                      0, 0, 0),
                                                              shape: BoxShape
                                                                  .circle),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 10.0),
                                                        child: IconButton(
                                                          icon: Icon(
                                                            anxietyselections[
                                                                    index]
                                                                ? Icons
                                                                    .favorite_border_sharp
                                                                : Icons
                                                                    .favorite_sharp,
                                                            color:
                                                                anxietyselections[
                                                                        index]
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .red,
                                                            size: 20,
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              anxietyselections[
                                                                      index] =
                                                                  !anxietyselections[
                                                                      index];
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        14.0, 20, 0, 10),
                                                child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      anxiety[index],
                                                      style: TextStyle(
                                                          fontSize: 22),
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
                  ),
                  Column(
                    children: [
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Scrollbar(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: entries3.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              child: Card(
                                elevation: 10,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                child: new InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => pages3[index],
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                      height: 270,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 200,
                                              child: Stack(children: [
                                                Container(
                                                  foregroundDecoration:
                                                      BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/${entries3[index]}'),
                                                    fit: BoxFit.fitWidth,
                                                  )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      height: 35,
                                                      width: 35,
                                                      decoration:
                                                          const BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(95,
                                                                      0, 0, 0),
                                                              shape: BoxShape
                                                                  .circle),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 10.0),
                                                        child: IconButton(
                                                          icon: Icon(
                                                            sadselections[index]
                                                                ? Icons
                                                                    .favorite_border_sharp
                                                                : Icons
                                                                    .favorite_sharp,
                                                            color:
                                                                sadselections[
                                                                        index]
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .red,
                                                            size: 20,
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              sadselections[
                                                                      index] =
                                                                  !sadselections[
                                                                      index];
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        14.0, 20, 0, 10),
                                                child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      sad[index],
                                                      style: TextStyle(
                                                          fontSize: 22),
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
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
