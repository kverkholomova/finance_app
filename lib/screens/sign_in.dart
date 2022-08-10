import 'package:finance_app/screens/home_screen.dart';
import 'package:finance_app/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../services/auth.dart';

bool optionSignIn = true;
class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ required this.toggleView });
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final String assetName = 'assets/logo.svg';

  final Widget svg = SvgPicture.asset(
      'assets/logo.svg'
  );

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
      //     child: Text('Sign in',
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
                      "Sign In",
                      style: GoogleFonts.raleway(
                              fontSize: 25,
                              color: Colors.orangeAccent,
                            ),
                    )),
              ),

              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
                child: TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Email"),
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
              //           'Password',
              //           style: TextStyle(
              //           fontSize: 16
              //       ),
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
                          'Sign In',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        onPressed: () async {
                          if(_formKey.currentState!.validate()){
                            setState(() => loading = true);
                            dynamic result = await _auth.signInWithEmailAndPasswordVol(email, password);
                            if(result == null) {
                              setState(() {
                                print("ENTER VALID DATA");
                                loading = false;
                                error = 'Could not sign in with those credentials';
                              });
                            }
                            else{
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => MyHomePage()));
                            }
                          }


                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => const MyHomePage()),
                          // );
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
                  optionSignIn = !optionSignIn;
                  widget.toggleView();

                },
                child: Text(
                "I don't have an account",
                style: const TextStyle(color: Colors.black, fontSize: 14.0),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}