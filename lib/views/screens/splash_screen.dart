import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task_recipe/views/screens/parent_screen.dart';
import '/consts/consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: AppColors.background,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppAssets.splash,
                ),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Image.asset(
                  AppAssets.chef,
                  scale: 3,
                ),
                Text(
                  "100K+ Premium Recipe ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: AppSizes.size16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(children: [
                    Text(
                      "Get",
                      style: TextStyle(
                          height: 1,
                          fontSize: AppSizes.newSize(5),
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Cooking",
                      style: TextStyle(
                          height: 1,
                          fontSize: AppSizes.newSize(5),
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
                Text(
                  "Simple way to find Tasty Recipe",
                  style:
                      TextStyle(fontSize: AppSizes.size16, color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const ParentScreen());
                  },
                  child: Container(
                    width: 300,
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Start Cooking",
                          style: TextStyle(
                              fontSize: AppSizes.size18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
