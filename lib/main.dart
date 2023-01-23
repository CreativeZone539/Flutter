import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        color: Colors.greenAccent,
        debugShowCheckedModeBanner: false,
        home: HomeActivity());
  }
}

class HomeActivity extends StatelessWidget {
  HomeActivity({Key? key}) : super(key: key);

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(message)
        ));}

  
    final ButtonStyle buttonStyle1 = ElevatedButton.styleFrom(
    padding: EdgeInsets.all(10),
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
  final ButtonStyle buttonStyle2 = ElevatedButton.styleFrom(
    padding: EdgeInsets.all(10),
    backgroundColor: Colors.red,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );


  alertDialogue1(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
            child: AlertDialog(
          title: Text("Confirmation"),
          content: Text('Do you really want to submit it?'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  mySnackBar('Submitted successfully', context);
                  Navigator.of(context).pop();
                },
                style: buttonStyle1,
                child: Text('Yes')),
            ElevatedButton(
                onPressed: () {
                  mySnackBar('The form is not submitted', context);
                  Navigator.of(context).pop();
                },
                style: buttonStyle2,
                child: Text('No')),
          ],
        ));
      },
    );
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final ButtonStyle formSubmit = ElevatedButton.styleFrom(
      padding: EdgeInsets.all(10),
      minimumSize: Size(double.infinity, 60),
      backgroundColor: Colors.green.shade500,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Simple App'),
        titleSpacing: 12,
        toolbarOpacity: 0.7,
        elevation: 4,
        actions: [
          IconButton(
              onPressed: () {
                mySnackBar(
                    'The app is at initial condition, search will not work right now',
                    context);
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Messages()));
              },
              icon: Icon(Icons.comment)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
              },
              icon: Icon(Icons.settings)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
              ),
              child:
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Simple  ', style: TextStyle(fontSize: 25),),
                        Text('Form  ', style: TextStyle(fontSize: 25),),
                        Text('Program  ', style: TextStyle(fontSize: 25),),
                      ],),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        decoration: InputDecoration(
                          label: Text('Your Full Name'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        decoration: InputDecoration(
                          label: Text('Your Email Address'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        decoration: InputDecoration(
                          label: Text('Your Phone Number'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: () {
                          alertDialogue1(context);
                        },
                        child: Text('Submit'),
                        style: formSubmit,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.green.shade100,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName:
                    Text('MOSAEB', style: TextStyle(color: Colors.white70)),
                accountEmail: Text('info@mosaeb.com',
                    style: TextStyle(color: Colors.white60)),
                currentAccountPicture: Image.network(
                    'https://scontent.fdac15-1.fna.fbcdn.net/v/t39.30808-6/325882583_482817727354561_7829734624195048675_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc='
                        'tOLVTm6LZTEAX9FSrdN&_nc_ht=scontent.fdac15-1.fna&oh=00_AfDdYakKAS-xEht4ICKUWOGhzORRnVGXZ8wThmjCVe758Q&oe=63D1B8CC'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeActivity()),);
                mySnackBar('You are already on the homepage', context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Profile()), (route) => true);
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('About us'),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AboutUs()), (route) => true);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact us'),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ContactUs()), (route) => true);
              },
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName:
                    Text('RABBIL HASAN', style: TextStyle(color: Colors.white)),
                accountEmail: Text('info@rabbil.com',
                    style: TextStyle(color: Colors.white)),
                currentAccountPicture: Image.network(
                    'https://cdn.rabbil.com/photos/images/2022/11/04/rabbilVai.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeActivity()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: () {
                mySnackBar(
                    'By tapping/clicking it, you will go to your profile',
                    context);
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('About us'),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AboutUs()), (route) => false);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact us'),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: () {
                mySnackBar(
                    'By tapping/clicking it, you will go to the contact us page',
                    context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
          }
          if (index == 1) {
            mySnackBar('You can view the main homepage from here', context);
          }
          if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Messages()));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        child: Icon(Icons.radio_button_checked),
        onPressed: () {
          mySnackBar('This is a simple floating button.', context);
        },
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(message)
        ));}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        titleSpacing: 12,
        toolbarOpacity: 0.7,
        elevation: 4,
        actions: [
          IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Messages()));
              },
              icon: Icon(Icons.comment)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
              },
              icon: Icon(Icons.settings)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You can edit your profile here'),
          ],
        ),),
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
      ],
      onTap: (int index) {
        if (index == 0) {
          mySnackBar('You can edit your profile from here', context);
        }
        if (index == 1) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeActivity()));
        }
        if (index == 2) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Messages()));
        }
      },
      )
    );
    }
}

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(message)
        ));}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Inbox'),
          titleSpacing: 12,
          toolbarOpacity: 0.7,
          elevation: 4,
        ),

        body: Center(
            child: Text('There is no message right now')
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          ],
          onTap: (int index) {
            if (index == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
            }
            if (index == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeActivity()));
            }
            if (index == 2) {
              mySnackBar('You can view the messages you received from here', context);
            }
          },
        )
    );
  }
}


class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About ourselves'),
        titleSpacing: 12,
        toolbarOpacity: 0.7,
        elevation: 4,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('How I started working with Framework?', style: TextStyle(fontSize: 20,),),

          Text('When I saw some information about flutter, I was literally mesmerized by observing how easy               `', style: TextStyle(fontSize: 12,),),
        ],
      ),
    );
  }
}

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Our contact information'),
          titleSpacing: 12,
          toolbarOpacity: 0.7,
          elevation: 4,
        ),

        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(),
            Text('Our Email Addresses', style: TextStyle(fontSize: 20,),),
            Text('info@shataj.com'),
            Text('info@softltd.com'),
            Text('info@mosaeb.com'),
            Text(''),
            Text(''),
            Text('Our Phone Numbers', style: TextStyle(fontSize: 20,),),
            Text('+8801733919791'),
            Text('+8801676680455'),
            Text('+8801616074984'),
            Text(''),
            Text(''),
            ],
        ),
    );
  }
}


class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Settings'),
        titleSpacing: 12,
        toolbarOpacity: 0.7,
        elevation: 4,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        ],
      ),
    );
  }
}