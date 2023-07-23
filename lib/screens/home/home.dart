import 'package:ecommerce_app/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final _navItem = [
    HomePage(),
    const Center(child: Text('Shopping Cart'),),
    const Center(child: Text('Category'),),
    const Center(child: Text('Accounts'),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.green,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shopping Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ],
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.orange,
          currentIndex: _currentIndex,
          onTap: _onTapNavigation,
        ),
      ),
      body: _navItem[_currentIndex],
    );
  }

  void _onTapNavigation(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
