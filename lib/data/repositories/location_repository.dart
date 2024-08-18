import '../models/location_model.dart';
import '../../core/network/api_service.dart';

class LocationRepository {
  final ApiService apiService;

  LocationRepository(this.apiService);

  Future<List<LocationModel>> getLocations() {
    return apiService.fetchLocations();
  }
}
