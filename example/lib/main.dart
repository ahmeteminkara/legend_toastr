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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  int _counter = 0;

  final int durationSecond = 5;

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
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
                child: Text("SUCCESS"),
                onPressed: () {
                  _counter++;
                  final builder = LegendToastrBuilder(context)
                    ..setMessage("SUCCESS $_counter")
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
