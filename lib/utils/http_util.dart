import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class HttpUtil {
  static Future<Map<String, dynamic>>? getHttp(String url) async {
    try {
      final client = http.Client();
      Uri uri = Uri.parse(url);
      final joop = await client.get(uri);
      if (joop.statusCode == 200 || joop.statusCode == 201) {
        final data = jsonDecode(joop.body);
        return data;
      }
    } catch (e) {
      log('$e');
      throw Exception(e);
    }

    return null!;
  }

  static Future<Map<String, dynamic>>? postHttp(String url) async {
    try {
      final client = http.Client();
      Uri uri = Uri.parse(url);
      final joop = await client.post(uri);
      if (joop.statusCode == 200 || joop.statusCode == 201) {
        final data = jsonDecode(joop.body);
        return data;
      }
    } catch (e) {
      log('$e');
      throw Exception(e);
    }

    return null!;
  }

  static Future<Map<String, dynamic>>? updateHttp(String url) async {
    try {
      final client = http.Client();
      Uri uri = Uri.parse(url);
      final joop = await client.put(uri);
      if (joop.statusCode == 200 || joop.statusCode == 201) {
        final data = jsonDecode(joop.body);
        return data;
      }
    } catch (e) {
      log('$e');
      throw Exception(e);
    }

    return null!;
  }

  static Future<Map<String, dynamic>>? delete(String url) async {
    try {
      final client = http.Client();
      Uri uri = Uri.parse(url);
      final joop = await client.delete(uri);
      if (joop.statusCode == 200 || joop.statusCode == 201) {
        final data = jsonDecode(joop.body);
        return data;
      }
    } catch (e) {
      log('$e');
      throw Exception(e);
    }

    return null!;
  }
}
