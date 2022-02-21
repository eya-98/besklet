import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Forgot extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Forgot> {  
Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('Reset Password',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            )
          ]
        ),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border:InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xFF66BB6A)
            ),
            hintText: 'Your Email*',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          ),
        )
      )
    ]);
}
Widget buildLoginBtn(){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    // ignore: deprecated_member_use
    child: RaisedButton(
      elevation: 5,
      onPressed: () => print('Resset button Pressed'),
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)
    ),
    color: Colors.white,
      child: Text(
      'RESET',
      style: TextStyle(
        color: Color(0xFF66BB6A),
        fontSize: 18,
        fontWeight: FontWeight.bold
      )
    )
  )
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFAD5D6A7),
                    Color(0xFF66BB6A),
                    Color(0xFFAD5D6A7),
                    Color(0xFFAD5D6A7),
                  ]
                )
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 120,
                ),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ), 
                  ),
                  SizedBox(height: 120),
                  buildEmail(),
                  SizedBox(height: 20),
                  buildLoginBtn(),
                ],
              ),
                )
              )
          ]
        )
        )
    )
  );
}

}