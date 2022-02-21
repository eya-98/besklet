import 'package:flutter/material.dart';
import 'package:bisklet/app/sign_in/login_screen.dart';
import 'package:bisklet/app/sign_in/profile_pages/edit_profile.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:bisklet/home_page/main_home.dart';
class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calendarPage(),
      theme: ThemeData(
        fontFamily: 'ubuntu'
      ),
    );
  }
}
class calendarPage extends StatefulWidget {
  @override
  _calendarPageState createState() => _calendarPageState();
}

class _calendarPageState extends State<calendarPage> {
  CalendarController _calendarController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendarController = CalendarController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _calendarController.dispose();
    super.dispose();
  }
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
      backgroundColor: Colors.green[600],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Select Date", style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarController: _calendarController,
            initialCalendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            formatAnimation: FormatAnimation.slide,
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
              leftChevronIcon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 15,),
              rightChevronIcon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15,),
              leftChevronMargin: EdgeInsets.only(left: 70),
              rightChevronMargin: EdgeInsets.only(right: 70),
            ),
            calendarStyle: CalendarStyle(
              weekendStyle: TextStyle(
                color: Colors.white
              ),
              weekdayStyle: TextStyle(
                color: Colors.white
              )
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(
                color: Colors.white
              ),
              weekdayStyle: TextStyle(
                color: Colors.white
              )
            ),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                color: Colors.white
              ),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Edit Reservation", style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),)
                        ],
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Row dayTask(String time, String name)
  {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width*0.2,
          child: Text(time, style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ), textAlign: TextAlign.right,),
        ),
      ],
    );
  }
}