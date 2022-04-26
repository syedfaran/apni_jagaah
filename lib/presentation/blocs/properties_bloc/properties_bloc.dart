import 'dart:async';

import 'package:apni_jagaah/source/core/exception.dart';
import 'package:apni_jagaah/source/model/property.dart';
import 'package:apni_jagaah/source/repository/json_placeholder_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'properties_event.dart';

part 'properties_state.dart';

class PropertiesBloc extends Bloc<PropertiesEvent, PropertiesState> {
  final JsonPlaceHolderRepository _repository;

  PropertiesBloc(this._repository) : super(PropertiesInitial()) {
    on<GetProperty>((event, emit) async {
      emit(PropertiesLoading());
      final Either<Failure, List<Properties>> eitherResponse = await _repository.getProperties();
      emit(eitherResponse.fold(
          (failure) => PropertiesError(message: _mapFailureToMessage(failure)),
          (properties) => PropertiesLoaded(properties: properties)));
    });
  }
}

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}
