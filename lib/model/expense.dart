import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Expense {
  Expense({
    required this.amount,
    required this.title,
    required this.dateTime,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final String dateTime;
  final String amount;
}
