import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/location.dart';

class LocationDetailPage extends StatefulWidget {
  final Location location;

  LocationDetailPage({required this.location});

  @override
  _LocationDetailPageState createState() => _LocationDetailPageState();
}

class _LocationDetailPageState extends State<LocationDetailPage> {
  late Future<void> _fetchImage;
  bool _isImageLoaded = false;
  String _imageUrl = '';

  @override
  void initState() {
    super.initState();
    _fetchImage = _fetchAndStoreImage();
  }

  Future<void> _fetchAndStoreImage() async {
    try {
      final url = getImageUrl(widget.location.img);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          _isImageLoaded = true;
          _imageUrl = url;
        });
      } else {
        setState(() {
          _isImageLoaded = false;
        });
      }
    } catch (e) {
      setState(() {
        _isImageLoaded = false;
      });
    }
  }

  String getImageUrl(String imgPath) {
    const String baseUrl = 'https://backend.houston24hourer.com/storage/';
    return Uri.encodeFull('$baseUrl$imgPath');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.location.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<void>(
          future: _fetchImage,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error fetching image'));
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_isImageLoaded)
                      Image.network(
                        _imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.error,
                            size: 100,
                          ); // Show error icon if image fails to load
                        },
                      ),
                    SizedBox(height: 16),
                    Text(
                      widget.location.title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_city),
                        SizedBox(width: 8),
                        Text(
                          '${widget.location.city}, ${widget.location.state}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.home),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            widget.location.address,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 8),
                        Text(
                          widget.location.tel,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.pin_drop),
                        SizedBox(width: 8),
                        Text(
                          'Latitude: ${widget.location.latitude.toStringAsFixed(4)}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.pin_drop),
                        SizedBox(width: 8),
                        Text(
                          'Longitude: ${widget.location.longitude.toStringAsFixed(4)}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      widget.location.content,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
