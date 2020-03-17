import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:projetomedia/dbsql/database_creator.dart';
import 'package:projetomedia/views/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseCreator().initDataBase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Media Facul',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}
