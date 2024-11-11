import 'package:flutter/material.dart';

class expense extends StatefulWidget {
  const expense({super.key});

  @override
  _expenseState createState() => _expenseState();
}

class _expenseState extends State<expense> {
  Map<int, Map<String, dynamic>> _expenses = {};
  int _expenseCounter = 0;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _addExpense() {
    if (_titleController.text.isEmpty ||
        _amountController.text.isEmpty ||
        _selectedDate == null) {
      return;
    }
    setState(() {
      _expenseCounter++;
      _expenses[_expenseCounter] = {
        'title': _titleController.text,
        'amount': double.parse(_amountController.text),
        'date': _selectedDate
      };
    });

    _titleController.clear();
    _amountController.clear();
    _selectedDate = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense App'),
        actions: [
          IconButton(
              onPressed: () => _showAddExpenseDialog(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _expenses.length,
          itemBuilder: (context, index) {
            final expenseId = _expenses.keys.toList()[index];
            final expense = _expenses[expenseId];
            return ExpenseItem(
              title: expense!['title'],
              amount: expense['amount'],
              date: expense['date'],
            );
          },
        ),
      ),
    );
  }

  void _showAddExpenseDialog(BuildContext context){
    showDialog(context: context, builder: (ctx){
      return AlertDialog(
        title: Text('Add New Expense'),
        content:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText:'Title'),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_selectedDate==null ?'No Date Chosen!':'Picked Date: ${_selectedDate.toString().split(' ')[0]}'),
                TextButton(onPressed: ()=> _showDatePicker(context), child: Text('Chose Date'),
                ),
              ],
            ),
          ],
        ),

        actions: [
          TextButton(onPressed: (){
            _addExpense();
            Navigator.of(ctx).pop();
          }, child: Text('Add Expense'),
          )
        ],
      );
    },);
  }
}

class ExpenseItem extends StatelessWidget{
  final String title;
  final double amount;
  final DateTime date;

  ExpenseItem({
    required this.title, required this.amount,required this.date
});

  @override
  Widget build(BuildContext context){
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(title),
        subtitle: Text('${date.toString().split(' ')[0]}'),
        trailing: Text('\₹${amount.toStringAsFixed(2)}'),
      ),
    );
  }
}