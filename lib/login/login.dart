import 'package:capstone/login/reset_pass.dart';
import 'package:capstone/login/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String email;
  late String pass;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  late GoogleSignInAccount userObj;

  bool obsecure = true;
  void toggle() {
    setState(() {
      obsecure = !obsecure;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> login() async {
      try {
        await auth.signInWithEmailAndPassword(email: email, password: pass);
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Signed In"),
          duration: Duration(milliseconds: 1000),
        ));
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed with code: ${e.code}"),
          duration: const Duration(milliseconds: 1000),
        ));
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 30),
        child: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Plus Jakarta Sans'),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 15.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.pinkAccent),
                              gapPadding: 5,
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'email',
                          labelText: 'email',
                        ),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an Email';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please enter a valid Email';
                          }
                          return null;
                        },
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      TextFormField(
                        obscureText: obsecure,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: toggle,
                              icon: Icon(obsecure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pinkAccent),
                                gapPadding: 5,
                                borderRadius: BorderRadius.circular(20)),
                            hintText: 'password',
                            labelText: 'password'),
                        controller: passController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) =>
                            value!.length < 6 ? 'Password is too short' : null,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: const Text(
                                'Forgot Password',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ResetPassword(),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15)),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            email = emailController.text;
                            pass = passController.text;
                            login();
                          }
                        },
                        // ignore: sort_child_properties_last
                        child: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 130.0, vertical: 15.0),
                          backgroundColor: Colors.deepOrangeAccent,
                          shape: const StadiumBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100.0, vertical: 15.0),
                          backgroundColor: Colors.deepOrangeAccent,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Google Sign In'),
                        onPressed: () async {
                          final GoogleSignInAccount googleUser =
                              await GoogleSignIn().signIn().then((value) {
                            setState(() {
                              userObj = value!;
                            });
                            return userObj;
                          });

                          final GoogleSignInAuthentication googleAuth =
                              await googleUser.authentication;

                          auth.signInWithCredential(
                              GoogleAuthProvider.credential(
                                  accessToken: googleAuth.accessToken,
                                  idToken: googleAuth.idToken));

                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        },
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('New Here?'),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUp(),
                                    ));
                              },
                              child: const Text('Sign Up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
