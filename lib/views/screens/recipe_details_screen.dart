import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_recipe/consts/consts.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({super.key});

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 25,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.more_horiz,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Container(
            width: Get.width,
            height: AppSizes.newSize(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: AssetImage("assets/images/foodimage3.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.black.withOpacity(.1)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                  ),
                ),
                Column(
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
                              "4.0",
                              style: TextStyle(
                                  height: 1.3, fontSize: AppSizes.size13),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            "assets/icons/timer.png",
                            scale: 3.5,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "20min",
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.bold,
                                fontSize: AppSizes.size14),
                          ),
                          const SizedBox(
                            width: 5,
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
                              color: AppColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Spicy chicken burger with French fries",
                  style: TextStyle(
                      fontSize: AppSizes.size16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                "(13k Reviews)",
                style: TextStyle(
                    fontSize: AppSizes.size15, color: Colors.grey.shade500),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/person.png"))),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Laura Wilson"),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      Text(
                        "Lagos,Nigeria",
                        style: TextStyle(color: Colors.grey.shade500),
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: const Text(
                  "Follow",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: AppSizes.newSize(5),
            child: TabBar(
              controller: tabController,
              labelColor: Colors.white,
              unselectedLabelStyle: TextStyle(fontSize: AppSizes.size14),
              labelStyle: TextStyle(fontSize: AppSizes.size14),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryColor),
              unselectedLabelColor: AppColors.primaryColor,
              tabs: const [
                Tab(
                  text: "Ingredient",
                ),
                Tab(
                  text: "Procedure",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              ListView(
                children: [
                  ...List.generate(7, (index) => const IngredientWidget())
                ],
              ),
              ListView(
                children: [
                  ...List.generate(
                    7,
                    (index) => ProcedureWidget(step: index),
                  ),
                ],
              ),
            ]),
          )
        ]),
      ),
    );
  }
}

class ProcedureWidget extends StatelessWidget {
  final int step;
  const ProcedureWidget({
    required this.step,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Step ${step + 1}",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: AppSizes.size15),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        ],
      ),
    );
  }
}

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(
                  "assets/images/tomato.png",
                  scale: 4,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                "Tomatos",
                style: TextStyle(
                    fontSize: AppSizes.size15, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Text(
            "500g",
            style: TextStyle(
              fontSize: AppSizes.size15,
              color: Colors.grey.shade600,
            ),
          )
        ],
      ),
    );
  }
}
