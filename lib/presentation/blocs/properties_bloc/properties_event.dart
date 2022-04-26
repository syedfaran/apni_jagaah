part of 'properties_bloc.dart';

@immutable
abstract class PropertiesEvent {
  const PropertiesEvent();
}

class GetProperty extends PropertiesEvent{
  const GetProperty();
}
