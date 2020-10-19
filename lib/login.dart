import 'package:flutter/material.dart';
import 'package:firebase_login/helper.dart';
import 'package:firebase_login/auth_helper.dart';
import 'package:firebase_login/Homepage.dart';



class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState(){
    super.initState();

    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget> [
            Container(
              height: 150,
              child: Image.network('https://www.onlygfx.com/wp-content/uploads/2017/12/grunge-yes-no-icon-1.png') ,
            ),
            SizedBox(height: 40.0,),
            TextField(
              controller: _emailController,
              textAlign: TextAlign.center,
              onChanged: (value)
              {
                // Do something with user input
              },
              decoration: TextFieldDecoration.copyWith(hintText: " Enter your User name/email"),

            ),
            SizedBox(height: 10.0,),
            TextField(
              controller: _passwordController,
              obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value)
                {
                  // Do something with user input
                },
                decoration: TextFieldDecoration.copyWith(hintText: " Enter your password")

            ),

            SizedBox(height: 20,),
            RoundedButton(
              title: "Log In",
              colour: Colors.deepOrange,
              onPressed: () async {

            if (_emailController.text.isEmpty|| _passwordController.text.isEmpty ) {
              print("Email and password is empty");
              return;

            }
            try {
              final user = await AuthHelper.signInWithEmail(
                email: _emailController.text,
                password: _passwordController.text);
                  if(user != null){
                    print("Login succesful");
              }
            }
            catch (e) {
               print(e);
            }


              },
            ),
            RoundedButton(
              title: "Login with Google",
              colour: Colors.green,
              onPressed: () async {
                  try{
                    await AuthHelper.signInWithGoogle();
                  }  catch (e){
                    print (e);
                  }
              },
            )

          ],

        ),
      ),

    );
  }
}
