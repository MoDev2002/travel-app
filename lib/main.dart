import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/tabs_screen.dart';
import './screens/details_screen.dart';
import './models/places.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Places(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel App',
        theme: ThemeData(
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: const Color.fromRGBO(23, 21, 33, 1),
          colorScheme: const ColorScheme.light(
            // brightness: Brightness.dark,
            primary: Color.fromRGBO(48, 52, 69, 1),
            primaryVariant: Color.fromRGBO(108, 109, 119, 1),
            secondary: Color.fromRGBO(65, 177, 205, 1),
          ),
        ),
        home: TabsScreen(),
        routes: {
          DetailsScreen.routeName: (ctx) => DetailsScreen(),
        },
      ),
    );
  }
}
