import 'package:custom_video_picker/custom_video_picker/screens/video_picker_page.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  requestPermission().then((isGranted) {
    if (isGranted) {
      runApp(const CustomVideoPickerApp());
    }
  });
}

class CustomVideoPickerApp extends StatelessWidget {
  const CustomVideoPickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const VideoPickerPage(),
    );
  }
}

Future<bool> requestPermission() async {
  final PermissionState permission =
      await PhotoManager.requestPermissionExtend();
  return permission.isAuth;
}
