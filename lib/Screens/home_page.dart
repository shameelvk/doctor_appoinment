import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:samlel/components/appoinment_card.dart';
import 'package:samlel/components/doctor_card.dart';
import 'package:samlel/utils/config.dart';

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "Shameel",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/Images/profile.jfif"),
                    ),
                  )
                ],
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
                height: Config.heightSize * 0.05,
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
