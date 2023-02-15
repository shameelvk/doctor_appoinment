import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:samlel/components/appoinment_card.dart';
import 'package:samlel/components/doctor_card.dart';
import 'package:samlel/utils/config.dart';
import 'package:intl/intl.dart';

import '../firestore_data/notification_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> medcat = [
    {
      "icone": FontAwesomeIcons.userDoctor,
      'category': "General",
    },
    {
      "icone": FontAwesomeIcons.heartPulse,
      "category": "Cardiology",
    },
    {
      "icone": FontAwesomeIcons.lungs,
      "category": "Respiration",
    },
    {
      "icone": FontAwesomeIcons.hand,
      "category": "Dermatology",
    },
    {
      "icone": FontAwesomeIcons.personPregnant,
      "category": "Gynacology",
    },
    {
      "icone": FontAwesomeIcons.teeth,
      "category": "Dental",
    },
    // {"icone": FontAwesomeIcons.userDoctor, "category": "General"}
  ];

  @override
  Widget build(BuildContext context) {
    String message = "Good";
    DateTime now = DateTime.now();
    String currentHour = DateFormat('kk').format(now);
    int hour = int.parse(currentHour);
    setState(
      () {
        if (hour >= 5 && hour < 12) {
          message = 'Good Morning';
        } else if (hour >= 12 && hour <= 17) {
          message = 'Good Afternoon';
        } else {
          message = 'Good Evening';
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[Container()],
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                // width: MediaQuery.of(context).size.width / 1.3,
                alignment: Alignment.center,
                child: Text(
                  message,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                width: 55,
              ),
              IconButton(
                splashRadius: 20,
                icon: const Icon(Icons.notifications_active),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contex) => NotificationList()));
                },
              ),
            ],
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                // alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Hello Shameel",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                "Let's Find Your\nDoctor",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: const <Widget>[
              //     Text(
              //       "Shameel",
              //       style: TextStyle(
              //         fontSize: 24,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     SizedBox(
              //       child: CircleAvatar(
              //         radius: 30,
              //         backgroundImage: AssetImage("assets/Images/profile.jfif"),
              //       ),
              //     )
              //   ],
              // ),
              const SizedBox(height: 15),
              Container(
                // padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.search,
                  // controller: _doctorName,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    // fillColor: Colors.grey[200],
                    hintText: 'Search doctor',
                    hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                    suffixIcon: Container(
                      child: IconButton(
                        iconSize: 25,
                        splashRadius: 20,
                        color: Colors.greenAccent,
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                  onFieldSubmitted: (String value) {
                    setState(
                      () {},
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
              Text(
                "Category",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(medcat.length, (index) {
                    return Card(
                      margin: const EdgeInsets.only(right: 20),
                      color: Colors.greenAccent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FaIcon(
                              medcat[index]["icone"],
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              medcat[index]["category"],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Appointment Today",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              AppoinmentCard(),
              SizedBox(
                height: 15,
              ),
              Text(
                "Top Doctors",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: List.generate(10, (index) {
                  return DoctorCard(
                    route: 'doc_details',
                  );
                }),
              )
            ],
          ),
        )),
      ),
    );
  }
}
