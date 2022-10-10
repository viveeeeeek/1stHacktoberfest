// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hacktoberfest/entities/user.entities.dart';

import '../screens/detailed.screens.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.users,
    required this.size,
    required this.index,
  }) : super(key: key);
  final Users users;
  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        splashColor: Colors.orangeAccent.withOpacity(0.5),
        hoverColor: Colors.orangeAccent,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(
                      name: users.name, description: users.description)));
        },
        child: size.width < 784
            ? Container(
                height: size.height / 5,
                width: size.width / 3.4,
                decoration: BoxDecoration(
                    color: colorProvidor(index).withOpacity(0.5),
                    border:
                        Border.all(width: 3, color: const Color(0xFF00C598)),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Image.asset(
                        "assets/user.png",
                        alignment: Alignment.center,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            users.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: 50,
                width: 50,
                child: Container(
                    decoration: BoxDecoration(
                        color: colorProvidor(index).withOpacity(0.5),
                        border: Border.all(width: 3, color: Color(0xFF00C598)),
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width > 1000
                              ? 35
                              : size.width > 768
                                  ? 25
                                  : 20,
                        ),
                        Image.asset(
                          "assets/user.png",
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: size.width > 1000 ? 35 : 25,
                        ),
                        Text(
                          users.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: size.width > 1000 ? 35 : 25,
                        ),
                      ],
                    )),
              ),
      ),
    );
  }
}

Color colorProvidor(int index) {
  if (index % 4 == 0)
    return Color(0xFFB6EDDC);
  else if (index % 4 == 1)
    return Color(0xFFA3C26D);
  else if (index % 4 == 2)
    return Color(0xFFCA7C00);
  else
    return Color(0xFFDE430E);
}
