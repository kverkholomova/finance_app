import 'package:finance_app/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);


  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(49, 72, 103, 0.8),
      // appBar: AppBar(
      //   backgroundColor: Colors.purple,
      //   elevation: 0.0,
      //   title: Align(
      //     alignment: Alignment.topCenter,
      //     child: Text('Sign Up',
      //     style: GoogleFonts.raleway(
      //       fontSize: 25,
      //       color: Colors.orangeAccent,
      //     ),
      //     ),
      //   ),
      //
      // ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric( horizontal: 20.0),
        // padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Align(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                  child: SvgPicture.asset('assets/logo.svg'),
                ),

                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          color: Colors.orangeAccent,
                        ),
                      )),
                ),

                // Padding(
                //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                //   child: Align(
                //       alignment: Alignment.center,
                //       child: Text(
                //         "Email",
                //         style: TextStyle(
                //             fontSize: 16
                //         ),
                //       )),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
                  child: TextFormField(
                    decoration: textInputDecoration.copyWith(hintText:"Email"),
                    validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                //   child: Align(
                //       alignment: Alignment.center,
                //       child: Text(
                //         'Password',
                //         style: TextStyle(
                //             fontSize: 16
                //         ),
                //       )),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                  child: TextFormField(
                    obscureText: true,
                    decoration: textInputDecoration.copyWith(hintText: "Password"),
                    validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextButton(

                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          onPressed: () async {

                          }
                      ),
                    ),
                  ),
                ),
                Text(
                  error,
                  style: const TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                  child: Text(
                    "I already have an account",
                    style: const TextStyle(color: Colors.black, fontSize: 14.0),
                  ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}