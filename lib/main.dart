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

  var itemList=[
    {'img':"https://images.universal-music.de/img/assets/553/553157/992/720/fotojet-2022-05-06t120346819jpg.jpg",'name':"BoyWithUke"},
    {'img':"https://geo-media.beatport.com/image_size/500x500/135679a8-a482-4aef-8ea0-6a4199d5fc1e.jpg",'name':"Marshmello"},
    {'img':"https://images.squarespace-cdn.com/content/v1/5ff4a97457429516243f37fd/1610757409489-NWQ09GXXUHVIC9Q2YLE7/Charlie-Puth-001-credit-Danielle-Levitt.jpg",'name':"Charlie Puth"},
    {'img':"https://production-livingdocs-bluewin-ch.imgix.net/2019/1/3/6ee7ab66-60dc-4e27-b805-f7179a6cff3e.jpeg?w=994&auto=format",'name':"Dan from Imagine Dragons"},
    {'img':"https://cdns-images.dzcdn.net/images/artist/ad3bec823ebb6c100c4bcf74bbf3c218/500x500.jpg",'name':"Humood AlKhuder"},
    {'img':"https://p16.resso.me/img/tos-alisg-i-0000/5810e85491d945558d25838f2141331c~c5_750x750.jpg",'name':"Maher Zain"},
  ];

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(message)
        )
    );
  }

  TextEditingController controller = TextEditingController();

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
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  @override
  Widget build(BuildContext context) {


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
                mySnackBar('You can edit all of your application preferences here', context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings('Your settings')));
              },
              icon: Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              },
              icon: Icon(Icons.person_outline_rounded)),
        ],
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Container(
          //     height: 400,
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //       border: Border.all(
          //         color: Colors.black,
          //         width: 0.5,
          //       ),
          //     ),
          //   child: ListView.builder(
          //       itemCount: itemList.length,
          //       itemBuilder: (context, index){
          //         return GestureDetector(
          //           onDoubleTap: (){
          //             mySnackBar(itemList[index]['name'], context);
          //           },
          //           child: Container(
          //             margin: EdgeInsets.all(10),
          //             width: double.infinity,
          //             height: 500,
          //             child: Image.network(itemList[index]['img']!, fit: BoxFit.fill),
          //           ),
          //         );
          //       }
          //   )
          // ),
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 0.5,
              ),
            ),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          color: Colors.white,
                          elevation: 20,
                          child: SizedBox(
                            height: 300,
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network('https://m.media-amazon.com/images/I/61VcLC0G13L._AC_SL1500_.jpg'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Microsoft™ Surface Pro', style: TextStyle(fontSize: 25,),),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('90,000 BDT', style: TextStyle(fontSize: 15,),),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {

                                            },
                                            style: buttonStyle1,
                                            child: Icon(Icons.remove_red_eye)
                                        ),
                                        Text('View details'),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              mySnackBar('Added to your wishlist', context);
                                            },
                                            style: buttonStyle2,
                                            child: Icon(Icons.favorite)
                                        ),
                                        Text('Add to wishlist'),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  childAspectRatio: 1,
                ),
                  itemCount: itemList.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onDoubleTap: (){
                        mySnackBar(itemList[index]['name'], context);
                      },
                      child: Container(
                        margin: EdgeInsets.all(1),
                        width: double.infinity,
                        height: 500,
                        child: Image.network(itemList[index]['img']!, fit: BoxFit.fill),
                      ),
                    );
                  }
              )
          ),
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
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Profile()), (route) => false);
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
                mySnackBar('You can edit all of your application preferences here', context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings('Your preferenced settings')));
              },
              icon: Icon(Icons.settings)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://scontent.fdac15-1.fna.fbcdn.net/v/t39.30808-6/325882583_482817727354561_7829734624195048675_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc='
                  'tOLVTm6LZTEAX9FSrdN&_nc_ht=scontent.fdac15-1.fna&oh=00_AfDdYakKAS-xEht4ICKUWOGhzORRnVGXZ8wThmjCVe758Q&oe=63D1B8CC'),
              radius: 50,
            ),
          ),
          Text('Mosaeb Ibn Masud'),
        ],
      ),

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
  Messages({Key? key}) : super(key: key);

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(message)
        ));}

  List<String> titles=[
    "You've got a new message from BAFSD",
    "You've got a new message from Ostad",
    "You've got a new message from Shikho",
    "You've got a new message from 10MinuteSchool",
    "You've got a new message from BAFSD",
    "You've got a new message from Ostad",
    "You've got a new message from Shikho",
    "You've got a new message from 10MinuteSchool",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Inbox'),
          titleSpacing: 12,
          toolbarOpacity: 0.7,
          elevation: 4,
        ),

        body: ListView(
          children: [Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('There is no message right now'),
                // CircularProgressIndicator(
                //   strokeWidth: 2,
                //   color: Colors.black54,
                //   backgroundColor: Colors.black45,
                // ),
                // SizedBox(
                //   width: null,
                //   child: LinearProgressIndicator(
                //     minHeight: 6,
                //     color: Colors.black54,
                //     backgroundColor: Colors.black45,
                //   ),
                // )
                ListView.separated(
                  itemCount: titles.length,
                  itemBuilder: (context, index){
                    return Card(
                      color: Colors.green.shade50,
                      elevation: 2,
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ListTile(
                          title: Text(titles[index]),
                          subtitle: Text("Dear student, as you know that your teachers have to go to the training for new curriculum books came in 2023..."),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index){
                    return Divider(
                      height: 5,
                      color: Colors.green.shade200,
                    );
                  },
                )
              ],
            ),],
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(),
          Text('How I started working with Framework?', style: TextStyle(fontSize: 20,),),
          Text('When I saw some information about flutter, I was literally mesmerized by observing how easy', style: TextStyle(fontSize: 12,),),
          ListTile(
            leading: CircleAvatar(child: Text('1'),),
            title: Text('Mosaeb Ibn Masud'),
            subtitle: Text('Student'),
            trailing: Icon(Icons.book),
            tileColor: Colors.green.shade200,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          ),
          ListTile(
            leading: CircleAvatar(child: Text('2'),),
            title: Text('Marzan Binta Masud'),
            subtitle: Text('Student'),
            trailing: Icon(Icons.supervisor_account),
            tileColor: Colors.green.shade200,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          ),
          ListTile(
            leading: CircleAvatar(child: Text('3'),),
            title: Text('Mohammad Masud Rahman'),
            subtitle: Text('Businessman'),
            trailing: Icon(Icons.business_center),
            tileColor: Colors.green.shade200,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          ),
          ListTile(
            leading: CircleAvatar(child: Text('4'),),
            title: Text('Sonya Rahman'),
            subtitle: Text('Director'),
            trailing: Icon(Icons.business_center),
            tileColor: Colors.green.shade200,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          ),
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

  mySnackBar(msg, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(msg)
        )
    );
  }

  String HomeSettings;

  Settings(
      this.HomeSettings,
      {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Settings'),
        titleSpacing: 12,
        toolbarOpacity: 0.7,
        elevation: 4,
      ),

      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(HomeSettings, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
        ],
      ),
    );
  }
}

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(message)
        )
    );
  }

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
      appBar: AppBar(title: Text('Login Page')),
      body: Center(
        child: Container(
          height: 470,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Login', style: TextStyle(fontSize: 25),),
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
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeActivity()), (route)=>false);
                    mySnackBar('Logged in successfully', context);
                  },
                  child: Text('Sign in'),
                  style: formSubmit,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Signup()), (route)=>false,);
                  },
                  child: Text("Don't you have any account yet? Sign up"),
                  style: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(message)
        )
    );
  }

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

  confirmationDialogue(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
            child: AlertDialog(
              title: Text("Confirmation"),
              content: Text('Are you sure about your given information?'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      mySnackBar('Signed up successfully', context);
                      Navigator.of(context).pop();
                    },
                    style: buttonStyle1,
                    child: Text('Yes')),
                ElevatedButton(
                    onPressed: () {
                      mySnackBar('You are not signed up', context);
                      Navigator.of(context).pop();
                    },
                    style: buttonStyle2,
                    child: Text('No')),
              ],
            ));
      },
    );
  }

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
      appBar: AppBar(title: Text('Login Page')),
      body: Center(
        child: Container(
          height: 470,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Login', style: TextStyle(fontSize: 25),),
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
                    confirmationDialogue(context);
                  },
                  child: Text('Sign up'),
                  style: formSubmit,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()), (route)=>false,);
                  },
                  child: Text("Already a member? Sign in"),
                  style: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

