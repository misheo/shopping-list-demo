import 'package:flutter/material.dart';
import 'package:section_4/mod/exp.dart';

class Exp_Item extends StatelessWidget {
  const Exp_Item(this.exp, {super.key});
  final Exp exp;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: Border.all(color: const Color.fromARGB(255, 0, 38, 255)), shadowColor:const Color.fromARGB(255, 206, 101, 255) ,  
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(exp.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('BD ${exp.value.toStringAsFixed(3)}'),
                const Spacer(),
                Row(
                  children: [
                     Icon(catIcons[exp.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(exp.formattedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
