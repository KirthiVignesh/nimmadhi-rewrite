// import 'package:health/health.dart';
import 'package:nimmadhi/pages/profile/create_profile.dart';
import 'package:nimmadhi/utils/get_scores.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserDetails();
  }

  final user = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic>? _userDetails;

  // void HealthDataExample() async {
  //   // create a HealthFactory for use in the app
  //   HealthFactory health = HealthFactory();

  //   // define the types to get
  //   var types = [
  //     HealthDataType.STEPS,
  //     HealthDataType.BLOOD_GLUCOSE,
  //   ];

  //   // requesting access to the data types before reading them
  //   bool requested = await health.requestAuthorization(types);

  //   var now = DateTime.now();

  //   // fetch health data from the last 24 hours
  //   List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
  //       now.subtract(Duration(days: 1)), now, types);

  //   // request permissions to write steps and blood glucose
  //   types = [HealthDataType.STEPS, HealthDataType.BLOOD_GLUCOSE];
  //   var permissions = [
  //     HealthDataAccess.READ_WRITE,
  //     HealthDataAccess.READ_WRITE
  //   ];
  //   await health.requestAuthorization(types, permissions: permissions);

  //   // write steps and blood glucose
  //   bool success =
  //       await health.writeHealthData(10, HealthDataType.STEPS, now, now);
  //   success = await health.writeHealthData(
  //       3.1, HealthDataType.BLOOD_GLUCOSE, now, now);

  //   // get the number of steps for today
  //   var midnight = DateTime(now.year, now.month, now.day);
  //   int? steps = await health.getTotalStepsInInterval(midnight, now);
  // }

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(FlutterRemix.logout_box_r_line),
                      onPressed: () {
                        CoolAlert.show(
                            context: context,
                            type: CoolAlertType.confirm,
                            onConfirmBtnTap: () {
                              FirebaseAuth.instance.signOut();
                              final GoogleSignIn googleSignIn =
                                  new GoogleSignIn();
                              googleSignIn.isSignedIn().then((s) {
                                googleSignIn.signOut();
                              });
                              Navigator.pop(context);
                            },
                            text: "Are you sure you want to log out");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(
                      _userDetails == null
                          ? "Hi There"
                          : "Hi ${_userDetails?['first_name']}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  )
                ],
              ),
              //pfp
              Container(
                height: 100,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    FlutterRemix.account_circle_line,
                    size: 84,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  height: 540,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            _userDetails == null
                                ? "Enter your Details"
                                : '${_userDetails?['first_name']} ${_userDetails?['last_name']}',
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(height: 10),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //       'Followers',
                          //       style: TextStyle(fontWeight: FontWeight.w600),
                          //     ),
                          //     SizedBox(width: 5),
                          //     Text('66'),
                          //     SizedBox(width: 15),
                          //     Text(
                          //       'Following',
                          //       style: TextStyle(fontWeight: FontWeight.w600),
                          //     ),
                          //     SizedBox(width: 5),
                          //     Text('42'),
                          //   ],
                          // ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(FlutterRemix.mail_line, size: 20),
                          SizedBox(width: 5),
                          Text('${user.email}', style: TextStyle(fontSize: 16))
                        ],
                      ),
                      SizedBox(height: 30),
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            "Your last Anxiety quiz score",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GetScores(quizName: 'anxiety'),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            "\nYour last Stress quiz score",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GetScores(quizName: 'stress'),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 25,
          right: 25,
          child: FloatingActionButton(
            // backgroundColor: Colors.white,
            // foregroundColor: Colors.indigo,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreateProfile()));
            },
            child: Icon(FlutterRemix.pencil_line),
          ),
        ),
        Positioned(
          bottom: 25,
          left: 25,
          child: FloatingActionButton(
            // backgroundColor: Colors.white,
            // foregroundColor: Colors.indigo,
            onPressed: () {
              // HalthDataExample;
            },
            child: Icon(FlutterRemix.heart_2_line),
          ),
        ),
      ]),
    );
  }
}
