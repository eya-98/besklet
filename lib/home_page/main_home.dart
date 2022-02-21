import 'package:bisklet/app/sign_in/login_screen.dart';
import 'package:bisklet/app/sign_in/profile_pages/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:bisklet/home_page/calendar.dart';
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'ubuntu',
      ),
      debugShowCheckedModeBanner: false,
      home: mainPage(),
      routes: {
        '/CalendarPage' : (context) => CalendarPage(),
      },
    );
  }
}
class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  String selectedType = "solo";
  String selectedFrequency = "guided tour";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: new ListView(
          children: <Widget> [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white30,
            ),
            child: Column(
          children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Image.asset(
                          "assets/images/menu.png",
                          height: 120,
                          width: 200,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
            ],),
            ),
             new ListTile(
              leading: Icon(Icons.home_rounded),
              title: new Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage()
                  )
                );
              },
            ),
            SizedBox(height: 10),
            new ListTile(
              leading: Icon(Icons.account_circle),
              title: new Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsUI()
                  )
                );
              },  
            ),
            new ListTile(
              leading: Icon(Icons.map_rounded),
              title: new Text('Maps'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage()
                  )
                );
              },
            ),
            new ListTile(
              leading: Icon(Icons.notifications_on_outlined),
              title: new Text('Notifications'),
              onTap: () {},
            ),
            new ListTile(
              leading: Icon(Icons.info_outlined),
              title: new Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsUI()
                  )
                );
              },  
            ),
            new ListTile(
              leading: Icon(Icons.login_rounded),
              title: new Text('Log Out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen()
                  )
                );
              },  
            ),
          ],
        )
      ),
      backgroundColor: Color(0xFF66BB6A),
      appBar: AppBar(
        title: Text("Home", style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700
        ),),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text("Choose your trip", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){changetrip("solo");},
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width*0.43,
                              decoration: BoxDecoration(
                                color: Color(0xffdfdeff),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/solo.jpg'),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("Solo", style: TextStyle(
                              fontWeight: FontWeight.w600
                            ),),
                            SizedBox(height: 10,),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffededed),
                              ),
                              child: (selectedType == "solo") ? Icon(Icons.check_circle,
                              color: Colors.yellow[200],
                              size: 30,):Container(),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){changetrip("guided tour");},
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width*0.43,
                              decoration: BoxDecoration(
                                color: Color(0xffdfdeff),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/guided_tour.jpg'),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("Guided Tour", style: TextStyle(
                                fontWeight: FontWeight.w600
                            ),),
                            SizedBox(height: 10,),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffededed),
                              ),
                              child: (selectedType == "guided tour") ? Icon(Icons.check_circle,
                                color: Colors.yellow[200],
                                size: 30,):Container(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text("Choose your bike", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){changetype("beginner");},
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequency == "beginner") ? BoxDecoration(
                            color: Colors.yellow[200],
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ) : BoxDecoration(
                            border: Border.all(color: Colors.black.withOpacity(0.3)),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(
                            child: Text("Beginner", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){changetype("Medium");},
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequency == "Medium") ? BoxDecoration(
                              color: Colors.yellow[200],
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ) : BoxDecoration(
                              border: Border.all(color: Colors.black.withOpacity(0.3)),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(
                            child: Text("Medium", style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                            ),),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){changetype("Professional");},
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequency == "Professional") ? BoxDecoration(
                              color: Colors.yellow[200],
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ) : BoxDecoration(
                              border: Border.all(color: Colors.black.withOpacity(0.3)),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(
                            child: Text("Professional", style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                            ),),
                          ),
                        ),
                      )
                    ],
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: openCalendarPage,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFF66BB6A)
                          ),
                          margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                          child: Text("Next", style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                          ),),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void changetrip(String type)
  {
    selectedType = type;
    setState(() {

    });
  }
  void changetype(String frequency)
  {
    selectedFrequency = frequency;
    setState(() {

    });
  }
 
  void openCalendarPage()
  {
    Navigator.pushNamed(context, '/CalendarPage');
  }
}
