import 'package:apni_jagaah/source/core/exception.dart';
import 'package:apni_jagaah/source/data_source/remote_data_source.dart';
import 'package:apni_jagaah/source/model/json_placeholder.dart';
import 'package:dartz/dartz.dart';


class JsonPlaceHolderRepository {
  final RemoteDataSource _remoteDataSource;
  const JsonPlaceHolderRepository(this._remoteDataSource);

  Future<Either<Failure, JsonPlaceHolder>> getJsonPlaceHolder() async {
    try {
      final JsonPlaceHolder jsonPlaceHolder = await _remoteDataSource.getJsonPlaceHolder();
      return Right(jsonPlaceHolder);
    } on ServerException {
      return Left(ServerFailure());
    } on Exception {
      return Left(ServerFailure());
    }
  }

  // Future<dynamic> getJsonPlaceHolderF() async {
  //   try {
  //     final JsonPlaceHolder jsonPlaceHolder = await _remoteDataSource.getJsonPlaceHolder();
  //     return jsonPlaceHolder;
  //   } on ServerException {
  //     return ServerFailure();
  //   } on Exception {
  //     return ServerFailure();
  //   }
  // }
}
