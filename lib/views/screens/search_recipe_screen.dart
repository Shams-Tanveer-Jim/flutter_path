import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_recipe/consts/consts.dart';
import 'package:task_recipe/models/recipe_list_model.dart';

var data = {
  "results": [
    {
      "id": 1,
      "name": "Traditional spare ribs baked",
      "recipe_by": "Chef John",
      "image": "assets/images/foodimage.png",
      "rating": 3.8
    },
    {
      "id": 2,
      "name": "Lamb chops with fruity couscous and mint",
      "recipe_by": "Spicy Nelly",
      "image": "assets/images/foodimage1.png",
      "rating": 4.3
    },
    {
      "id": 3,
      "name": "spice roasted chicken with flavored rice",
      "recipe_by": "Mark Kelvin",
      "image": "assets/images/foodimage2.png",
      "rating": 3.9
    },
    {
      "id": 4,
      "name": "Chinese style Egg fried rice with sliced pork",
      "recipe_by": "Laura wilson",
      "image": "assets/images/foodimage3.png",
      "rating": 4.1
    }
  ]
};

class SearchRecipeScreen extends StatelessWidget {
  SearchRecipeScreen({super.key});

  final Rx<RecipeListModel> recipeList = RecipeListModel.fromJson(data).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Search recipes",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.size18),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0).copyWith(top: 0),
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    enabled: false,
                    decoration:
                        AppStyles.textInputDecoration("Search recipe").copyWith(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey.shade400,
                            ),
                            labelStyle: TextStyle(color: Colors.grey.shade400)),
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
          Text(
            "Recent Search",
            style: TextStyle(
              fontSize: AppSizes.size18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: ((recipeList.value.results ?? []).length / 2).ceil(),
              itemBuilder: (context, rowIndex) {
                int startIndex = rowIndex * 2;
                int endIndex = startIndex + 2;
                if (startIndex + 4 > (recipeList.value.results ?? []).length) {
                  endIndex = (recipeList.value.results ?? []).length;
                }

                List<Recipe> rowRecipe = (recipeList.value.results ?? [])
                    .sublist(startIndex, endIndex);
                return Row(
                  children: [
                    ...rowRecipe.map((e) => Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            height: AppSizes.newSize(20),
                            width: AppSizes.newSize(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: AssetImage(e.image ?? ""),
                                    fit: BoxFit.cover)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 55,
                                    height: 25,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xffFFE1B3)
                                          .withOpacity(1),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          (e.rating ?? 0.0).toString(),
                                          style: TextStyle(
                                              height: 1.3,
                                              fontSize: AppSizes.size13),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12)),
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.black,
                                            Colors.black.withOpacity(0.2)
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter)),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.name ?? "",
                                        style: TextStyle(
                                            height: 1,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: AppSizes.size15),
                                      ),
                                      Text(
                                        "By ${e.recipeBy ?? ""}",
                                        style: TextStyle(
                                            color: Colors.grey.shade400),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                  ],
                );
              })
        ],
      ),
    );
  }
}
