import 'package:flutter/material.dart';
import 'package:notepad2/controller/google_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                image:DecorationImage(
                    image: AssetImage('assets/images/cover.png')
                )
              ),
            ),),
              Padding(
                padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 15.0,
                ),
                child: Text(
                    "Create and manage your Notes..",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontFamily: "lato",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: ElevatedButton(
                  onPressed: (){
                    signInWithGoogle(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Continue with Google",
                          style: TextStyle(
                          fontSize: 20.0,
                            fontFamily: "lato",
                          ),
                      ),
                      SizedBox(width: 10.0,),
                      Image.asset(
                      'assets/images/google.png',
                      height: 20.0,
                      ),
                    ],
                  ),
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Colors.grey[700]
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                      vertical: 5.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
