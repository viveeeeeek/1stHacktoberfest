import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final name;
  final description;

  const DetailScreen({Key? key, this.name, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displaySize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                gradient:
                    LinearGradient(colors: [Colors.orange, Colors.yellow])),
          ),
        ),
        // backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.orange, Colors.yellow])),
          child: Column(
            children: [
              Expanded(child: SizedBox()),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
              ),
              Expanded(child: SizedBox()),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    height: 500,
                    width: 768 < displaySize.width
                        ? displaySize.width / 1
                        : displaySize.width,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
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
                                  color: Theme.of(context)
                                              .scaffoldBackgroundColor ==
                                          Colors.black
                                      ? Colors.white60
                                      : Colors.grey.withOpacity(0.3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                                .scaffoldBackgroundColor ==
                                            Colors.black
                                        ? Colors.white60
                                        : Colors.grey.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
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
                                          description,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Colors.black.withAlpha(215)),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
