import "package:flutter/widgets.dart";
import "package:mmkv/mmkv.dart";
import "package:nove/user_interface/application/application.dart";

Future<void> main() async {
  late final Application application;

  WidgetsFlutterBinding.ensureInitialized();

  await MMKV.initialize();

  application = Application();

  runApp(application);
}
