import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/provider/favorite_item.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Favorite"),
      ),
      body: Column(
        children: [
          Expanded(child:
              Consumer<FavoriteItemProvider>(builder: (context, value, child) {
            return ListView.builder(
                itemCount: value.favoriteList.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    onTap: () {
                      if (value.favoriteList.contains(index)) {
                        value.removeFavorite(index);
                      } else {
                        value.addFavorite(index);
                      }
                    },
                    trailing: value.favoriteList.contains(index)
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_outline_outlined),
                    title: Text("item ${value.favoriteList[index]}"),
                  );
                }));
          }))
        ],
      ),
    );
  }
}
