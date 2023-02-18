import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:DocTime/Screens/appoinment_page.dart';
import 'package:DocTime/Screens/home_page.dart';
import 'package:DocTime/Screens/patient/doctor_list.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPage = 0;
  final PageController _page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: ((value) {
          setState(() {
            currentPage = value;
          });
        }),
        children: const [
          HomePage(),
          DoctorList(),
          AppoinmentPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: ((page) {
            setState(() {
              currentPage = page;
              _page.animateToPage(page,
                  duration: Duration(microseconds: 500),
                  curve: Curves.easeInOut);
            });
          }),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.houseChimneyMedical),
                label: "Home"),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
                label: "Appoinment"),
          ]),
    );
  }
}
