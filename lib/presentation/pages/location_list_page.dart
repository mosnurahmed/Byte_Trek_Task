import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/location_bloc.dart';
import '../widgets/location_list_item.dart';

class LocationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Locations',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LocationLoaded) {
            return ListView.builder(
              itemCount: state.locations.length,
              itemBuilder: (context, index) {
                return LocationListItem(location: state.locations[index]);
              },
            );
          } else if (state is LocationError) {
            return Center(child: Text('Failed to load locations'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
