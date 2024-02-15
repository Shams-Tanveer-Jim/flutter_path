import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_recipe/consts/consts.dart';
import 'package:task_recipe/views/screens/recipe_details_screen.dart';

import '../../utils/helper.dart';
import 'search_recipe_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final RxString selectedCuisine = "All".obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Jim",
                      style: TextStyle(
                          fontSize: AppSizes.size20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Whare are you cooking today?",
                      style: TextStyle(
                          fontSize: AppSizes.size13,
                          color: Colors.grey.shade400),
                    )
                  ],
                ),
                Container(
                  height: AppSizes.newSize(6.5),
                  width: AppSizes.newSize(6.5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xffFFCE80),
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.asset("assets/images/person.png"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => SearchRecipeScreen());
                    },
                    child: TextFormField(
                      enabled: false,
                      decoration: AppStyles.textInputDecoration("Search recipe")
                          .copyWith(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey.shade400,
                              ),
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade400)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  height: 44,
                  width: 44,
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.asset("assets/icons/setting.png"),
                )
              ],
            ),
          ),
          SizedBox(
            height: AppSizes.newSize(5.5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...cuisineList.map((e) => Obx(() => SelectCuisine(
                    cuisineName: e,
                    onClickFunction: (String cuisine) {
                      selectedCuisine.value = cuisine;
                    },
                    selectedCuisine: selectedCuisine.value)))
              ],
            ),
          ),
          SizedBox(
            height: AppSizes.newSize(33),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...[1, 2, 3].map(
                  (e) => const RecipeWidget(),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              "New Recipes",
              style: TextStyle(
                  fontSize: AppSizes.size16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: AppSizes.newSize(20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...[1, 2, 3].map((e) => const NewRecipeWidget())
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SelectCuisine extends StatelessWidget {
  const SelectCuisine(
      {super.key,
      required this.selectedCuisine,
      required this.cuisineName,
      required this.onClickFunction});

  final String selectedCuisine;
  final String cuisineName;
  final Function onClickFunction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClickFunction(cuisineName);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: selectedCuisine == cuisineName
                ? AppColors.primaryColor
                : Colors.white),
        child: Text(
          cuisineName,
          style: TextStyle(
              fontSize: AppSizes.size13,
              color: selectedCuisine == cuisineName
                  ? Colors.white
                  : AppColors.primaryColor,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class NewRecipeWidget extends StatelessWidget {
  const NewRecipeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: AppSizes.newSize(20),
      width: AppSizes.newSize(30),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Stack(children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: AppSizes.newSize(13),
            width: Get.width,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 2,
                      color: Colors.black.withOpacity(0.3))
                ]),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Seak with tomato ...",
                    style: TextStyle(
                        fontSize: AppSizes.size16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      ...List.generate(
                          5,
                          (index) => const Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.orangeAccent,
                              ))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: AppSizes.newSize(3),
                            width: AppSizes.newSize(3),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/person.png"))),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "By James Milner",
                            style: TextStyle(color: Colors.grey.shade500),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/timer.png",
                            scale: 4,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "20 mins",
                            style: TextStyle(color: Colors.grey.shade500),
                          )
                        ],
                      )
                    ],
                  )
                ]),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: AppSizes.newSize(11),
              height: AppSizes.newSize(11),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/foodimage1.png"),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class RecipeWidget extends StatelessWidget {
  const RecipeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const RecipeDetailsScreen());
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        color: Colors.white,
        width: AppSizes.newSize(20),
        height: AppSizes.newSize(30),
        child: Stack(alignment: Alignment.topCenter, children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: Get.width,
              height: AppSizes.newSize(24),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffD9D9D9).withOpacity(0.7),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        "Classic Greek Salad",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppSizes.size16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Time",
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "15mins",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: AppSizes.newSize(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Image.asset(
                            AppAssets.saved,
                            scale: 4,
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: AppSizes.newSize(13),
              width: Get.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/foodimage.png")),
                  shape: BoxShape.circle),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55,
                  height: 25,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffFFE1B3).withOpacity(1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.orange.withOpacity(0.8),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "3.5",
                        style:
                            TextStyle(height: 1.3, fontSize: AppSizes.size13),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
