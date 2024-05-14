import 'package:expense_report/src/models/base/meal_expende.dart';

class Dinner implements MealExpense {
  @override
  final int amount;

  const Dinner({
    required this.amount,
  });

  @override
  int get expenseLimit => 5000;

  @override
  String get name => 'Dinner';
}
