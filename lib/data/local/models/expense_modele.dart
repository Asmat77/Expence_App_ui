import 'package:expence_app/data/local/db_helper.dart';

class ExpenseModele {
  int? id;
  int userId;
  String expenseType;
  String createdAt;
  String title;
  String desc;
  double amount;
  double balance;
  int cat_id;

  ExpenseModele(
      {required this.expenseType,
      required this.userId,
      required this.title,
      required this.desc,
      required this.createdAt,
      required this.amount,
      required this.balance,
      required this.cat_id,
      this.0});

  factory ExpenseModele.fromMap(Map<String, dynamic> map) {
    return ExpenseModele(
      id: map[DBHelper.USER_COLUMN_ID],
      expenseType: map[DBHelper.EXPENSE_COLUMN_TABLE_TYPE],
      userId: map[DBHelper.EXPENSE_COLUMN_USER_ID],
        title: map[DBHelper.EXPENSE_COLUMN_TITLE],
        desc: map[DBHelper.EXPENSE_COLUMN_DESC],
        createdAt: map[DBHelper.EXPENSE_COLUMN_CREATED_AT],
        amount: map[DBHelper.EXPENSE_COLUMN_AMOUNT],
        balance: map[DBHelper.EXPENSE_COLUMN_BALANCE],
        cat_id: map[DBHelper.EXPENSE_COLUMN_CAT_ID]);
  }

  Map<String, dynamic> toMap() {
    return {
      DBHelper.EXPENSE_COLUMN_TABLE_TYPE:expenseType,
      DBHelper.EXPENSE_COLUMN_USER_ID:userId,
      DBHelper.EXPENSE_COLUMN_TITLE: title,
      DBHelper.EXPENSE_COLUMN_DESC: desc,
      DBHelper.EXPENSE_COLUMN_CREATED_AT: createdAt,
      DBHelper.EXPENSE_COLUMN_AMOUNT: amount,
      DBHelper.EXPENSE_COLUMN_BALANCE: balance,
      DBHelper.EXPENSE_COLUMN_CAT_ID: cat_id,
    };
  }
}
