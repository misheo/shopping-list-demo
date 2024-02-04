import 'package:flutter/material.dart';
import 'package:section_4/mod/exp.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key, required this.addExp});
  final void Function(Exp expe) addExp;

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  Category _selectedCategory = Category.Food;
  DateTime? _selecteddate;
  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _supmitExpenseData() {
    final enterAmount = double.tryParse(_priceController.text);
    final amountInvalid = enterAmount == null || enterAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountInvalid ||
        _selecteddate == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: const Text("Invalid input", textAlign: TextAlign.center),
            content: const Text(
              "there are an error in your input please check your input",
              textAlign: TextAlign.center,
            ),
            actions: [
              // usually buttons at the bottom of the dialog
              TextButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
      return;
      //show error message
    }
    widget.addExp(Exp(
        title: _titleController.text,
        value: enterAmount,
        date: _selecteddate!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  void _selectDate() async {
    final today = DateTime.now();
    final FirstDate = DateTime(today.year - 1, today.month, today.day);
    final LastDate = DateTime(today.year, today.month + 1, today.day);

    final selectdate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: FirstDate,
        lastDate: today);
    setState(() {
      _selecteddate = selectdate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text('Price'), suffix: Text('BD')),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selecteddate == null
                      ? '--/--/----'
                      : formatter.format(_selecteddate!).toString()),
                  IconButton(
                      onPressed: _selectDate,
                      icon: const Icon(Icons.calendar_month))
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((e) => DropdownMenuItem(
                          value: e, child: Text(e.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value as Category;
                    });
                  }),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: _supmitExpenseData, child: const Text('Add')),
            ],
          )
        ],
      ),
    );
  }
}
