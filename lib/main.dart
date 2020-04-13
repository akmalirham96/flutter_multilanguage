import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(EasyLocalization(child: MyApp(),
supportedLocales: [
  Locale("ms","MYR"),
  Locale("en","US")
],
path: "i18n",));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasyLocalization.of(context).delegate,
        ],
        supportedLocales: EasyLocalization.of(context).supportedLocales,
        locale: EasyLocalization.of(context).locale,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(tr("appTitle")),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  FlatButton(onPressed: (){
                    setState(() {
                      EasyLocalization.of(context).locale = Locale("ms","MYR");
                    });
                  }, child: Text("Bahasa Melayu")),
                  FlatButton(onPressed: (){
                    setState(() {
                      EasyLocalization.of(context).locale = Locale("en","US");
                    });
                  }, child: Text("English"))
                ],
              ),
              Container(
                child: Text(tr("hello"),style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),),
              )
            ],
          )
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
  }
}
