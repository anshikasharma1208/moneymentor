import 'package:flutter/material.dart';

class SplitDetailsScreen extends StatefulWidget {
  @override
  _SplitDetailsScreenState createState() => _SplitDetailsScreenState();
}

class _SplitDetailsScreenState extends State<SplitDetailsScreen> {
  final TextEditingController _amountController = TextEditingController();
  final List<Member> _members = [];

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _addMember() {
    setState(() {
      _members.add(Member(name: 'Member ${_members.length + 1}', hasPaid: false));
    });
  }

  double _getSplitAmount() {
    if (_members.isEmpty) return 0;
    final totalAmount = double.tryParse(_amountController.text) ?? 0;
    return totalAmount / _members.length;
  }

  @override
  Widget build(BuildContext context) {
    final splitAmount = _getSplitAmount();

    return Scaffold(
      appBar: AppBar(
        title: Text('Split Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Total Amount',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(height: 20),
            Text(
              'Members:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _members.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_members[index].name),
                    subtitle: Text('Amount: ₹${splitAmount.toStringAsFixed(2)}'),
                    trailing: Checkbox(
                      value: _members[index].hasPaid,
                      onChanged: (value) {
                        setState(() {
                          _members[index].hasPaid = value!;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _addMember,
              child: Text('Add Member'),
            ),
          ],
        ),
      ),
    );
  }
}

class Member {
  final String name;
  bool hasPaid;

  Member({required this.name, this.hasPaid = false});
}
