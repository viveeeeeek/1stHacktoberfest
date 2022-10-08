import 'package:flutter/material.dart';
import 'package:hacktoberfest/controller/dark_theme_provider.dart';
import 'package:hacktoberfest/entities/user.entities.dart';
import 'package:hacktoberfest/screens/detailed.screens.dart';
import 'package:hacktoberfest/services/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final darkMode;

  HomePage({this.darkMode = false});

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
    getUsers();
  }

  getUsers() {
    _loading = true;
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  searchUser(String value) {
    setState(() {
      _loading = true;
    });
    if (value != "") {
      Iterable<Users> getUser = _users!
          .where((e) => e.name.toLowerCase().contains(value.toLowerCase()));

      setState(() {
        _loading = false;
        _users = getUser.toList();
      });
    } else {
      getUsers();
    }
  }

  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Uri toLaunch = Uri.parse('https://github.com/viveeeeeek/1stHacktoberfest');
    final size = MediaQuery.of(context).size;
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final double itemHeight =
        size.width > 784 ? size.height / 8 : size.height / 7;
    final double itemWidth = size.width / 3.2;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black12),
            child: IconButton(
                icon: Icon(
                  Icons.lightbulb,
                  color: widget.darkMode ? Colors.white : Colors.yellow,
                ),
                onPressed: () {
                  print(themeChange.dTheme);
                  themeChange.dTheme = !themeChange.dTheme;
                }),
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 150,
                backgroundColor: widget.darkMode
                    ? Colors.black
                    : Color.fromARGB(255, 211, 237, 239),
                flexibleSpace: FlexibleSpaceBar(
                  // title: Text('SilverAppBar'),
                  background: Image.asset(
                    widget.darkMode
                        ? "assets/banner_dark.png"
                        : "assets/banner.png",
                  ),
                ),
                // pinned: true,
                // floating: true,
                // snap: true,
              )
            ];
          },
          body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                // color: Colors.black,
                image: DecorationImage(
                    image: widget.darkMode
                        ? AssetImage("assets/img1.png")
                        : AssetImage("assets/img.png"),
                    fit: BoxFit.cover) //110E0C
                ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                children: [
                  // Image.asset(
                  //   widget.darkMode
                  //       ? "assets/banner_dark.png"
                  //       : "assets/banner.png",
                  //   height: size.height / 5,
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Text(
                    "CONTRIBUTERS",
                    style: TextStyle(
                      color: widget.darkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: TextFormField(
                      style: TextStyle(
                        color: widget.darkMode ? Colors.white : Colors.black,
                      ),
                      cursorColor:
                          widget.darkMode ? Colors.white : Colors.black,
                      decoration: InputDecoration(
                        hintText: "Search Contributers",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintStyle: TextStyle(
                            color:
                                widget.darkMode ? Colors.white : Colors.black),
                        fillColor:
                            widget.darkMode ? Colors.white : Colors.black,
                        focusColor:
                            widget.darkMode ? Colors.white : Colors.black,
                        hoverColor:
                            widget.darkMode ? Colors.white : Colors.black,
                      ),
                      onChanged: (value) => searchUser(value),
                    ),
                  ),
                  !_loading
                      ? Expanded(
                          child: GridView.builder(
                              itemCount: _users == null ? 0 : _users!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          MediaQuery.of(context).orientation ==
                                                  Orientation.landscape
                                              ? 3
                                              : 2,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8,
                                      childAspectRatio:
                                          (itemWidth / itemHeight)),
                              itemBuilder: (BuildContext context, int index) {
                                Users users = _users![index];
                                return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: InkWell(
                                      splashColor:
                                          Colors.orangeAccent.withOpacity(0.5),
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
                                      child: size.width < 784
                                          ? Container(
                                              height: size.height / 5,
                                              width: size.width / 3.4,
                                              decoration: BoxDecoration(
                                                  color: colorProvidor(index)
                                                      .withOpacity(0.5),
                                                  border: Border.all(
                                                      width: 3,
                                                      color: const Color(
                                                          0xFF00C598)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              30.0))),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 25,
                                                  ),
                                                  Center(
                                                    child: Image.asset(
                                                      "assets/user.png",
                                                      alignment:
                                                          Alignment.center,
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
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          users.name,
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                                      color:
                                                          colorProvidor(index)
                                                              .withOpacity(0.5),
                                                      border: Border.all(
                                                          width: 3,
                                                          color: Color(
                                                              0xFF00C598)),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  50.0))),
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
                                                            : 25,
                                                      ),
                                                      Text(
                                                        users.name,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        width: size.width > 1000
                                                            ? 35
                                                            : 25,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                    ));
                              }),
                        )
                      : CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),

        //Floating action button for github
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
            _launched = _launchInBrowser(toLaunch);
          }),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: FittedBox(child: Text('Github')),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          backgroundColor: Colors.greenAccent,
          elevation: 6,
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
