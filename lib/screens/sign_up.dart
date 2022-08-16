import 'package:finance_app/screens/home_screen.dart';
import 'package:finance_app/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../services/auth.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;

  SignUp({required this.toggleView});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth_vol = AuthService();
  String userName = '';
  String phoneNumber = '';
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
      backgroundColor: Colors.white,
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.06),
                    child: SizedBox(
                        // width: 130,
                        child: SvgPicture.asset('assets/logo.svg')),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                  //   child: Align(
                  //       alignment: Alignment.center,
                  //       child: Text(
                  //         "Sign Up",
                  //         style: GoogleFonts.raleway(
                  //           fontSize: 25,
                  //           color: Colors.orangeAccent,
                  //         ),
                  //       )),
                  // ),

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
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.12),
                      child: SizedBox(
                        height: 55,
                        child: TextFormField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: Colors.orangeAccent, width: 3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: Colors.orangeAccent,
                                  width: 3,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Name'),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter your name' : null,
                          onChanged: (val) {
                            setState(() {
                              userName = val;

                              // print(valueChanged);
                            });
                          },
                        ),
                      )

                      // buildTextFormField(context, 'Name', 'Enter your name', userName)

                      ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: SizedBox(
                      height: 55,
                      child: TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                  color: Colors.orangeAccent, width: 3),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                                width: 3,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Email"),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: SizedBox(
                      height: 55,
                      child: TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                  color: Colors.orangeAccent, width: 3),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                                width: 3,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password"),
                        validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                      ),
                    ),
                  ),
                  // buildTextFormField(context, "Email", 'Enter an email', email),
                  // buildTextFormField(context, "Password",
                  //     'Enter a password 6+ chars long', password),
                  // Padding(
                  //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                  //   child: TextFormField(
                  //     decoration: textInputDecoration.copyWith(hintText:"Email"),
                  //     validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                  //     onChanged: (val) {
                  //       setState(() => email = val);
                  //     },
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                  //   child: Align(
                  //       alignment: Alignment.center,
                  //       child: Text(buildTextFormField(context)
                  //         'Password',
                  //         style: TextStyle(
                  //             fontSize: 16
                  //         ),
                  //       )),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                  //   child: TextFormField(
                  //     obscureText: true,
                  //     decoration: textInputDecoration.copyWith(hintText: "Password"),
                  //     validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                  //     onChanged: (val) {
                  //       setState(() => password = val);
                  //     },
                  //   ),
                  // ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                            child: const Text(
                              'Sign Up',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => loading = true);
                                dynamic result = await _auth_vol
                                    .registerWithEmailAndPasswordVol(
                                        email, password, userName, email);
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error = 'Please supply a valid data';
                                    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");

                                    print(email);
                                    print(password);
                                    print(userName);

                                    print(result);
                                  });
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()));
                                }
                              }
                            }),
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
                      style:
                          const TextStyle(color: Colors.black, fontSize: 14.0),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildTextFormField(
      BuildContext context, hintTextName, errorText, valueChanged) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      child: SizedBox(
        height: 55,
        child: TextFormField(
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Colors.orangeAccent, width: 3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.orangeAccent,
                  width: 3,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hintTextName),
          validator: (val) => val!.isEmpty
              ? errorText
              : hintTextName == "Password"
                  ? val.length < 6
                      ? 'Enter a password 6+ chars long'
                      : null
                  : null,
          onChanged: (val) {
            setState(() {
              valueChanged = val;

              print(valueChanged);
            });
          },
        ),
      ),
    );
  }
}
