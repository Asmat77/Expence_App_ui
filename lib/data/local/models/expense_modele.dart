import 'package:expence_app/data/local/db_helper.dart';

class ExpenseModele {
  int? id;
  String title;
  String desc;
  String time;
  String amount;
  String balance;
  int cat_id;

  ExpenseModele(
      {required this.title,
      required this.desc,
      required this.time,
      required this.amount,
      required this.balance,
      required this.cat_id,
      this.id});

  factory ExpenseModele.fromMap(Map<String, dynamic> map) {
    return ExpenseModele(
        title: map[DBHelper.EXPENSE_COLUMN_TITLE],
        desc: map[DBHelper.EXPENSE_COLUMN_DESC],
        time: map[DBHelper.EXPENSE_COLUMN_TIME],
        amount: map[DBHelper.EXPENSE_COLUMN_AMOUNT],
        balance: map[DBHelper.EXPENSE_COLUMN_BALANCE],
        cat_id: map[DBHelper.EXPENSE_COLUMN_CAT_ID]);
  }

  Map<String, dynamic> toMap() {
    return {
      DBHelper.EXPENSE_COLUMN_TITLE: title,
      DBHelper.EXPENSE_COLUMN_DESC: desc,
      DBHelper.EXPENSE_COLUMN_TIME: time,
      DBHelper.EXPENSE_COLUMN_AMOUNT: amount,
      DBHelper.EXPENSE_COLUMN_BALANCE: balance,
      DBHelper.EXPENSE_COLUMN_CAT_ID: cat_id,
    };
  }
}
