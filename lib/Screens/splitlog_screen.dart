import 'package:flutter/material.dart';
import 'split_details_screen.dart';

class SplitLogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Split Log'),
      ),
      body: Container(
        color: Colors.blue[100],
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            ListTile(
              leading: Icon(Icons.group_add),
              title: Text('Add Group'),
              onTap: () {
                // Navigate to Add Group screen
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.money_off),
              title: Text('View Expenses'),
              onTap: () {
                // Navigate to View Expenses screen
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Settle Up'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SplitDetailsScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                // Navigate to Notifications screen
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
