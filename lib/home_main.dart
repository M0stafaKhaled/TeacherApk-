import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teacher/models/fetchApi.dart';
import 'package:teacher/screens/Home.dart';
import 'package:teacher/screens/Score.dart';
import 'package:teacher/ui/views/home_view.dart';

class home_main extends StatefulWidget {
  const home_main({Key? key}) : super(key: key);

  @override
  State<home_main> createState() => _home_mainState();
}

class _home_mainState extends State<home_main> {
  int _selectedIndex = 0;
  late  fetchApi fes =fetchApi();
  // var l = fes.fetchScore();
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  final List<Widget> _widgetOptions = <Widget>[

        Score(),
      HomeView(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
