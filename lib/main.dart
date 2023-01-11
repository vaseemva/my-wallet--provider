import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_wallet_app/controllers/db_helper.dart';
import 'package:my_wallet_app/providers/add_transaction_provider.dart';
import 'package:my_wallet_app/providers/all_transaction_provider.dart';
import 'package:my_wallet_app/providers/edit_screen_provider.dart';
import 'package:my_wallet_app/providers/graph_screen_provider.dart';

import 'package:my_wallet_app/providers/home_screen_provider.dart';
import 'package:my_wallet_app/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('transactions');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddTransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Dbhelper(),
        ),
        ChangeNotifierProvider(
          create: (context) => AllTransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GraphProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditTransactionProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Wallet',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(bodyText2: GoogleFonts.poppins())),
        home: const SplashScreen(),
      ),
    );
  }
}
