import 'package:flutter/material.dart';

class IncomeScreen extends StatefulWidget {
  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  final List<Map<String, dynamic>> _incomes = [];
  final TextEditingController _amountController = TextEditingController();
  double _totalIncome = 0.0;

  void _addIncome() {
    final String amountText = _amountController.text;
    if (amountText.isNotEmpty) {
      final double amount = double.tryParse(amountText) ?? 0.0;
      if (amount > 0) {
        setState(() {
          _incomes.add({'amount': amount, 'date': DateTime.now().toString()});
          _totalIncome += amount;
        });
        _amountController.clear();
      }
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Income Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Income: \$${_totalIncome.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Income Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addIncome,
              child: Text('Add Income'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _incomes.length,
                itemBuilder: (context, index) {
                  final income = _incomes[index];
                  return ListTile(
                    title: Text('\$${income['amount']}'),
                    subtitle: Text(income['date']),
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
