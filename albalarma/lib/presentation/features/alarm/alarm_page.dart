import 'package:albalarma/application/alarm/cubit/alarm_cubit.dart';
import 'package:albalarma/application/audio/cubit/audio_cubit.dart';
import 'package:albalarma/application/location/location_cubit.dart';
import 'package:albalarma/dependency_injection/injection.dart';
import 'package:albalarma/domain/location/location.dart';
import 'package:albalarma/presentation/common/app_icon.dart';
import 'package:albalarma/presentation/features/alarm/widgets/alarm_dial.dart';
import 'package:albalarma/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlarmPage extends StatefulWidget {
  AlarmPage({Key? key}) : super(key: key);

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  final LocationCubit _locationCubit = getIt<LocationCubit>();
  final AudioCubit _audioCubit = getIt<AudioCubit>();
  final AlarmCubit _alarmCubit = getIt<AlarmCubit>();

  @override
  void initState() {
    _locationCubit.getLocation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _locationCubit),
        BlocProvider.value(value: _audioCubit),
        BlocProvider.value(value: _alarmCubit),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                AppIconWidget(imageSize: 30),
                SizedBox(
                  width: 20,
                ),
                Text("PaltAlarma"),
              ],
            ),
            actions: [
              IconButton(
                  icon: const Icon(Icons.radio),
                  tooltip: 'Radio',
                  onPressed: () {
                    AutoRouter.of(context).push(RadioRoute());
                  }),
              IconButton(
                  icon: const Icon(Icons.wb_sunny),
                  tooltip: 'Horario de la semana',
                  onPressed: () {
                    AutoRouter.of(context).push(LocationPageRoute());
                  }),
            ],
          ),
          body: BlocBuilder<LocationCubit, LocationState>(
            builder: (context, state) {
              if (state is LocationInitial) {
                return buildInitial();
              } else if (state is RequestingLocation) {
                return buildRequestingLocation();
              } else if (state is LocationLoaded) {
                DateTime nextSunrise =
                    state.location.sunTimes![0].sunrise.isAfter(DateTime.now())
                        ? state.location.sunTimes![0].sunrise
                        : state.location.sunTimes![1].sunrise;

                return Column(
                  children: [
                    buildLocationLoaded(context, state.location),
                    Divider(),
                    AlarmOffsetDial(sunrise: nextSunrise)
                  ],
                );
              } else if (state is LocationError) {
                // (state is WeatherError)
                return buildError(context, state.location);
              } else {
                return buildError(context, Location.pichilemu());
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildInitial() {
    return Center(child: CircularProgressIndicator());
  }

  Widget buildRequestingLocation() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 20,
          ),
          Text("Loading SunTimes")
        ],
      ),
    );
  }

  Widget buildLocationLoaded(BuildContext context, Location location) {
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
              SizedBox(
                height: 10,
              ),
              Text("${location.name} Sun Times"),
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

  Widget buildError(BuildContext context, Location location) {
    return RefreshIndicator(
      onRefresh: () => context.read<LocationCubit>().reFetchSuntimes(location),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height - 200,
          child: Center(
            child: Column(
              children: [
                Text("ERROROROROROR"),
                SizedBox(
                  height: 20,
                ),
                Text("Pull down to reload"),
              ],
            ),
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

    for (int i = 0; i < 3; i++) {
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

  String getTimeString(DateTime date) {
    final int timezone = DateTime.now().timeZoneOffset.inHours;
    return "${date.hour + timezone}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}";
  }
}
