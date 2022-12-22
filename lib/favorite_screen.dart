import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/my_favorite_screen.dart';
import 'package:providerproject/provider/favorite_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Item"),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=>MyFavoriteScreen()));
          }, icon: const Icon(Icons.favorite))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index){
            return Consumer<FavoriteItemProvider>(builder: (context,value,child){
              return ListTile(
              onTap: () {
                if(value.favoriteList.contains(index)){
                  value.removeFavorite(index);
                }else{
                  value.addFavorite(index);
                }
              },
              title:  Text("item $index"),
              trailing:value.favoriteList.contains(index)?Icon(Icons.favorite) :Icon(Icons.favorite_outline_outlined),
            );
            });
          })),
        ],
      ),
    );
  }
}
