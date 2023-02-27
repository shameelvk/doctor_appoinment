import 'package:DocTime/Screens/doctor/mainlayot_doc.dart';
import 'package:DocTime/Screens/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/globals.dart';

class DoctorOrPatient extends StatefulWidget {
  const DoctorOrPatient({Key? key}) : super(key: key);

  @override
  State<DoctorOrPatient> createState() => _DoctorOrPatientState();
}

class _DoctorOrPatientState extends State<DoctorOrPatient> {
  bool _isLoading = true;

  void _setUser() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      DocumentSnapshot snap = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();
      var basicInfo = snap.data() as Map<String, dynamic>;
      isDoctor = basicInfo['type'] == 'doctor' ? true : false;

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      // print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _setUser();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Scaffold(
            body: Center(
                child: CircularProgressIndicator(
            color: Colors.greenAccent,
          )))
        : isDoctor
            ? const MainPageDoctor()
            : const HomePage();
  }
}
