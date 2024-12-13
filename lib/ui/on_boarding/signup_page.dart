import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget{
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
                Text("Sign Up",style: TextStyle(fontSize: 25,color: Color(0xff6574D3),fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    hintText: "First Name",
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
                  decoration: InputDecoration(
                      hintText: "Last Name",
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
                  decoration: InputDecoration(
                      hintText: "User Name",
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
                  decoration: InputDecoration(
                      hintText: "Password",
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
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)
                      )
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){}, child: Text("SignUp",style: TextStyle(fontSize: 15),)),
                SizedBox(height: 20,),
                InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Text("LogIn",style: TextStyle(color: Color(0xff6574D3)))),


              ],
            ),
          ),
        ),
      ),
    );
  }
}