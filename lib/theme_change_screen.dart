import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/provider/theme_changer_provider.dart';

import 'favorite_screen.dart';

class ThemeChangeScreen extends StatelessWidget {
  const ThemeChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ThemeMode Screen"),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title:const Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode, 
              onChanged: themeChanger.setTheme),
          RadioListTile<ThemeMode>(
            title:const Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode, 
              onChanged: themeChanger.setTheme),
          RadioListTile<ThemeMode>(
            title:const Text("System Mode"),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode, 
              onChanged: themeChanger.setTheme)  ,

          const SizedBox(height: 50,)  ,
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>const FavoriteScreen()));
          }, child: const Text("Done"))        
        ],
      ),
      drawer: Drawer(
        child: Column(children:const <Widget> [
          SizedBox(height: 150,),
          Icon(Icons.home)
        ],),
      ),
    );
  }
}
