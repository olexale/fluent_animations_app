import 'package:fluent_animations_app/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:random_user/models.dart';
import 'package:random_user/random_user.dart';

class GridPage extends StatefulWidget {
  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  final api = RandomUser();
  List<User> profiles;
  int selectedProfileIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
            future: api.getUsers(results: 20, seed: 'flutter'),
            builder:
                (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
              if (!snapshot.hasData)
                return const Center(child: CircularProgressIndicator());

              profiles = snapshot.data;
              return OrientationBuilder(
                builder: (context, orientation) => GridView.builder(
                    itemCount: profiles.length,
                    padding: const EdgeInsets.all(6.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            orientation == Orientation.portrait ? 2 : 3,
                        childAspectRatio: 1.5),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () =>
                            setState(() => selectedProfileIndex = index),
                        child: GridItem(
                            profile: profiles[index],
                            isSelected: index == selectedProfileIndex),
                      );
                    }),
              );
            }),
      ),
    );
  }
}
