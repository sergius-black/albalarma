import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:albalarma/dependency_injection/injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String env) async {
  $initGetIt(getIt, environment: env);
}
