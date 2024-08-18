import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/location.dart';
import '../../domain/usecases/get_locations_usecase.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocationsUseCase getLocations;

  LocationBloc(this.getLocations) : super(LocationLoading()) {
    on<LoadLocationsEvent>((event, emit) async {
      try {
        final locations = await getLocations();
        emit(LocationLoaded(locations: locations));
      } catch (_) {
        emit(LocationError());
      }
    });
  }
}
