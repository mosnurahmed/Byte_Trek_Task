part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class LoadLocationsEvent extends LocationEvent {
  @override
  List<Object?> get props => [];
}
