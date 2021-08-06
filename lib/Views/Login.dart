import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodie/Providers/Authentication.dart';
import 'package:foodie/Views/HomePage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white24),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               RichText(
                text: TextSpan(
                    text: 'Fo',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                    text: 'od',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  TextSpan(
                    text: 'ie',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      color: Colors.black54,
                      onPressed:() {
                        loginSheet(context);
                      },
                      child: Text('Login',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                    MaterialButton(
                      onPressed:() {
                        signInSheet(context);
                      },
                      child: Text('SignIn',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                        
                  ],
                )
            ],
          ),),
      ),
    );
  }

  loginSheet(BuildContext context){
    return showModalBottomSheet(context: context, builder: (context){
      return new Container(
        height: 400.0,
        width: 400.0,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade700
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(color: Colors.white)
                  ),
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: Colors.white)
                  ),
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.lightGreenAccent,
                  child: Text('Login',style: TextStyle(color: Colors.white24)),
                  onPressed: () => Provider.of<Authentication>(context,listen: false).loginIntoAccount(emailController.text, passwordController.text).whenComplete(() {
                    Navigator.pushReplacement(context, PageTransition(child: Homescreen(), type: PageTransitionType.leftToRight));
                  })),
              )
            ],
          ),
        ),
      );
    });
  }

   signInSheet(BuildContext context){
    return showModalBottomSheet(context: context, builder: (context){
      return new Container(
        height: 400.0,
        width: 400.0,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade700
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(color: Colors.white)
                  ),
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: Colors.white)
                  ),
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.lightGreenAccent,
                  child: Text('Signin',style: TextStyle(color: Colors.white24)),
                  onPressed: () => Provider.of<Authentication>(context,listen: false)
                  .createNewAccount(emailController.text, passwordController.text).whenComplete(() {
                    Navigator.pushReplacement(context, PageTransition(child: Homescreen(), type: PageTransitionType.leftToRight));
                  })),
              )
            ],
          ),
        ),
      );
    });
  }
}