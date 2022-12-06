import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plantree/services/secure_storage_service.dart';

import '../exceptions/form_exceptions.dart';
import '../exceptions/secure_storage_exceptions.dart';
import '../models/user.dart';
import 'helper_service.dart';

class AuthService {
  static const String loginPath = '/auth/login/';
  static const String registerPath = '/auth/register/';
  static String token = '';
  static String id = '';

  static Future<User> loadUser() async {
    final json = await SecureStorageService.storage.read(
      key: SecureStorageService.userKey,
    );
    if (json != null) {
      return User.fromJson(jsonDecode(json));
    } else {
      throw SecureStorageNotFoundException();
    }
  }

  static void saveUser(User user) async {
    await SecureStorageService.storage.write(
      key: SecureStorageService.userKey,
      value: user.toJson(),
    );
  }

  static Future<User> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await http.post(
      HelperService.buildUri(registerPath),
      headers: HelperService.buildHeaders(null),
      body: jsonEncode(
        {'email': email, 'password': password, 'name': name},
      ),
    );
    switch (response.statusCode.toInt()) {
      case 201:
        return User(id: 0, email: email, name: name, token: '');
      case 400:
        throw FormGeneralException(message: 'Erro ao processar request');
      case 300:
      case 500:
      default:
        throw FormGeneralException(message: 'Erro ao consultar server!');
    }
  }

  static Future<void> logout() async {
    await SecureStorageService.storage.delete(
      key: SecureStorageService.userKey,
    );
  }

  static Future<User> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      HelperService.buildUri(loginPath),
      headers: HelperService.buildHeaders(null),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
    );

    switch (response.statusCode.toInt()) {
      case 200:
        final json = jsonDecode(response.body);
        final user = User.fromJson(json);

        saveUser(user);
        token = user.token;
        id = user.id.toString();
        print(id);
        return user;
      case 400:
        throw FormGeneralException(message: 'Dados incorretos/inválidos');
      case 300:
      case 500:
      default:
        throw FormGeneralException(message: 'Erro ao consultar servidor!');
    }
  }
}
