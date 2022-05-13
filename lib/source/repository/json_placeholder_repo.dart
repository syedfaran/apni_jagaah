import 'package:apni_jagaah/source/core/exception.dart';
import 'package:apni_jagaah/source/data_source/remote_data_source.dart';
import 'package:apni_jagaah/source/model/json_placeholder.dart';
import 'package:apni_jagaah/source/model/property.dart';
import 'package:apni_jagaah/source/model/trusted_builder.dart';
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

  Future<Either<Failure, List<Properties>>> getProperties() async {
    try {
      final List<Properties> propertiesList = await _remoteDataSource.getProperties();
      return Right(propertiesList);
    } on ServerException {
      return Left(ServerFailure());
    } on Exception {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, List<TrustedBuilder>>> getTrustedBuilder() async {
    try {
      final List<TrustedBuilder> propertiesList = await _remoteDataSource.getTrustedBuilder();
      return Right(propertiesList);
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
