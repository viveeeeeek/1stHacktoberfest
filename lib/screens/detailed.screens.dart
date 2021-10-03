import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final name;
  final description;

  const DetailScreen({Key? key, this.name, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.blue,
          child: Column(
            children: [
              Expanded(child: SizedBox()),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
              ),
              Expanded(child: SizedBox()),
              Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 5,
                        width: 75,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(25))),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        description,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withAlpha(215)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
