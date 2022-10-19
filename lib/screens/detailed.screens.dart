import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacktoberfest/controller/dark_theme_provider.dart';
import 'package:hacktoberfest/utils/functions.dart';
import 'package:hacktoberfest/widgets/image_widget.dart';
import 'package:hacktoberfest/utils/extension.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final String? name;
  final String? description;
  final int index;

  const DetailScreen(
      {Key? key, required this.name, required this.description, this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displaySize = MediaQuery.of(context).size;
    final bool isDark = Provider.of<DarkThemeProvider>(context).dTheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: isDark ? Colors.grey : Colors.black,
        onPressed: () {
          try {
            Functions.openLinkInBrowser(
                "https://github.com/${name?.toGithubUsername()}");
          } catch (e) {
            var snackBar = SnackBar(
              content: Text(e.toString()),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Icon(CupertinoIcons.profile_circled),
      ),
      appBar: _buildAppbar(context),
      // backgroundColor: Colors.white,
      body: _buildBody(displaySize, context),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          size: 25,
          color: Colors.black,
        ),
        onPressed: Navigator.of(context).pop,
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.yellow],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(Size displaySize, BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.yellow],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "user_image_$index",
                    child: ImageWidget(
                      name == null
                          ? ""
                          : 'https://github.com/${name!.toGithubUsername()}.png',
                      height: 160,
                      width: 160,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      name.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            _buildCommentPanel(displaySize, context)
          ],
        ),
      ),
    );
  }

  Widget _buildCommentPanel(Size displaySize, BuildContext context) {
    return Expanded(
      child: Container(
        width:
            768 < displaySize.width ? displaySize.width / 1 : displaySize.width,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: displaySize.width > 1000
              ? EdgeInsets.fromLTRB(200, 0, 200, 0)
              : displaySize.width > 768
                  ? EdgeInsets.fromLTRB(50, 0, 50, 0)
                  : displaySize.width > 480
                      ? EdgeInsets.fromLTRB(25, 0, 25, 0)
                      : EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 5,
                  width: 75,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor ==
                              Colors.black
                          ? Colors.white60
                          : Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: _buildCommentBubble(context, displaySize),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildCommentBubble(BuildContext context, Size displaySize) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor == Colors.black
              ? Colors.white60
              : Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: displaySize.width > 768
            ? EdgeInsets.fromLTRB(50, 0, 50, 0)
            : EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                description.toString(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withAlpha(215)),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
