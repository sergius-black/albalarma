import 'package:albalarma/application/location/location_cubit.dart';
import 'package:albalarma/domain/location/location.dart';
import 'package:albalarma/presentation/common/app_icon.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Choose Location"),
                Spacer(),
                AppIconWidget(imageSize: 30)
              ],
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                if (state is LocationInitial) {
                  return buildInitial(
                    context,
                  );
                } else if (state is RequestingLocation) {
                  return buildRequesting();
                } else if (state is LocationLoaded) {
                  return buildLoaded(context, state.location);
                } else {
                  // (state is WeatherError)
                  return buildError();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInitial(BuildContext context) {
    LocationCubit locationCubit = context.read<LocationCubit>();

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 300,
              child: ElevatedButton(
                onPressed: () => locationCubit.getPichilemu(),
                child: Text("Pichilemu"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 300,
              child: ElevatedButton(
                onPressed: () => locationCubit.getLocation(),
                child: Text("Current Location"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildRequesting() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoaded(BuildContext context, Location location) {
    DateTime today = DateTime.now();
    DateTime todayplus1 = today.add(Duration(days: 1));
    DateTime todayplus2 = today.add(Duration(days: 2));
    DateTime todayplus3 = today.add(Duration(days: 3));
    DateTime todayplus4 = today.add(Duration(days: 4));
    DateTime todayplus5 = today.add(Duration(days: 5));
    DateTime todayplus6 = today.add(Duration(days: 6));

    List<DateTime> thisWeek = [
      today,
      todayplus1,
      todayplus2,
      todayplus3,
      todayplus4,
      todayplus5,
      todayplus6
    ];

    return RefreshIndicator(
      onRefresh: () => context.read<LocationCubit>().reFetchSuntimes(location),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              Text(location.name),
              DataTable(
                columnSpacing: 30,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Day',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'SunRise',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'SunSet',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  ...buildDataRow(thisWeek, location),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<DataRow> buildDataRow(List<DateTime> thisWeek, Location location) {
    List<String> weekday = [
      "Lunes",
      "Martes",
      "Miercoles",
      "Jueves",
      "Viernes",
      "Sabado",
      "Domingo"
    ];

    List<DataRow> dataRows = [];

    for (int i = 0; i < 7; i++) {
      String dayCell = i == 0
          ? "Hoy"
          : i == 1
              ? "Mañana"
              : weekday[(thisWeek[i].weekday - 1)].toString();

      dataRows.add(DataRow(
        cells: <DataCell>[
          DataCell(Text(dayCell)),
          DataCell(Text(getTimeString(location.sunTimes![i].sunrise))),
          DataCell(Text(getTimeString(location.sunTimes![i].sunset))),
        ],
      ));
    }

    return dataRows;
  }

  Widget buildError() {
    return Center(
      child: Text("ERROROROROROR"),
    );
  }

  String getTimeString(DateTime date) {
    final int timezone = DateTime.now().timeZoneOffset.inHours;
    return "${date.hour + timezone}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}";
  }
}
