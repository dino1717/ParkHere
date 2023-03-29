import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parking_manager/MatrixPage.dart';

import '../welcomeScreen.dart';
import 'loginScreen.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  @override
  Widget build(BuildContext context) {
    double  width1 = MediaQuery. of(context). size. width/2 ;
    return Scaffold(
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              SizedBox(
//                width:80,
                 width: width1,

               child: Center(

                 child: TextFormField(
                   decoration: const InputDecoration(
                     border: UnderlineInputBorder(),
                     labelText: 'Name',
                     filled: true,
                     fillColor: Colors.white,
                     labelStyle: TextStyle(color: Colors.purple),


                   ),
                 ),

               ),
             ),
              Container(
                height: 20,
              ),

              SizedBox(
//                width:80,
                width: width1,

                child: Center(

                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,


                      labelStyle: TextStyle(color: Colors.purple),
                    ),
                  ),

                ),
              ),
              Container(
                height: 20,
              ),
              SizedBox(
//                width:80,
                width: width1,

                child: Center(

                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white,

                      hintText: '*********',
                      labelStyle: TextStyle(color: Colors.purple),
                    ),
                  ),

                ),
              ),
              Container(
                height: 20,
              ),
              SizedBox(
//                width:80,
                width: width1,

                child: Center(

                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Confirm Password',
                      filled: true,
                      fillColor: Colors.white,

                      hintText: '*********',
                      labelStyle: TextStyle(color: Colors.purple),
                    ),
                  ),

                ),
              ),
              Container(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 3.3,
                          vertical: 20)
                    // padding: EdgeInsets.only(
                    //     left: 120, right: 120, top: 20, bottom: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftPop, child: MatrixPage(), childCurrent: MatrixPage()));
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => loginScreen()));
                  },
                  child: Text(
                    'Signup',
                    style: TextStyle(fontSize: 17),
                  )),

            ]

        ),


      ),

    );
  }
}