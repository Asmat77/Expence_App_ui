
import 'package:expence_app/data/local/db_helper.dart';
import 'package:expence_app/ui/homepage.dart';
import 'package:expence_app/ui/on_boarding/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget{
  DBHelper dbHelper=DBHelper.getInstance;
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();

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
                SizedBox(height: 100,),
                Text("Log In",style: TextStyle(fontSize: 25,color: Color(0xff6574D3),fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Enter your Email",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)
                      )
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: passController,
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)
                      )
                  ),
                ),
                SizedBox(height: 20,),

                ///Login button
                ElevatedButton(onPressed: ()async{
                  if(emailController.text.isNotEmpty && passController.text.isNotEmpty){
                    if(await dbHelper.authenticateUser(email: emailController.text.toString(), pass: passController.text.toString())){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage()));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid credentials, login again"),backgroundColor: Colors.orange,));
                    }


                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter your Email and Password"),backgroundColor: Colors.orange,));
                  }
                }, child: Text("Log In",style: TextStyle(fontSize: 15),)),
                SizedBox(height: 20,),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpPage()));
                    },
                    child: Text("SignUp",style: TextStyle(color: Color(0xff6574D3)))),
                SizedBox(height: 20,),
                Text("Forget Password")

              ],
            ),
          ),
        ),
      ),
    );
  }
}