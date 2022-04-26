part of 'properties_bloc.dart';

@immutable
abstract class PropertiesState {
  const PropertiesState();
}

class PropertiesInitial extends PropertiesState {}
class PropertiesLoading extends PropertiesState {}
class PropertiesLoaded extends PropertiesState {
  final List<Properties> properties;

  const PropertiesLoaded({required this.properties });
}
class PropertiesError extends PropertiesState {
  final String message;
  const PropertiesError({required this.message});
}
