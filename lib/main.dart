
import 'package:axolon_loading_sheet/View/loading_sheet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


void main() async {
  //debugPaintSizeEnabled = false;
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Change the primary color here
        // Other theme configurations
      ),
      // theme: ThemeData(
      //
      //
      //   useMaterial3: true,
      // ),
      debugShowCheckedModeBanner: false,
      home: LoadingSheetItemListScreen(),
    );
  }
}


