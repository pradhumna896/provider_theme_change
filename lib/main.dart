import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/provider/favorite_item.dart';
import 'package:providerproject/provider/theme_changer_provider.dart';
import 'package:providerproject/theme_change_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteItemProvider()),
        ChangeNotifierProvider(create: (context) => ThemeChangerProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeChangerProvider>(context);
        return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.deepOrange,
                iconTheme: const IconThemeData(color: Colors.deepOrange)),
            darkTheme: ThemeData(
                appBarTheme: const AppBarTheme(color: Colors.teal),
                primaryColor: Colors.teal,
                primarySwatch: Colors.teal,
                brightness: Brightness.dark,
                iconTheme: const IconThemeData(color: Colors.teal)),
            home: const ThemeChangeScreen());
      }),
    );
  }
}
