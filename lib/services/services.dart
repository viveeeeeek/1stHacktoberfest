import 'package:http/http.dart' as http;
import 'package:hacktoberfest/entities/user.entities.dart';

class Services {
  static const String url =
      'https://raw.githubusercontent.com/viveeeeeek/1stHacktoberfest/master/assets/user.data.json';

  static Future<List<Users>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final List<Users> users = usersFromJson(response.body);
        users.sort((a, b) => a.name.compareTo(b.name));
        return users;
      } else if (404 == response.statusCode) {
        print("The requested resource was not found");
        return List<Users>.empty();
      } else if (500 == response.statusCode) {
        print("Internal Server Error");
        return List<Users>.empty();
      }else if (503 == response.statusCode) {
        print("Service Unavailable");
        return List<Users>.empty();
      } else {
        print("something went wrong");
        return List<Users>.empty();
      }
    } catch (e) {
      print(e);
      return List<Users>.empty();
    }
  }
}
