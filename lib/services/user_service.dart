import 'dart:convert';
import 'package:del/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  var addUrl = Uri.parse("http://192.168.0.101/del/server/add.php");
  var viewUrl = Uri.parse("http://192.168.0.101/del/server/view.php");
  var updateUrl = Uri.parse("http://192.168.0.101/del/server/update.php");
  var deleteUrl = Uri.parse("http://192.168.0.101/del/server/delete.php");

  Future<String> addUser(UserModel userModel) async {
    final response = await http.post(addUrl, body: userModel.toJsonAdd());
    if (response.statusCode == 200) {
      print("Add Response:${response.body}");
      return response.body;
    } else {
      return "Error";
    }
  }

  List<UserModel> userFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<UserModel>.from(data.map((item) => UserModel.fromJson(item)));
  }

  Future<List<UserModel>> getUser() async {
    final response = await http.get(viewUrl);
    if (response.statusCode == 200) {
      List<UserModel> list = userFromJson(response.body);
      return list;
    } else {
      return <UserModel>[];
    }
  }

  Future<String> updateUser(UserModel userModel) async {
    final response = await http.post(updateUrl, body: userModel.toJsonUpdate());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Error";
    }
  }

  Future<String> deleteUser(UserModel userModel) async {
    final response = await http.post(updateUrl, body: userModel.toJsonUpdate());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Error";
    }
  }
}
