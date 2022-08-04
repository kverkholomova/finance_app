import 'package:flutter/material.dart';
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
      // backgroundColor: Color.fromRGBO(49, 72, 103, 0.8),
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
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 16
                      ),
                    )),
              ),
              TextFormField(
                decoration: textInputDecoration,
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    )),
              ),
              TextFormField(
                obscureText: true,
                decoration: textInputDecoration,
                validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
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
              const SizedBox(height: 12.0),
              Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}