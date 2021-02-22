library legend_toastr;

import 'dart:async';

import 'package:flutter/material.dart';

class StyleSchema {
  final Color bgColor;
  final Color textColor;
  final IconData iconData;

  StyleSchema(this.bgColor, this.textColor, this.iconData);
}

class LegendToastr {
  static Map<String, LegendToastrBuilder> _listToastr = Map();
  static OverlayState _overlayState;
  static OverlayEntry _overlayEntry;

  static Future<void> show(LegendToastrBuilder builder) async {
    //print(builder.toString());
    initOverlay(builder);

    final key = DateTime.now().toIso8601String();

    _overlayState.setState(() {
      _listToastr[key] = builder;
    });
    Timer(Duration(milliseconds: 100), () {
      _overlayState.setState(() => _listToastr[key]._isActive = true);
    });

    Timer(Duration(seconds: builder._second), () {
      _overlayState.setState(() => _listToastr[key]._isActive = false);
      Timer(Duration(milliseconds: 500), () {
        _overlayState.setState(() => _listToastr.remove(key));
      });

      print(builder._message + " silindi");

      if (_listToastr.isEmpty) {
        Timer(Duration(milliseconds: 1000), () {
          print("liste boş");
          _overlayEntry.remove();
          _overlayEntry = null;
        });
      }
    });
  }

  static initOverlay(LegendToastrBuilder builder) {
    if (_overlayEntry != null) {
      return;
    }

    _overlayState = Overlay.of(builder.context);
    _overlayEntry = OverlayEntry(
      builder: (context) {
        double topPadding = MediaQuery.of(builder.context).padding.top + 20;

        return Positioned(
            top: topPadding,
            left: builder._padding.left,
            right: builder._padding.right,
            child: Column(
              children: generatorMessageBox,
            ));
      },
    );

    _overlayState.insert(_overlayEntry);
  }

  static List<Widget> get generatorMessageBox {
    List<Widget> list = [];

    _listToastr.forEach((key, builder) {
      StyleSchema style = getColor(builder._theme);
      list.add(AnimatedOpacity(
        opacity: builder._isActive ? 1 : 0,
        duration: Duration(milliseconds: 300),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 2,
            color: style.bgColor,
            child: ListTile(
              leading: Icon(style.iconData, size: 25, color: style.textColor),
              title: Text(builder._message,
                  style: TextStyle(
                      color: style.textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16)),
            ),
          ),
        ),
      ));
    });
    return list.reversed.toList();
  }

  static StyleSchema getColor(Style style) {
    switch (style) {
      case Style.DANGER:
        return StyleSchema(Colors.red, Colors.white, Icons.error_rounded);
        break;

      case Style.SUCCESS:
        return StyleSchema(
          Colors.green,
          Colors.white,
          Icons.done_rounded,
        );
        break;

      case Style.WARNING:
        return StyleSchema(
          Colors.orange[600],
          Colors.white,
          Icons.warning_rounded,
        );
        break;
      case Style.INFO:
        return StyleSchema(
          Colors.blue[400],
          Colors.grey[100],
          Icons.info_outline_rounded,
        );
        break;
      case Style.DARK:
        return StyleSchema(
          Colors.grey[800],
          Colors.white,
          Icons.chevron_right_rounded,
        );
        break;
      default:
        return StyleSchema(
          Colors.grey[100],
          Colors.grey[800],
          Icons.chevron_right_rounded,
        );
        break;
    }
  }
}

enum Style {
  SUCCESS,
  DANGER,
  WARNING,
  INFO,
  LIGHT,
  DARK,
}

class LegendToastrBuilder {
  final BuildContext context;
  String _message;
  int _second = 5;
  EdgeInsets _padding = EdgeInsets.all(20);
  Style _theme = Style.INFO;
  bool _isActive = false;

  LegendToastrBuilder(this.context);

  setMessage(String message) => this._message = message;
  setDuration(int second) => this._second = second;
  setTheme(Style theme) => this._theme = theme;
  setPadding(EdgeInsets edgeInsets) => this._padding = edgeInsets;

  @override
  String toString() {
    return "LegendToastr -> Message: '$_message', Second: $_second, Theme: ${_theme.toString()}";
  }
}
