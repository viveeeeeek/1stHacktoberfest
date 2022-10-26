import 'package:http/http.dart' as http;

import '../entities/user.entities.dart';

class Services {
  static const String url =
      'https://raw.githubusercontent.com/viveeeeeek/1stHacktoberfest/master/assets/user.data.json';

  static Future<List<Users>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final List<Users> users = Users.usersFromJson(response.body);
        users.sort((a, b) => a.name.compareTo(b.name));
        return users;
      } else if (404 == response.statusCode) {
        return List<Users>.empty();
      } else if (500 == response.statusCode) {
        return List<Users>.empty();
      } else if (503 == response.statusCode) {
        return List<Users>.empty();
      } else {
        return List<Users>.empty();
      }
    } catch (e) {
      return List<Users>.empty();
    }
  }
}
