import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/countries_provider.dart';
import 'package:responsive/screens/details_page.dart';
import 'package:responsive/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountryProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Responsive',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/": (context) => HomePage(),
          // "details": (context) => DetailsPage()
        },
        onGenerateRoute: ((settings) {
          if (settings.name == "details") {
            return MaterialPageRoute(
              builder: (context) =>
                  DetailsPage(index: settings.arguments as int),
            );
          }
        }),
        initialRoute: "/",
      ),
    );
  }
}
