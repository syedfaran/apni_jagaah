import 'dart:convert';
import 'package:apni_jagaah/source/core/exception.dart';
import 'package:http/http.dart';



class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(Uri uri, {Map<dynamic, dynamic>? params}) async {
    print(uri);
    final response = await _client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ServerException();
    }
  }

  dynamic post(Uri uri, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.post(
      uri,
      body: jsonEncode(params),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw ServerException();
    } else {
      throw ServerException();
    }
  }

}