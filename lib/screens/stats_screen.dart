import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

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
                  height:100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/headerbg.png')
                    ),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Gap(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Gap(40),
                          Text("Bird Statistics",
                              style: GoogleFonts.montserrat(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              )),
                        ],
                      ),
                    ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 35, left:325),
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        iconSize: 30,
                        icon: const Icon(FluentSystemIcons.ic_fluent_arrow_download_filled,
                            color: Colors.white),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width:370,
                      height:310,
                      margin: const EdgeInsets.only(top: 120),
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
                            const Gap(100),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.all(Radius.circular(50))
                              ),
                              child: Text(" Today's Bird Trend ",
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
                    Container(
                      width:370,
                      height:320,
                      margin: const EdgeInsets.only(top: 450),
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
                            const Gap(430),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.all(Radius.circular(50))
                              ),
                              child: Text(" Weekly Bird Trend ",
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
              ],
            )
          ],
        )
    );
  }
}
