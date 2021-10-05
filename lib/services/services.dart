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
        return users;
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
