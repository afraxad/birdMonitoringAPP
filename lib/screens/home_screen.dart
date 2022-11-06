import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String _birdCount = '';
  String _timeStamp = '';
  final _database = FirebaseDatabase.instance.ref();
  late StreamSubscription _systemMonitoringStream;

  @override
  void initState(){
    super.initState();
    _activateListeners();
  }

  void _activateListeners(){
    _systemMonitoringStream =
        _database.child("systemMonitoring/birdCount").onValue.listen((event) {
          final Object? birdCount = event.snapshot.value;
          setState(() {
            _birdCount = '$birdCount';
          });
        });

    _systemMonitoringStream =
        _database.child("systemMonitoring/timeStamp").onValue.listen((event) {
          final Object? timeStamp = event.snapshot.value;
          setState(() {
            _timeStamp = '$timeStamp';
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFeeedf2),
        body: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    width:410,
                    height:300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/bg.png')
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(20),
                          Text("Bird Monitoring",
                              style: GoogleFonts.montserrat(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              )),
                          Text(DateFormat().add_yMMMMEEEEd().format(DateTime.now()),
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          const Gap(20),
                          Container(
                              width:60,
                              height:60,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/bird.png')
                                  )
                              )
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width:370,
                        height:300,
                        margin: const EdgeInsets.only(top: 100),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/home_whitebox.png')
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width:110,
                              height:110,
                              margin: const EdgeInsets.only(top: 130),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/images/farmer.png')
                                ),
                              ),
                            ),
                            const Gap(10),
                            Text("BirdApp_User",
                                style: GoogleFonts.montserrat(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54
                                )
                            ),
                            Text("Farmer / Agriculturist",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black54
                                )
                            ),
                            Container(
                              width:30,
                              height:30,
                              margin: const EdgeInsets.only(top: 20),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/images/locicon.png')
                                ),
                              ),
                            ),
                            Text("Capayang, Mogpog",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black54
                                )
                            ),
                            // Insert TextButttonIcon
                          ],
                        )
                      ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width:370,
                        height:350,
                        margin: const EdgeInsets.only(top: 420),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/home_whitebox.png')
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Gap(440),
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: const BoxDecoration(
                                    color: Colors.teal,
                                    borderRadius: BorderRadius.all(Radius.circular(50))
                                ),
                                child: Text(" No. of Birds in the Rice Field ",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    )
                                ),
                              )
                            ]
                        )
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Gap(520),
                              Container(
                                padding: const EdgeInsets.all(50),
                                decoration: const BoxDecoration(
                                    color: Colors.teal,
                                    shape: BoxShape.circle,
                                ),
                                child: Text(_birdCount,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 60,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    )
                                ),
                              ),
                              const Gap(10),
                              Text(" As of $_timeStamp",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black54
                                  )
                              ),
                            ]
                        )
                      ]
                  ),
                ],
              )
            ]
        )
    );
  }

  @override
  void deactivate() {
    _systemMonitoringStream.cancel();
    super.deactivate();
  }
}
