import '../../domain/entities/location.dart';

class LocationModel extends Location {
  LocationModel({
    required int id,
    required String title,
    required String name,
    required String tel,
    required String city,
    required String state,
    required String address,
    required double latitude,
    required double longitude,
    required String img,
    required String content,
  }) : super(
          id: id,
          title: title,
          name: name,
          tel: tel,
          city: city,
          state: state,
          address: address,
          latitude: latitude,
          longitude: longitude,
          img: img,
          content: content,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      title: json['title'],
      name: json['name'],
      tel: json['tel'],
      city: json['city'],
      state: json['state'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      img: json['img'],
      content: json['content'],
    );
  }
}
