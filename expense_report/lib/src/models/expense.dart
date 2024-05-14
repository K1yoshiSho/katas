part of '../../expense_report.dart';

class Expense {
  final ExpenseTypeEnum type;
  final int amount;
  const Expense({
    required this.type,
    this.amount = 0,
  });
}
