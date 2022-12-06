import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plantree/models/tree_planted.dart';
import 'package:plantree/services/secure_storage_service.dart';

import 'auth_service.dart';
import 'helper_service.dart';

abstract class TreePlantedService {
  Future<List<TreePlanted>> getAll();
  Future<TreePlanted> get(int id);
  Future<TreePlanted> update(TreePlanted tree);
  Future<bool> delete(int id);
  Future<TreePlanted> create(TreePlanted tree);
}

const String treePlantedPath = '/trees_planted/';

class TreePlantedServiceImpl implements TreePlantedService {
  @override
  Future<TreePlanted> create(TreePlanted treePlanted) async {
    try {
      final response = await http.post(
        HelperService.buildUri(treePlantedPath),
        headers: HelperService.buildHeaders(AuthService.token),
        body: jsonEncode({
          'name': treePlanted.name,
          'description': treePlanted.description,
          'date': treePlanted.date,
          'local': treePlanted.local,
          'tree': treePlanted.tree
        }),
      );

      if (response.statusCode.toInt() == 201) {
        return TreePlanted.fromJson(json.decode(response.body));
      } else {
        throw Exception('Erro');
      }
    } catch (error) {
      throw Exception('Erro ao consultar server!');
    }
  }

  @override
  Future<bool> delete(int id) async {
    final response = await http.delete(
      HelperService.buildUri(treePlantedPath + id.toString()),
      headers: HelperService.buildHeaders(AuthService.token),
    );
    return response.statusCode.toInt() == 202;
  }

  @override
  Future<TreePlanted> get(int id) async {
    try {
      final response = await http.get(
          HelperService.buildUri(treePlantedPath + id.toString()),
          headers: HelperService.buildHeaders(AuthService.token));
      if (response.statusCode.toInt() == 200) {
        return TreePlanted.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load Tree Planted');
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<TreePlanted>> getAll() async {
    try {
      final response = await http.get(HelperService.buildUri(treePlantedPath),
          headers: HelperService.buildHeaders(AuthService.token));

      if (response.statusCode.toInt() == 200) {
        return (json.decode(response.body) as List)
            .map((i) => TreePlanted.fromJson(i))
            .toList();
      } else {
        throw Exception('Failed to load TreePlanted');
      }
    } catch (error) {
      throw Exception('Failed to load Tree Planted $error');
    }
  }

  @override
  Future<TreePlanted> update(treePlanted) async {
    final response = await http.put(
      HelperService.buildUri(treePlantedPath + treePlanted.id.toString()),
      headers: HelperService.buildHeaders(AuthService.token),
      body: jsonEncode(<String, String>{
        'name': treePlanted.name,
        'description': treePlanted.description,
        'date': treePlanted.date,
        'local': treePlanted.local,
        'tree': treePlanted.tree,
      }),
    );
    if (response.statusCode.toInt() == 200) {
      return treePlanted;
    } else {
      throw Exception('Failed to update tree');
    }
  }
}
