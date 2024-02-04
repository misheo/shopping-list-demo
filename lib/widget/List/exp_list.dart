import 'package:flutter/material.dart';
import 'package:section_4/mod/exp.dart';
import 'exp_item.dart';

class E_List extends StatelessWidget {
  const E_List({super.key, required this.exp, required this.DeleteExp});
  final void Function(Exp expe) DeleteExp;

  final List<Exp> exp;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exp.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(exp[index]),
          onDismissed: (direction) {
            DeleteExp(exp[index]);
          },
          child: Exp_Item(exp[index])),
    );
  }
}
