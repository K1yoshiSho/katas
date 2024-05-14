import 'package:expense_report/src/models/base/expense.dart';

abstract class MealExpense implements Service {
  int get expenseLimit;

  const MealExpense();
}
