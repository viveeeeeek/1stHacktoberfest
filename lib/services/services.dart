import 'package:hacktoberfest/entities/user.entities.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../constants/assets.dart';

class Services {
  static const String url =
      'https://raw.githubusercontent.com/viveeeeeek/1stHacktoberfest/master/assets/user.data.json';

  static Future<List<Users>> getUsers() async {
    try {
      String res = await rootBundle.loadString(Assets.user_data);
      List<Users> users = usersFromJson(res);
      users.sort((a, b) => a.name.compareTo(b.name));
      return users;
    } catch (e) {
      print(e);
      return List<Users>.empty();
    }
  }
}
