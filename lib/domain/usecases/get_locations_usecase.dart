import '../entities/location.dart';
import '../../data/repositories/location_repository.dart';

class GetLocationsUseCase {
  final LocationRepository repository;

  GetLocationsUseCase(this.repository);

  Future<List<Location>> call() {
    return repository.getLocations();
  }
}
