import 'dart:ui';

import 'package:expence_app/data/local/models/expense_modele.dart';
import 'package:expence_app/data/local/models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

///tables
/// 1 User ( uid, uname, pass, email, mobile, createdAt)
/// 2 Expense ( eid, uid, etype[1-> debit, 2-> credit], eTitle, edesc, ecreatedAt, amount, balance, cat_id)
/// 3 category(cat_ic, name, image_path)
/// database code

class DBHelper {
  /// user table data
  static final String USER_TABLE = "user";
  static final String USER_COLUMN_ID = "uid";
  static final String USER_COLUMN_NAME = "uname";
  static final String USER_COLUMN_PASSWORD = "password";
  static final String USER_COLUMN_EMAIL = "email";
  static final String USER_COLUMN_MOBILE_NO = "mobile";
  static final String USER_COLUMN_TIME = "created_at";

  /// expense table data
  static final String EXPENSE_TABLE = "expense";
  static final String EXPENSE_COLUMN_ID = "eid";
  static final String EXPENSE_COLUMN_NAME = "name";
  static final String EXPENSE_COLUMN_TITLE = "etitle";
  static final String EXPENSE_COLUMN_DESC = "edesc";
  static final String EXPENSE_COLUMN_TIME = "ecreated_at";
  static final String EXPENSE_COLUMN_AMOUNT = "amount";
  static final String EXPENSE_COLUMN_BALANCE = "balance";
  static final String EXPENSE_COLUMN_CAT_ID = "cat_id";

  DBHelper._();

  static DBHelper getInstance = DBHelper._();

  Database? mDB;

  Future<Database> initDB() async {
    mDB = mDB ?? await openDB();
    return mDB!;
  }

  Future<Database> openDB() async {
    var dirPath = await getApplicationDocumentsDirectory();
    var dbPath = join(dirPath.path, "Expense.db");
    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(
          "create table $USER_TABLE ( $USER_COLUMN_ID integer primary key autoincrement, $USER_COLUMN_NAME text, $USER_COLUMN_PASSWORD text, $USER_COLUMN_EMAIL text, $USER_COLUMN_MOBILE_NO text, $USER_COLUMN_TIME text)");
      db.execute(
          "create table $EXPENSE_TABLE ( $EXPENSE_COLUMN_ID uid integer primary key autoincrement,etype [ 1-> debit text, 2-> credit text],$EXPENSE_COLUMN_TITLE text,$EXPENSE_COLUMN_DESC text,$EXPENSE_COLUMN_TIME text,$EXPENSE_COLUMN_AMOUNT text, $EXPENSE_COLUMN_BALANCE text,$EXPENSE_COLUMN_CAT_ID integer)");
    });
  }

  ///Add data of user
  /*Future<bool> addUser(
      {required String name,
        required String password,
        required String email,
        required String mobNo,
        required String time}) async {
    Database db = await initDB();
    int rowsEffected = await db.insert(USER_TABLE, {
      USER_COLUMN_NAME: name,
      USER_COLUMN_PASSWORD: password,
      USER_COLUMN_EMAIL: email,
      USER_COLUMN_MOBILE_NO: mobNo,
      USER_COLUMN_TIME: time
    });
    return rowsEffected > 0;
  }*/

  Future<bool> addUser(UserModele newUser) async {
    Database db = await initDB();
    int rowsEffected = await db.insert(USER_TABLE, newUser.toMap());
    return rowsEffected > 0;
  }



  /// Add data of Expense
  /*Future<bool> addExpense(
      {required String title,
      required String desc,
      required String time,
      required String amount,
      required String balanc,
      required int cat_id}) async {
    Database db = await initDB();
    int rowEffected = await db.insert(EXPENSE_TABLE, {
      EXPENSE_COLUMN_TITLE: title,
      EXPENSE_COLUMN_DESC: desc,
      EXPENSE_COLUMN_TIME: time,
      EXPENSE_COLUMN_AMOUNT: amount,
      EXPENSE_COLUMN_BALANCE: balanc,
      EXPENSE_COLUMN_CAT_ID: cat_id
    });
    return rowEffected > 0;
  }*/


  Future<bool> addExpense(ExpenseModele newExpense) async {
    Database db = await initDB();
    int rowEffected = await db.insert(EXPENSE_TABLE, newExpense.toMap());
    return rowEffected > 0;
  }



  ///Fetch data of user
 /* Future<List<Map<String,dynamic>>> fetchUser()async{
    Database db=await initDB();
    List<Map<String,dynamic>> allUser=await db.query(USER_TABLE);
    return allUser;
  }*/

  Future<List<UserModele>> fetchUser()async{
    Database db=await initDB();
    List<UserModele> mData=[];
    List<Map<String,dynamic>> allUser=await db.query(USER_TABLE);
    for(Map<String,dynamic> eachData in allUser){
      UserModele eachUser= UserModele.fromMap(eachData);
      mData.add(eachUser);
    }
    return mData;
  }



  ///Fetch Date of Expense
 /* Future<List<Map<String,dynamic>>> fetchExpense()async{
    Database db=await initDB();
    List<Map<String,dynamic>> allUser=await db.query(EXPENSE_TABLE);
    return allUser;
  }*/

  Future<List<ExpenseModele>> fetchExpense()async{
    Database db=await initDB();
    List<ExpenseModele> mData=[];
    List<Map<String,dynamic>> allExpense=await db.query(EXPENSE_TABLE);
    for(Map<String,dynamic> eachData in allExpense){
      ExpenseModele eachExp=ExpenseModele.fromMap(eachData);
      mData.add(eachExp);
    }
    return mData;
  }



}