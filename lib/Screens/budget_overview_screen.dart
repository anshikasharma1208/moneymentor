import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'incomescreen.dart';

class BudgetOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Overview'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Box with curved edges for Credit Points
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Credit Points',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '2667',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Container for buttons
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2, // Cover half of the screen height
              child: GridView.count(
                crossAxisCount: 2, // Two buttons per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildButton(context, Icons.account_balance_wallet, 'Cash'),
                  _buildButton(context, Icons.payment_rounded, 'Payments'),
                  _buildButton(context, Icons.money, 'Budget'),
                  _buildButton(context, Icons.savings, 'Savings'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, IconData icon, String label) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.blue[800]),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onPressed: () {
        // Handle button press
        if (label == 'Cash') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IncomeScreen()),
          );
        }else if (label == 'Payments') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentScreen()),
          );
        }
      },
    );
  }
}

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments'),
      ),
      body: Container(
      color: Colors.blue[100], // Background color for Payments page
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _launchURL('https://paytm.com'),
              child: Text('Pay with Paytm'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchURL('phonepe://upi'),
              child: Text('Pay with PhonePe'),
            ),
          ],
        ),
      ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
