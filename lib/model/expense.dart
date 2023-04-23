import 'package:uuid/uuid.dart';

enum Category { food, leistur, travel, work }

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
  final String dateTime;
  final String amount;
  final Category category;
}
