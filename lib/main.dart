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
        theme:ThemeData(primarySwatch:Colors.deepOrange),
        darkTheme:ThemeData(primarySwatch:Colors.blue),
        color:Colors.deepOrangeAccent,
        debugShowCheckedModeBanner:false,
        home:HomeActivity()
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({Key? key}) : super(key: key);

  MySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Snackbar Generator'),
          titleSpacing: 12,
          toolbarOpacity: 0.7,
          elevation: 4,
          actions: [
            IconButton(onPressed: (){MySnackBar('The app is at initial condition, search will not work right now',context);}, icon: Icon(Icons.search)),
            IconButton(onPressed: (){MySnackBar('The app is at initial condition, comment will not work right now',context);}, icon: Icon(Icons.comment)),
            IconButton(onPressed: (){MySnackBar('The app is at initial condition, settings will not work right now',context);}, icon: Icon(Icons.settings)),
          ],
      ),
      body: Center(
        child: Text('Assalamu Alaikum waRahmatullahi waBarakatuh'),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        child: Icon(Icons.add_comment),
        onPressed: (){MySnackBar('This is a new message', context);},
      ),
    );
  }
}

