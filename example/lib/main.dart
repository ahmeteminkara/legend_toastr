import 'package:flutter/material.dart';
import 'package:legend_toastr/legend_toastr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final Position position = Position.TOP;
  final int durationSecond = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: position == Position.TOP ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            FlatButton(
                child: Text("SUCCESS"),
                onPressed: () {
                  _counter++;
                  final builder = LegendToastrBuilder(context)
                    ..setMessage("SUCCESS $_counter")
                    ..setPosition(position)
                    ..setTheme(Style.SUCCESS)
                    ..setPadding(EdgeInsets.zero)
                    ..setDuration(durationSecond);

                  LegendToastr.show(builder);
                }),
            FlatButton(
                child: Text("DANGER"),
                onPressed: () {
                  _counter++;
                  final builder = LegendToastrBuilder(context)
                    ..setMessage("DANGER $_counter")
                    ..setPosition(position)
                    ..setTheme(Style.DANGER)
                    ..setPadding(EdgeInsets.zero)
                    ..setDuration(durationSecond);

                  LegendToastr.show(builder);
                }),
            FlatButton(
                child: Text("WARNING"),
                onPressed: () {
                  _counter++;
                  final builder = LegendToastrBuilder(context)
                    ..setMessage("WARNING $_counter")
                    ..setPosition(position)
                    ..setTheme(Style.WARNING)
                    ..setPadding(EdgeInsets.zero)
                    ..setDuration(durationSecond);
                  LegendToastr.show(builder);
                }),
            FlatButton(
                child: Text("INFO"),
                onPressed: () {
                  _counter++;
                  final builder = LegendToastrBuilder(context)
                    ..setMessage("INFO $_counter")
                    ..setPosition(position)
                    ..setTheme(Style.INFO)
                    ..setPadding(EdgeInsets.zero)
                    ..setDuration(durationSecond);

                  LegendToastr.show(builder);
                }),
            FlatButton(
                child: Text("LIGHT"),
                onPressed: () {
                  _counter++;
                  final builder = LegendToastrBuilder(context)
                    ..setMessage("LIGHT $_counter")
                    ..setPosition(position)
                    ..setTheme(Style.LIGHT)
                    ..setPadding(EdgeInsets.zero)
                    ..setDuration(durationSecond);

                  LegendToastr.show(builder);
                }),
            FlatButton(
                child: Text("DARK"),
                onPressed: () {
                  _counter++;
                  final builder = LegendToastrBuilder(context)
                    ..setMessage("DARK $_counter")
                    ..setPosition(position)
                    ..setTheme(Style.DARK)
                    ..setPadding(EdgeInsets.zero)
                    ..setDuration(durationSecond);

                  LegendToastr.show(builder);
                }),
          ],
        ),
      ),
    );
  }
}
