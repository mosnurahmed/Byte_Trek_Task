// lib/presentation/blocs/location_state.dart

part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final List<Location> locations;

  const LocationLoaded({required this.locations});

  @override
  List<Object?> get props => [locations];
}

class LocationError extends LocationState {}
