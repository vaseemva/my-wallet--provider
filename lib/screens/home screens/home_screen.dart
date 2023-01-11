import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_wallet_app/colors/colors.dart';
import 'package:my_wallet_app/providers/home_screen_provider.dart';
import 'package:my_wallet_app/screens/add_transaction/add_transaction.dart';
import 'package:my_wallet_app/screens/all%20transaction%20screen/all_transaction_screen.dart';
import 'package:my_wallet_app/screens/graph_screen/graphscreen.dart';
import 'package:my_wallet_app/screens/home%20screens/home.dart';
import 'package:my_wallet_app/screens/settings_screen/settings.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final List<Widget> pages = [
    Home(),
     AllTransactionScreen(),
    AddTransaction(),
     Graphscreen(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    int selectedIndex = Provider.of<HomeScreenProvider>(context).selectedIndex;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: appThemeColor,
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: Consumer<HomeScreenProvider>(
        builder: (context, homeScData, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: GNav(
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                homeScData.updateSelectedIndex(index); 
              },
              backgroundColor: appThemeColor,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.blueGrey.withOpacity(0.8),
              gap: 2,
              padding: const EdgeInsets.all(10.0),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  iconSize: 30,
                ),
                GButton(
                  icon: Icons.list,
                  text: 'All',
                  iconSize: 30,
                ),
                GButton(
                  icon: Icons.add,
                  text: 'Add',
                  iconSize: 30,
                ),
                GButton(
                  icon: Icons.bar_chart,
                  text: 'Graphs',
                  iconSize: 30,
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                  iconSize: 30,
                )
              ]),
        ),
      ),
    );
  }
}
