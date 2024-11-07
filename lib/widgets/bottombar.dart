import 'package:adhikar2_o/provider/lawyerProvider.dart';
import 'package:adhikar2_o/provider/userProvider.dart';
import 'package:adhikar2_o/screens/home.dart';
import 'package:adhikar2_o/screens/marketplace.dart';
import 'package:adhikar2_o/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  late PageController pageController;

  adddata() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    LawyerProvider lawyerProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
    await lawyerProvider.refreshLawyer();
  }

  List<Widget> pageList = [
    const HomeScreen(),
    const Center(child: Text("page2()")),
    const Center(child: Text(" LawScreen()")),
    const Center(child: MarketPlaceScreen()),
    const Center(child: ProfileScreen())
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    adddata();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pageList,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        height: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(),
            color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoTabBar(
            border: Border.all(color: Colors.black),
            iconSize: 30,
            activeColor: Colors.white,
            backgroundColor: Colors.black,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(
                  const AssetImage('assets/icons/ic_home.png'),
                  size: 35,
                  color: (_page == 0) ? Colors.white : Colors.grey,
                ),
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  const AssetImage('assets/icons/ic_document.png'),
                  size: 40,
                  color: (_page == 1) ? Colors.white : Colors.grey,
                ),
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    const AssetImage('assets/icons/ic_law.png'),
                    size: 40,
                    color: (_page == 2) ? Colors.white : Colors.grey,
                  ),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  const AssetImage('assets/icons/ic_marketplace.png'),
                  size: 20,
                  color: (_page == 3) ? Colors.white : Colors.grey,
                ),
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  const AssetImage('assets/icons/ic_profile.png'),
                  size: 20,
                  color: (_page == 4) ? Colors.white : Colors.grey,
                ),
                backgroundColor: Colors.white,
              ),
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        ),
      ),
    );
  }
}
