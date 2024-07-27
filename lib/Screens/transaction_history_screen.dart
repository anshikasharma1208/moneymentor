import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {'reason': 'Food', 'amount': -50.0, 'date': '2024-07-24'},
    {'reason': 'Petrol', 'amount': -30.0, 'date': '2024-07-23'},
    {'reason': 'Groceries', 'amount': -100.0, 'date': '2024-07-22'},
    {'reason': 'Salary', 'amount': 1000.0, 'date': '2024-07-21'},
    // Add more transactions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: Container(
        color: Colors.blue[900], // Set the background color here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Recent Transactions',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'You have to spend less money, otherwise you might burn your savings!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  final reason = transaction['reason'];
                  final amount = transaction['amount'];
                  final date = transaction['date'];

                  return Card(
                    color: Colors.blue[100], // Set card background color if needed
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.arrow_circle_down,
                        color: amount < 0 ? Colors.red : Colors.green,
                      ),
                      title: Text(reason),
                      subtitle: Text(date),
                      trailing: Text(
                        '\$${amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: amount < 0 ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
