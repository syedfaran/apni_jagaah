import 'dart:async';

import 'package:apni_jagaah/source/core/exception.dart';
import 'package:apni_jagaah/source/model/json_placeholder.dart';
import 'package:apni_jagaah/source/repository/json_placeholder_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';


part 'temp_event.dart';

part 'temp_state.dart';

class TempBloc extends Bloc<TempEvent, TempState> {
  final JsonPlaceHolderRepository _repository;

  TempBloc(this._repository) : super(const TempInitial()) {
    on<GetJsonData>((event, emit) async {
      emit(const TempLoading());
      final  eitherResponse = await _repository.getJsonPlaceHolder();
      emit(
        eitherResponse.fold(
            (failure) => TempError(message: _mapFailureToMessage(failure)),
            (data) => TempLoaded(placeHolder: data)),
      );
      // await   _repository.getJsonPlaceHolderF()
      //     .then((value) => emit(TempLoaded(placeHolder: value))).onError((error,
      // stackTrace) => emit(const TempError(message: 'SomeThing went Wrong')));

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
