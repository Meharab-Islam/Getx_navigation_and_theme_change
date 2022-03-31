import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_routing/next_screen.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: const Color(0xFF253341)),
        scaffoldBackgroundColor: const Color(0xFF15202B),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DayNightSwitcher(
                            isDarkModeEnabled: isDarkMode,
                            onStateChanged: onStateChanged,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: DayNightSwitcherIcon(
                              isDarkModeEnabled: isDarkMode,
                              onStateChanged: onStateChanged,
                            ),
                          ),
                        ]),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(NextScreen(rName: 'Getx route'));
                  },
                  child: Text(
                    'Next Page',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onStateChanged(bool isDarkModeEnabled) {
    setState(() {
      this.isDarkMode = isDarkModeEnabled;
    });
  }
}
