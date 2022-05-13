import 'dart:async';

import 'package:apni_jagaah/presentation/blocs/properties_bloc/properties_bloc.dart';
import 'package:apni_jagaah/source/core/exception.dart';
import 'package:apni_jagaah/source/model/trusted_builder.dart';
import 'package:apni_jagaah/source/repository/json_placeholder_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'trusted_builder_event.dart';
part 'trusted_builder_state.dart';

class TrustedBuilderBloc extends Bloc<TrustedBuilderEvent, TrustedBuilderState> {
  final JsonPlaceHolderRepository _repository;
  TrustedBuilderBloc(this._repository) : super(const TrustedBuilderInitial()) {
    on<TrustedBuilderEvent>((event, emit)async {
      emit(const TrustedBuilderLoading());
      final Either<Failure, List<TrustedBuilder>> eitherResponse = await _repository.getTrustedBuilder();
      emit(eitherResponse.fold(
              (failure) => TrustedBuilderError(message: _mapFailureToMessage(failure)),
              (properties) => TrustedBuilderLoaded(trustedBuilder: properties)));
    });
  }
}





String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}