import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/consts/consts.dart';
import 'home_screen.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({
    Key? key,
    this.page = 0,
  }) : super(key: key);
  final int page;

  @override
  ParentScreenState createState() => ParentScreenState();
}

class ParentScreenState extends State<ParentScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.page;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        centerTitle: true,
        leading: const SizedBox(),
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.background,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  _onItemTapped(0);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppAssets.home,
                    scale: 3.6,
                    color: _selectedIndex == 0
                        ? AppColors.primaryColor.withOpacity(0.5)
                        : Colors.grey.shade400,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _onItemTapped(1);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppAssets.saved,
                    scale: 3.6,
                    color: _selectedIndex == 1
                        ? AppColors.primaryColor.withOpacity(0.5)
                        : Colors.grey.shade400,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _onItemTapped(2);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppAssets.notification,
                    scale: 3.6,
                    color: _selectedIndex == 2
                        ? AppColors.primaryColor.withOpacity(0.5)
                        : Colors.grey.shade400,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _onItemTapped(3);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppAssets.profile,
                    scale: 3.6,
                    color: _selectedIndex == 3
                        ? AppColors.primaryColor.withOpacity(0.5)
                        : Colors.grey.shade400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(),
          const SizedBox(),
          const SizedBox(),
          const SizedBox(),
        ],
      ),
    );
  }
}
