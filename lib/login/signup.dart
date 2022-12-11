import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String email;
  late String pass;
  late String finalPass;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final finalPassController = TextEditingController();
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
    finalPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    Future<void> SignUp() async {
      try {
        await auth.createUserWithEmailAndPassword(email: email, password: pass);
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
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("EcoFam",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'Plus Jakarta Sans')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Center(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Plus Jakarta Sans'),
                ),
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15)),
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
                        onChanged: (value) {
                          pass = value;
                        },
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
                          labelText: 'password',
                          hintText: 'password',
                        ),
                        controller: passController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) =>
                            value!.length < 6 ? 'Password is too short' : null,
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      TextFormField(
                          onChanged: (value) {
                            finalPass = value;
                          },
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
                            labelText: 'Confirm Password',
                            hintText: 'Confirm Password',
                          ),
                          controller: finalPassController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'Length is short';
                            }
                            if (pass != finalPass) {
                              return 'Passwords do not match';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100.0, vertical: 15.0),
                          backgroundColor: Colors.deepOrangeAccent,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Sign Up'),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            email = emailController.text;
                            pass = passController.text;
                            SignUp();
                          }
                        },
                      ),
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
