import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bisklet/app/sign_in/sign_up_screen.dart';
import 'package:bisklet/app/sign_in/reset_password.dart';
import 'package:bisklet/home_page/main_home.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginScreen> {
  final myControlleremail = TextEditingController();
  final myControllerpwd = TextEditingController();
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: new Color(0xFF66BB6A),
                gradient: LinearGradient(colors: [(new  Color(0xFFAD5D6A7)), new Color(0xFF66BB6A)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Image.asset(
                          "assets/images/back.png",
                          height: 150,
                          width: 320,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20, top: 20),
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      )
                    ],
                  )
              ),
            ),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  ),
                ],
              ),
              child: TextField(
                controller: myControlleremail,
                cursorColor: Colors.green[600],
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.green[600], 
                  ),
                  hintText: "Enter Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
            ),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)
                  ),
                ],
              ),
              child: TextField(
                controller: myControllerpwd,
                cursorColor: Colors.black,
                obscureText: true,
                decoration: InputDecoration(
                  focusColor: Colors.green[600],
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.green[600],
                  ),
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                textInputAction: TextInputAction.go,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => Forgot()));
                },
                      
                child: Text("Forget Password?"),
              ),
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [(new  Color(0xFF66BB6A)), new Color(0xFFAD5D6A7)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Colors.grey
                    ),
                  ],
                ),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              
              onTap: () async {
              try {
                FirebaseAuth auth = FirebaseAuth.instance;
                UserCredential userCredential = await auth.signInWithEmailAndPassword(
                  email: myControlleremail.text,
                  password: myControllerpwd.text
                  );
                  print('Successfully signed in with email link!');
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => mainPage(),
                          )
                        );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
  else {
    print('idkidkdidkdkdidkdkdkdidk');
  }
}
              }
            ),
                // ignore: deprecated_member_use
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have Any Account?"),
                  GestureDetector(
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                          color: Colors.green[800]
                      ),
                    ),
                    onTap: () {
                      // Write Tap Code Here.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          )
                        );
                      },
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }
}