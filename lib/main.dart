import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '/consts/consts.dart';
import '/views/screens/splash_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        primaryColor: AppColors.primaryColor,
        fontFamily: GoogleFonts.hind().fontFamily,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.primaryColor,
        ),
      ),
      title: AppTexts.appName,
      onGenerateRoute: (settings) {
        final routes = <String, WidgetBuilder>{
          // PsScheduleScreen.route: (BuildContext context) =>
          //     PsScheduleScreen(settings.arguments),
        };
        WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(builder: (context) => builder!(context));
      },
      onInit: () {
        // Get.put(SettingController());
        //Get.put(AuthController());
      },
      home: const SplashScreen(),
    ),
  );
}
