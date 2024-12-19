import 'package:expence_app/data/local/db_helper.dart';
import 'package:expence_app/data/local/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool ispassVisible=false;

  bool isconpassVisible=false;

  DBHelper dbHelper = DBHelper.getInstance;

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  TextEditingController confirmpassController = TextEditingController();

  TextEditingController mobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Color(0xff6574D3).withOpacity(.5),

        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff6574D3),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(

                      hintText: "Name",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: mobController,
                  decoration: InputDecoration(

                      hintText: "Mobile No",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Email",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passController,
                  obscureText: !ispassVisible,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap:() {
                            ispassVisible=!ispassVisible;
                            setState(() {

                            });
                          }, child: Icon(ispassVisible ? Icons.visibility_outlined:Icons.visibility_off_outlined,)),
                      hintText: "Password",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  obscureText: !isconpassVisible,
                  controller: confirmpassController,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: (){
                            isconpassVisible=!isconpassVisible;
                            setState(() {

                            });
                          },
                          child: Icon(isconpassVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined)),
                      hintText: "Confirm Password",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (nameController.text.isNotEmpty &&
                          emailController.text.isNotEmpty &&
                          mobController.text.isNotEmpty &&
                          passController.text.isNotEmpty &&
                          confirmpassController.text.isNotEmpty) {
                        if (passController.text == confirmpassController.text) {
                          ///register user
                          if (await dbHelper.checkIfEmailAlreadyExists(
                              email: emailController.text.toString())) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Email already exists!!"),backgroundColor: Colors.orange,));
                          } else {
                            bool check=await dbHelper.registerUser(
                                newUser: UserModele(
                                    name: nameController.text.toString(),
                                    password: passController.text.toString(),
                                    email: emailController.text.toString(),
                                    mobNo: mobController.text.toString(),
                                    time: DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString()));
                            if(check){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account registered successfully!!"),backgroundColor: Colors.green,));
                              Navigator.pop(context);
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("failed to register account ,try again"),backgroundColor: Colors.red,));
                            }
                          }
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password doesn\'t match"),backgroundColor: Colors.red,));

                        }
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all the required blanks"),backgroundColor: Colors.red,));

                      }
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(fontSize: 15),
                    )),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text("LogIn",
                        style: TextStyle(color: Color(0xff6574D3)))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
