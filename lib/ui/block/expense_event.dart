import '../../data/local/models/expense_modele.dart';

abstract class ExpenseEvent{}
class AddExpenseEvent extends ExpenseEvent{
  ExpenseModele newExpense;
  AddExpenseEvent({required this.newExpense});
}

class FetchInitialExpenseEvent extends ExpenseEvent{}