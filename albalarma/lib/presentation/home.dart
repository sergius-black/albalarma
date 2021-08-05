// import 'package:albalarma/presentation/routes/router.gr.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Home")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//               height: 100,
//               child: Center(child: Text("Albalarma Feature Playground"))),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () => AutoRouter.of(context).push(RadioRoute()),
//               child: Container(
//                 height: 100,
//                 child: Center(child: Text("Radio")),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () => AutoRouter.of(context).push(LocationPageRoute()),
//               child: Container(
//                   height: 100,
//                   child: Center(
//                       child: Text(
//                     "Request Location Suntimes and save to local db",
//                     textAlign: TextAlign.center,
//                   ))),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () =>
//                   AutoRouter.of(context).push(NotificationsRoute()),
//               child: Container(
//                   height: 100,
//                   child: Center(child: Text("Alarms and Notifications"))),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () => AutoRouter.of(context).push(AlarmPageRoute()),
//               child: Container(
//                   height: 100, child: Center(child: Text("Final Alarm Page"))),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
