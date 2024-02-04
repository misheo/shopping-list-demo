import 'package:flutter/material.dart';
import 'package:section_4/mod/exp.dart';
import 'package:section_4/widget/List/exp_list.dart';
import 'package:section_4/widget/additem.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void _addExp() {
    showModalBottomSheet(
        isScrollControlled: true,
        
        context: context,
        builder: (ctx) {
          return AddItem(addExp: _addExpe);
        });
  }

  final List<Exp> _reExpenses = [
    Exp(
        category: Category.Food,
        date: DateTime.now(),
        title: 'Dinner',
        value: 6.2),
    Exp(
        category: Category.study,
        date: DateTime.now(),
        title: 'Flutter course',
        value: 10),
    Exp(
        category: Category.work,
        date: DateTime.now(),
        title: 'ChatGPT supscription',
        value: 5),
    Exp(
        category: Category.accesorise,
        date: DateTime.now(),
        title: 'Aliexpress order',
        value: 4.4),
    Exp(
        category: Category.Laptop,
        date: DateTime.now(),
        title: 'new m.2 1TP',
        value: 26),
    Exp(
        category: Category.PC,
        date: DateTime.now(),
        title: 'thermal pase',
        value: 0.1),
  ];
  void _addExpe(Exp exp) {
    setState(() {
      _reExpenses.add(exp);
    });
  }
  void _deleateExp(Exp exp)
  {
    setState(() {
      _reExpenses.remove(exp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 88, 255, 241),
      appBar: AppBar(
        title: Text('Flosi fain'),
        // backgroundColor: Color.fromARGB(198, 84, 10, 145),
        // foregroundColor: Colors.white,
        actions: [IconButton(onPressed: _addExp, icon: Icon(Icons.add))],
      ),
      body: Column(
        children: [
          const Placeholder(),
          Expanded(child: E_List(exp: _reExpenses, DeleteExp: _deleateExp))
        ],
      ),
    );
  }
}
