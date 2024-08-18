import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/pages/location_list_page.dart';
import 'presentation/blocs/location_bloc.dart';

class App extends StatelessWidget {
  final LocationBloc locationBloc;

  App({required this.locationBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locationBloc..add(LoadLocationsEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Locations',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LocationListPage(),
      ),
    );
  }
}
