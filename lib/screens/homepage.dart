import 'dart:math';

import 'package:bubble_lens/bubble_lens.dart';
import 'package:bubble_profiles/models/User.dart';
import 'package:flutter/material.dart';

class HomePageWithBubbles extends StatelessWidget {
  const HomePageWithBubbles({super.key});

  List<int> getRandomColor() {
    List<int> colors = [
      Random().nextInt(255),
      Random().nextInt(255),
    ];
    return colors;
  }

  List<User> getUsersList() {
    List<User> users = [
      User(
          name: 'Alejandro',
          lastname: 'Gonzalez',
          profilePicture:
              "https://xsgames.co/randomusers/assets/avatars/male/70.jpg",
          colors: getRandomColor()),
      User(
          name: 'Alejandro',
          lastname: 'Gonzalez',
          profilePicture:
              "https://xsgames.co/randomusers/assets/avatars/male/10.jpg",
          colors: [0xffB3005E, 0xff6C00FF, 0xff000000]),
      User(
          name: 'Alejandro',
          lastname: 'Gonzalez',
          profilePicture:
              "https://xsgames.co/randomusers/assets/avatars/male/15.jpg",
          colors: [0xff7B2869, 0xffA9907E, 0xff7F167F]),
      User(
          name: 'Alejandro',
          lastname: 'Gonzalez',
          profilePicture:
              "https://xsgames.co/randomusers/assets/avatars/male/17.jpg",
          colors: [0xff820000, 0xff645CBB, 0xff263AEB]),
      User(
          name: 'Alejandro',
          lastname: 'Gonzalez',
          profilePicture:
              "https://xsgames.co/randomusers/assets/avatars/male/20.jpg",
          colors: [0xff804674, 0xff6CDC2F, 0xffFC7300])
    ];

    var sortedUsers = User.sortUsersByColor(users);
    return sortedUsers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: BubbleLens(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            widgets: getUsersList().map((e) {
              return Container(
                  width: 100,
                  height: 100,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 120,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: e.colors.map((e) => Color(e)).toList())),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(e.profilePicture),
                      ),
                    ),
                  ));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
