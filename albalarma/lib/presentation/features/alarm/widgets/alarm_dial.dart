import 'package:albalarma/application/alarm/cubit/alarm_cubit.dart';
import 'package:albalarma/dependency_injection/injection.dart';
import 'package:albalarma/domain/alarm/alarm.dart';
import 'package:albalarma/infrastructure/alarm_service/alarm_repository.dart';
import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlarmOffsetDial extends StatelessWidget {
  final DateTime sunrise;

  AlarmOffsetDial({
    required this.sunrise,
  });

  final List<Widget> options = [
    Text("-60"),
    Text("-55"),
    Text("-50"),
    Text("-45"),
    Text("-40"),
    Text("-35"),
    Text("-30"),
    Text("-25"),
    Text("-20"),
    Text("-15"),
    Text("-10"),
    Text("-5"),
    Text("0"),
    Text("+5"),
    Text("+10"),
    Text("+15"),
    Text("+20"),
    Text("+25"),
    Text("+30"),
    Text("+35"),
    Text("+40"),
    Text("+45"),
    Text("+50"),
    Text("+55"),
    Text("+60"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlarmCubit, AlarmState>(
      builder: (context, state) {
        if (state is AlarmInitial) {
          return buildAlarmInitial(context);
        } else if (state is Off) {
          return buildAlarmOff(
            context,
            state.alarm,
          );
        } else if (state is SettingAlarm) {
          return buildSettingAlarm();
        } else if (state is AlarmSet) {
          return buildAlarmSet(context);
        } else {
          return buildAlarmError(context);
        }
      },
    );
  }

  void setTimeOffset(BuildContext context, int offset) {
    context.read<AlarmCubit>().setTimeOffset(offset);
    // getIt<AlarmCubit>().setAlarmTime(alarmTime: alarmTime);
  }

  String getTimeString(DateTime date) {
    final int timezone = DateTime.now().timeZoneOffset.inHours;
    return "${date.hour + timezone}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}";
  }

  Widget buildAlarmInitial(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Hora Alarma",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Tomorrow's Sunrise:"),
                    Text(getTimeString(sunrise)),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () => context
                              .read<AlarmCubit>()
                              .setSunriseTime(sunrise),
                          child: Text("Add Alarm"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () =>
                              context.read<AlarmCubit>().cancelAlarms(),
                          child: Text(
                            "Cancel Alarms",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAlarmOff(
    BuildContext context,
    Alarm alarm,
  ) {
    AlarmRepository _alarmRepo = getIt<AlarmRepository>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  children: [
                    Text("Tomorrow's Sunrise:"),
                    Text(getTimeString(sunrise)),
                    Divider(),
                    Text("Alarm Time:"),
                    Text(getTimeString(alarm.alarmTime)),
                  ],
                ),
              ),
              Container(
                height: 150,
                width: 100,
                child: CupertinoPicker(
                  itemExtent: 25,
                  onSelectedItemChanged: (int offset) =>
                      setTimeOffset(context, offset),
                  children: options,
                  scrollController:
                      FixedExtentScrollController(initialItem: 12),
                  backgroundColor: Colors.green[800],
                  magnification: 1.5,
                  diameterRatio: 1.3,
                  squeeze: 1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        DropdownButton<String>(
          value: alarm.radio,
          icon: Icon(
            Icons.radio,
            color: Colors.green[800],
          ),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.green[800]),
          underline: Container(
            height: 2,
            color: Colors.greenAccent,
          ),
          onChanged: (String? newRadio) {
            context.read<AlarmCubit>().setAlarmRadio(radio: newRadio!);
          },
          items: <String>[
            'Futuro',
            'BioBio',
            'Adn',
            'Rock&Pop',
            "Cooperativa",
            "Concierto"
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: 150,
                child: ElevatedButton(
                    onPressed: () => context.read<AlarmCubit>().setAlarm(),
                    child: Text("Set Alarm!")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: 150,
                child: ElevatedButton(
                    onPressed: () => context.read<AlarmCubit>().setEnsayo(),
                    child: Text(
                      "Ensayo en ${_alarmRepo.timeOffset} segundos",
                      textAlign: TextAlign.center,
                    )),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildSettingAlarm() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 20,
          ),
          Text("Setting Alarm")
        ],
      ),
    );
  }

  Widget buildAlarmSet(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text("Alarm On"),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 200,
              child: ElevatedButton(
                onPressed: () => context.read<AlarmCubit>().checkAlarm(),
                child: Text("Set New Alarm"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              width: 150,
              child: ElevatedButton(
                onPressed: () => context.read<AlarmCubit>().cancelAlarms(),
                child: Text(
                  "Cancel Alarms",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildAlarmError(BuildContext context) {
    return Center(
      child: Column(children: [
        Text("ERROROROROROR"),
        SizedBox(
          height: 50,
        ),
        Container(
          height: 100,
          width: 200,
          child: ElevatedButton(
            onPressed: () => context.read<AlarmCubit>().checkAlarm(),
            child: Text("Set New Alarm"),
          ),
        )
      ]),
    );
  }
}
