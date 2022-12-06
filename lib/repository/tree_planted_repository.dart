import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:plantree/models/tree_planted.dart';

// ignore: constant_identifier_names
const API_URL_BASE = 'https://jsonplaceholder.typicode.com';

// ignore: constant_identifier_names
const Map<String, String> API_HEADERS = {
  'Content-Type': 'application/json; charset=UTF-8'
};

class TreePlantedRepository {
  Future<TreePlanted> getTreePlanted(int id) async {
    try {
      final response =
          await http.get(Uri.parse('$API_URL_BASE/trees_planted/$id'));
      if (response.statusCode == 200) {
        return TreePlanted.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load Tree Planted');
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<List<TreePlanted>> getAllTreePlanted() async {
    try {
      final response = await http.get(Uri.parse('$API_URL_BASE/trees_planted'));
      if (response.statusCode == 200) {
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

  Future<bool> createTreePlanted(TreePlanted treePlanted) async {
    final response = await http.post(
      Uri.parse('$API_URL_BASE/trees_planted'),
      headers: API_HEADERS,
      body: jsonEncode(<String, String>{
        'name': treePlanted.name,
        'description': treePlanted.description,
        'date': treePlanted.date,
        'local_id': treePlanted.localId.toString(),
        'tree_id': treePlanted.treeId.toString(),
      }),
    );
    return response.statusCode == 201;
  }

  Future<bool> deleteTreePlanted(int id) async {
    final response = await http.delete(
      Uri.parse('$API_URL_BASE/trees_planted/$id'),
      headers: API_HEADERS,
    );
    return response.statusCode == 202;
  }

  Future<bool> updateTreePlanted(TreePlanted treePlanted) async {
    final response = await http.put(
      Uri.parse('$API_URL_BASE/trees_planted/${treePlanted.id}'),
      headers: API_HEADERS,
      body: jsonEncode(<String, String>{
        'name': treePlanted.name,
        'description': treePlanted.description,
        'date': treePlanted.date,
        'local_id': treePlanted.localId.toString(),
        'tree_id': treePlanted.treeId.toString(),
      }),
    );
    return response.statusCode == 200;
  }
}
