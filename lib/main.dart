// // import 'package:firstweb/ui/screens/home/home_view.dart';

// import 'package:bubltown_nfc/rout.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../ui/screens/init/init_view.dart';

// import 'providers/locator.dart';

// void main() {
//   setup();
//   runApp(
//     const MyApp(),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//                // routes: Routes.routes,
//                 debugShowCheckedModeBanner: false,
//                 title: 'TaxFill',
//                 //theme: theme.getTheme(),
//                 // theme: ThemeData.dark().copyWith(
//                 //   scaffoldBackgroundColor: bgColor,
//                 //   textTheme: GoogleFonts.redHatDisplayTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.white),
//                 //   canvasColor: secondaryColor,
//                 // ),

//                 // home: const OtpView(),
//                 home: InitView(),
//               );
//   }
// }

// import 'package:firstweb/ui/screens/home/home_view.dart';
import 'package:bubltown_nfc/ui/screens/event/event_view.dart';
import 'package:bubltown_nfc/ui/screens/form/form_view.dart';
import 'package:bubltown_nfc/ui/screens/init/init_view.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'providers/locator.dart';

void main() {
  setup();
//   String myurl = Uri.base.toString(); //get complete url
//   String? para1 = Uri.base.queryParameters["id"];
//   String? para2=Uri.base.queryParameters["customerName"];
//  print(para1);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  //String? para1 = '';
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
        //ChangeNotifierProvider.value(
        //value: getIt<ThemeNotifier>(),
        //child: Consumer<ThemeNotifier>(
        // builder: (context, theme, _) =>
        MaterialApp(
      // routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      title: 'TaxFill',
      //theme: theme.getTheme(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 244, 246, 247),
        textTheme: GoogleFonts.redHatDisplayTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.black),
        // canvasColor: secondaryColor,
      ),
      home: EventView(),
    
    )
        //),
        //)
        ;
  }
}
