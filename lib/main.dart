import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(TeamConnectApp());

class TeamConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeamConnect Prototype',
      home: TeamConnectPages(),
    );
  }
}

class TeamConnectPages extends StatefulWidget {
  @override
  _TeamConnectPagesState createState() => _TeamConnectPagesState();
}

class _TeamConnectPagesState extends State<TeamConnectPages> {
  int _currentIndex = 0;

  final List<String> _svgAssets = [
    'assets/TeamConnect-1.svg',
    'assets/TeamConnect-2.svg',
    'assets/TeamConnect-3.svg',
  ];

  final List<Widget> _pageContents = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Login / Sign Up', style: TextStyle(fontSize: 24)),
        SizedBox(height: 8),
        Text('Google & Apple supported authentication buttons go here.'),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Account Registration', style: TextStyle(fontSize: 24)),
        SizedBox(height: 8),
        Text('User input fields for name, email, password, etc.'),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Registration Complete', style: TextStyle(fontSize: 24)),
        SizedBox(height: 8),
        Text('Confirmation message and link to portal/dashboard.'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            _svgAssets[_currentIndex],
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.white.withOpacity(0.85),
            child: Center(child: _pageContents[_currentIndex]),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          BottomNavigationBarItem(icon: Icon(Icons.person_add), label: 'Register'),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: 'Complete'),
        ],
      ),
    );
  }
}
