import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final int id;
  final String title;
  final String name;
  final String tel;
  final String city;
  final String state;
  final String address;
  final double latitude;
  final double longitude;
  final String img;
  final String content;

  Location({
    required this.id,
    required this.title,
    required this.name,
    required this.tel,
    required this.city,
    required this.state,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.img,
    required this.content,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        name,
        tel,
        city,
        state,
        address,
        latitude,
        longitude,
        img,
        content
      ];
}
