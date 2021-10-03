import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hacktoberfest/screens/detailed.screens.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Column(
          children: [
            Image.asset("assets/banner.png"),
            SizedBox(
              height: 10,
            ),
            Text(
              "CONTRIBUTERS",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
            ),
            SizedBox(
              height: 2,
            ),
            Expanded(
              child: FutureBuilder(
                builder: (context, snapshot) {
                  var showData = json.decode(snapshot.data.toString());
                  return ListView.builder(
                      itemCount: showData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                          name: showData[index]['name'],
                                          description: showData[index]
                                              ['description'])));
                            },
                            child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.orange.withAlpha(50),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                child: Row(
                                  children: [
                                    SizedBox(width: 25,),
                                    Image.asset(
                                      "assets/user.png",
                                      height: 33,
                                      width: 33,
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      showData[index]['name'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
                          ),
                        );
                      });
                },
                future: DefaultAssetBundle.of(context)
                    .loadString("assets/user.data.json"),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      )),
    );
    // Column(
    //   children: [
    //
    //   ],
    // ));
  }
}
