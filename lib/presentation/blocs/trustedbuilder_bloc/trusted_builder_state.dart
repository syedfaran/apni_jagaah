part of 'trusted_builder_bloc.dart';

@immutable
abstract class TrustedBuilderState {
  const TrustedBuilderState();
}

class TrustedBuilderInitial extends TrustedBuilderState {
  const TrustedBuilderInitial();
}
class TrustedBuilderLoading extends TrustedBuilderState {
  const TrustedBuilderLoading();
}
class TrustedBuilderLoaded extends TrustedBuilderState {
  final List<TrustedBuilder> trustedBuilder;
  const TrustedBuilderLoaded({required this.trustedBuilder});
}
class TrustedBuilderError extends TrustedBuilderState {
  final String message;
  const TrustedBuilderError({required this.message});
}
