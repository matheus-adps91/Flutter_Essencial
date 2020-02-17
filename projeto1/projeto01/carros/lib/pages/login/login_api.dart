import 'dart:convert';
import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      var url = 'http://carros-springboot.herokuapp.com/api/v2/login';
      Map params = {
        'username': login,
        'password': senha,
      };
      Map<String, String> headers = {"Content-Type": "application/json"};
      String encodedParams = json.encode(params);
      var response =
          await http.post(url, body: encodedParams, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map undecodedResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        final user = Usuario.fromJson(undecodedResponse);
        user.save();
        return ApiResponse.ok(user);
      }

      return ApiResponse.error(undecodedResponse["error"]);
    } catch (error, exception) {
      print('Erro no login $error > $exception');
      return ApiResponse.error("Não foi possível fazer o login");
    }
  }

}
