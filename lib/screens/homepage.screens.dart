import 'package:flutter/material.dart';
import 'package:hacktoberfest/entities/user.entities.dart';
import 'package:hacktoberfest/screens/detailed.screens.dart';
import 'package:hacktoberfest/services/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  List<Users>? _users;
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          body: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img.png"), fit: BoxFit.cover)),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/banner.png",
                        height: size.height / 5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "CONTRIBUTERS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: _users == null ? 0 : _users!.length,
                            itemBuilder: (BuildContext context, int index) {
                              Users users = _users![index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  child: Row(
                                    children: [
                                      Expanded(child: SizedBox()),
                                      InkWell(
                                        splashColor: Colors.orangeAccent
                                            .withOpacity(0.5),
                                        hoverColor: Colors.orangeAccent,
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailScreen(
                                                          name: users.name,
                                                          description: users
                                                              .description)));
                                        },
                                        child: Container(
                                            height: size.height / 10,
                                            width: size.width > 1000
                                                ? size.width / 3.2
                                                : size.width > 768
                                                    ? size.width / 3
                                                    : size.width / 1.5,
                                            decoration: BoxDecoration(
                                                color:
                                                    Colors.orange.withAlpha(50),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
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
                                                  width: size.width > 1000
                                                      ? 35
                                                      : size.width > 768
                                                          ? 25
                                                          : 20,
                                                ),
                                                Text(
                                                  users.name,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: size.width > 1000
                                                      ? 35
                                                      : size.width > 768
                                                          ? 25
                                                          : 10,
                                                ),
                                              ],
                                            )),
                                      ),
                                      Expanded(child: SizedBox()),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  )))),
    );
  }
}

 



            //         