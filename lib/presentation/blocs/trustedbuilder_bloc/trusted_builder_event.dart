part of 'trusted_builder_bloc.dart';

@immutable
abstract class TrustedBuilderEvent {
  const TrustedBuilderEvent();
}

class GetTrustedBuilder extends TrustedBuilderEvent{
  const GetTrustedBuilder();
}
