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
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int durationSecond = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Legend Toastr"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            OutlinedButton(
                child: Text("SUCCESS"),
                onPressed: () {
                  final builder = LegendToastrBuilder(context)
                    ..setMessage("SUCCESS MESSAGE")
                    ..setTheme(Style.SUCCESS)
                    ..setDuration(durationSecond);

                  LegendToastr.show(builder);
                }),
            OutlinedButton(
                child: Text("DANGER"),
                onPressed: () {
                  final builder = LegendToastrBuilder(context)
                    ..setMessage("DANGER MESSAGE")
                    ..setTheme(Style.DANGER)
                    ..setDuration(durationSecond);

                  LegendToastr.show(builder);
                }),
            OutlinedButton(
                child: Text("WARNING"),
                onPressed: () {
                  final builder = LegendToastrBuilder(context)
                    ..setMessage("WARNING MESSAGE")
                    ..setTheme(Style.WARNING)
                    ..setDuration(durationSecond);
                  LegendToastr.show(builder);
                }),
            OutlinedButton(
                child: Text("INFO"),
                onPressed: () {
                  final builder = LegendToastrBuilder(context)
                    ..setMessage("INFO MESSAGE")
                    ..setTheme(Style.INFO)
                    ..setDuration(durationSecond);

                  LegendToastr.show(builder);
                }),
            OutlinedButton(
                child: Text("LIGHT"),
                onPressed: () {
                  final builder = LegendToastrBuilder(context)
                    ..setMessage("LIGHT MESSAGE")
                    ..setTheme(Style.LIGHT)
                    ..setDuration(durationSecond);

                  LegendToastr.show(builder);
                }),
            OutlinedButton(
                child: Text("DARK"),
                onPressed: () {
                  final builder = LegendToastrBuilder(context)
                    ..setMessage("DARK MESSAGE")
                    ..setTheme(Style.DARK)
                    ..setDuration(durationSecond);

                  LegendToastr.show(builder);
                }),
          ],
        ),
      ),
    );
  }
}
