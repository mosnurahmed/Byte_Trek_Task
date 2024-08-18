import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'core/network/api_service.dart';
import 'data/repositories/location_repository.dart';
import 'domain/usecases/get_locations_usecase.dart';
import 'presentation/blocs/location_bloc.dart';

void main() {
  final ApiService apiService = ApiService();
  final LocationRepository repository = LocationRepository(apiService);
  final GetLocationsUseCase getLocationsUseCase =
      GetLocationsUseCase(repository);

  runApp(App(locationBloc: LocationBloc(getLocationsUseCase)));
}
