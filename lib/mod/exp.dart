import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category { Food, study, accesorise, PC, Laptop, work }

const catIcons = {
  Category.study: Icons.school,
  Category.Food: Icons.lunch_dining,
  Category.accesorise: Icons.add_shopping_cart_outlined,
  Category.PC: Icons.add_to_queue_sharp,
  Category.Laptop:Icons.laptop_mac_outlined,
  Category.work:Icons.work
};

class Exp {
  Exp(
      {required this.title,
      required this.value,
      required this.date,
      required this.category})
      : ID = uuid.v4();
  final String ID;
  final String title;
  final double value;
  final DateTime date;
  final Category category;
  String get formattedDate{
    return formatter.format(date);
  }
}
