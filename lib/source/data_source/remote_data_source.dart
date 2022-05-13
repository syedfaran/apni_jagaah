

import 'package:apni_jagaah/constant/network_String.dart';
import 'package:apni_jagaah/source/core/api_client.dart';
import 'package:apni_jagaah/source/model/json_placeholder.dart';
import 'package:apni_jagaah/source/model/property.dart';
import 'package:apni_jagaah/source/model/trusted_builder.dart';

abstract class RemoteDataSource{
  Future<JsonPlaceHolder> getJsonPlaceHolder();
  Future<List<Properties>> getProperties();
  Future<List<TrustedBuilder>> getTrustedBuilder();
}



class RemoteDataSourceImpl implements RemoteDataSource{
  final ApiClient _apiClient;
  const RemoteDataSourceImpl(this._apiClient);
  @override
  Future<JsonPlaceHolder> getJsonPlaceHolder()async {
    final Map<String,dynamic>  response = await _apiClient.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    return JsonPlaceHolder.fromJson(response);
    // print(movies);
    // return movies;
  }

  @override
  Future<List<Properties>> getProperties()async {
   final List response  = await _apiClient.get(Uri.parse(NetworkString.properties));

   return response.map<Properties>((e) => Properties.fromJson(e)).toList();
  }

  @override
  Future<List<TrustedBuilder>> getTrustedBuilder() async{
    final List response = await _apiClient.get(Uri.parse(NetworkString.trustedBuilder));
    return response.map((e) => TrustedBuilder.fromJson(e)).toList();
  }

}