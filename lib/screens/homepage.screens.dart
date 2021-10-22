import 'package:flutter/material.dart';
import 'package:hacktoberfest/controller/dark_theme_provider.dart';
import 'package:hacktoberfest/entities/user.entities.dart';
import 'package:hacktoberfest/screens/detailed.screens.dart';
import 'package:hacktoberfest/services/services.dart';
import 'package:provider/provider.dart';

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
    final themeChange = Provider.of<DarkThemeProvider>(context);

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
                Image.asset(
                  widget.darkMode
                      ? "assets/banner_dark.png"
                      : "assets/banner.png",
                  height: size.height / 5,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "CONTRIBUTERS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                !_loading
                    ? Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        (MediaQuery.of(context).orientation ==
                                                Orientation.landscape)
                                            ? 2
                                            : 2),
                            itemCount: _users == null ? 0 : _users!.length,
                            itemBuilder: (BuildContext context, int index) {
                              Users users = _users![index];
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: SizedBox(),
                                      ),
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
                                                      description:
                                                          users.description),
                                            ),
                                          );
                                        },
                                        child: Container(
                                            height: size.height / 10,
                                            width: size.width > 500
                                                ? size.width / 3.2
                                                : size.width > 768
                                                    ? size.width / 3
                                                    : size.width / 1.5,
                                            decoration: BoxDecoration(
                                              color: colorProvidor(index)
                                                  .withOpacity(0.5),
                                              border: Border.all(
                                                width: 3,
                                                color: Color(0xFF00C598),
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50.0),
                                              ),
                                            ),
                                            child: Column(
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
                                      Expanded(
                                        child: SizedBox(),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    : CircularProgressIndicator(),
              ],
            ),
          ),
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
