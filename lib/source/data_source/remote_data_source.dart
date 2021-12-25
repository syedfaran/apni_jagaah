

import 'package:apni_jagaah/source/core/api_client.dart';
import 'package:apni_jagaah/source/model/json_placeholder.dart';

abstract class RemoteDataSource{
  Future<JsonPlaceHolder> getJsonPlaceHolder();
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

}