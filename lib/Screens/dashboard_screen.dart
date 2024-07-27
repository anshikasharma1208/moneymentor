import 'package:flutter/material.dart';
import 'statistics.dart' as Statistics;
import 'transaction_history_screen.dart';
import 'budget_overview_screen.dart';
import 'splitlog_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    BudgetOverviewScreen(),
    TransactionHistoryScreen(),
    Statistics.StatisticsScreen(),
    SplitLogScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
        children: [
          Image.asset(
            'assets/logo1.png', // Replace with your logo's path
          height: 100, // Adjust the height as needed
      ),
          SizedBox(width: 20),
          Text('MONEY MENTOR'),
        ],
      ),
      backgroundColor: Colors.blue[900],
      ),
      body: Container(
        color: Colors.blue[100],
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
    ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Budget Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Transaction History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq ),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add_rounded),
            label: 'Splitlog',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Color for the selected item
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.purple[200],
        onTap: _onItemTapped,
      ),
    );
  }
}
