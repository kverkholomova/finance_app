import 'package:finance_app/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../services/auth.dart';

class SignUp extends StatefulWidget {

  final Function toggleView;
  SignUp({ required this.toggleView });


  @override
  State<SignUp> createState() => _SignUpState();
}

String user_name = '';
String phone_number = '';

class _SignUpState extends State<SignUp> {

  final AuthService _auth_vol = AuthService();

  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
                  child: SvgPicture.asset('assets/logo.svg'),
                ),

                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
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
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                  child: SizedBox(
                    height: 55,
                    child: TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Name'),
                      validator: (val) =>
                      val!.isEmpty
                          ? 'Enter your name'
                          : null,
                      onChanged: (val) {
                        setState(() => user_name = val);
                      },
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                  child: SizedBox(
                    height: 55,
                    child: TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Phone number'),
                      validator: (val) =>
                      val!.isEmpty
                          ? 'Enter your phone number'
                          : null,
                      onChanged: (val) {
                        setState(() => phone_number = val);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
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
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
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

                            if(_formKey.currentState!.validate()){
                              setState(() => loading = true);
                              dynamic result = await _auth_vol.registerWithEmailAndPasswordVol(email, password, user_name, phone_number);
                              if(result == null) {
                                setState(() {
                                  loading = false;
                                  error = 'Please supply a valid data';
                                });
                              }
                            }
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
                  onPressed: () async {
                    optionSignIn = !optionSignIn;
                    widget.toggleView();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SignIn()),
                    // );
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