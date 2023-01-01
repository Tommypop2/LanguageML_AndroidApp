import 'package:flutter/material.dart';
import 'package:word_gender_guessers_flutter_app/pages/french_word_gender_guesser_widget.dart';
import 'package:word_gender_guessers_flutter_app/pages/language_guesser_widget.dart';
import 'package:word_gender_guessers_flutter_app/pages/settings/ColourSettingsPage.dart';
import "pages/german_word_gender_guesser_widget.dart";
import "storage/settings_holder.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SettingsHolder.loadSettings();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CoolApp',
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(),
        "/settingspage/colour": (context) => const ColourCustomisationsPage(
              title: '',
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    LanguageGuesser(
      key: UniqueKey(),
    ),
    GermanWordGenderGuesser(
      key: UniqueKey(),
    ),
    FrenchWordGenderGuesser(
      key: UniqueKey(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SettingsHolder.appBarBackgroundColour,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                child: Text(
                  ["Languages", "German", "French"][_selectedIndex],
                  style: TextStyle(
                    color: SettingsHolder.appBarAccentColour,
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  Navigator.pushNamed(context, "/settingspage/colour").then(
                    (_) {
                      setState(() {});
                    },
                  );
                },
                tooltip: "Settings",
                icon: Icon(
                  Icons.settings,
                  color: SettingsHolder.appBarAccentColour,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: SettingsHolder.mainBackgroundColour,
        child: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.language,
              color: SettingsHolder.navigationAccentColour,
            ),
            label: "Languages",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.language,
              color: SettingsHolder.navigationAccentColour,
            ),
            label: "German",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.language,
              color: SettingsHolder.navigationAccentColour,
            ),
            label: "French",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: SettingsHolder.buttonColour,
        backgroundColor: SettingsHolder.navigationBackgroundColour,
      ),
    );
  }
}
