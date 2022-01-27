import 'package:flutter/material.dart';
import 'package:theme/theme_constraint.dart';
import 'package:theme/theme_manager.dart';
import 'package:theme/helper_widget.dart';
void main() {
  runApp(MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener(){
    if(mounted){
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text("Theme App",style:TextStyle(
            fontWeight: FontWeight.w800,
          fontSize: 40,
        ),),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        actions: [Switch(value: _themeManager.themeMode == ThemeMode.dark, onChanged: (newValue) {
          _themeManager.toggleTheme(newValue);
        })],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('images/1.jpg',
              ),
              ),

              addVerticalSpace(40),
              Text(
                "Coloring Birds",
                style: _textTheme.headline4?.copyWith(
                    color:isDark?Colors.white: Colors.black,fontWeight: FontWeight.bold,fontFamily: "Roboto-ThinItalic"
                ),
              ),
              addVerticalSpace(10),
              Text(
                "birds@gmail.com",
                style: _textTheme.subtitle1,
              ),
              addVerticalSpace(10),
              Text(
                "This is a simple Status",style: TextStyle(fontSize: 15),
              ),
              addVerticalSpace(20),
              TextField(),
              addVerticalSpace(20),
              ElevatedButton(child: Text("Just Click"), onPressed: () {}),
              addVerticalSpace(20),
              ElevatedButton(child: Text("Click Me"), onPressed: () {}),
           ] ,
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.blue), // For Test
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}