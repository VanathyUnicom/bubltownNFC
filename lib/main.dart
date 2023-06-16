// import 'package:firstweb/ui/screens/home/home_view.dart';

import 'package:bubltown_nfc/rout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/screens/init/init_view.dart';

import 'providers/locator.dart';

void main() {
  setup();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
               // routes: Routes.routes,
                debugShowCheckedModeBanner: false,
                title: 'TaxFill',
                //theme: theme.getTheme(),
                // theme: ThemeData.dark().copyWith(
                //   scaffoldBackgroundColor: bgColor,
                //   textTheme: GoogleFonts.redHatDisplayTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.white),
                //   canvasColor: secondaryColor,
                // ),

                // home: const OtpView(),
                home: InitView(),
              );
  }
}
















