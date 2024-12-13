import 'package:expence_app/data/local/db_helper.dart';

class UserModele {
  int? id;
  String name;
  String password;
  String email;
  String mobNo;
  String time;

  UserModele(
      {required this.name,
      required this.password,
      required this.email,
      required this.mobNo,
      required this.time,
      this.id});

  factory UserModele.fromMap(Map<String, dynamic> map) {
    return UserModele(
        name: map[DBHelper.USER_COLUMN_NAME],
        password: map[DBHelper.USER_COLUMN_PASSWORD],
        email: map[DBHelper.USER_COLUMN_EMAIL],
        mobNo: map[DBHelper.USER_COLUMN_MOBILE_NO],
        time: map[DBHelper.USER_COLUMN_TIME]);
  }

  Map<String, dynamic> toMap() {
    return {
      DBHelper.USER_COLUMN_NAME: name,
      DBHelper.USER_COLUMN_PASSWORD: password,
      DBHelper.USER_COLUMN_EMAIL: email,
      DBHelper.USER_COLUMN_MOBILE_NO: mobNo,
      DBHelper.USER_COLUMN_TIME: time
    };
  }
}
