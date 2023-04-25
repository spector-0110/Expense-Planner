import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

enum Category { food, leisure, travel, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.travel: Icons.flight_takeoff,
};

const uuid = Uuid();

class Expense {
  Expense(
      {required this.amount,
      required this.title,
      required this.dateTime,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final DateTime dateTime;
  final double amount;
  final Category category;

  String getFormatted() {
    return formatter.format(dateTime);
  }
}
