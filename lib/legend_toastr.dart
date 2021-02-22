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
  static List<LegendToastrBuilder> listBuilder = List();

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

  static Future<void> show(LegendToastrBuilder builder) async {
    //print(builder.toString());
    listBuilder.add(builder);

    OverlayState overlayState = Overlay.of(builder.context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) {
        int index = listBuilder.indexOf(builder);

        double topPadding = builder._position == Position.TOP ? MediaQuery.of(builder.context).padding.top + 20 + (index * 60) : null;

        double bottomPadding = builder._position == Position.BOTTOM ? (index * 60.0) : null;

        StyleSchema style = getColor(builder._theme);

        return AnimatedPositioned(
            duration: Duration(microseconds: 500),
            top: topPadding,
            bottom: bottomPadding,
            left: builder._padding.left,
            right: builder._padding.right,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 2,
              color: style.bgColor,
              child: ListTile(
                leading: Icon(style.iconData, size: 25, color: style.textColor),
                title: Text(builder._message, style: TextStyle(color: style.textColor, fontWeight: FontWeight.w700, fontSize: 16)),
              ),
            ));
      },
    );

    print("listEntrys.size: " + listBuilder.length.toString());

    overlayState.insert(overlayEntry);

    Timer(Duration(seconds: builder._second), () {
      overlayEntry.remove();
      listBuilder.removeRange(0, 1);
    });
  }
}

enum Position {
  TOP,
  BOTTOM,
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
  Position _position = Position.BOTTOM;
  Style _theme = Style.INFO;

  LegendToastrBuilder(this.context);

  setMessage(String message) => this._message = message;
  setDuration(int second) => this._second = second;
  setPosition(Position position) => this._position = position;
  setTheme(Style theme) => this._theme = theme;
  setPadding(EdgeInsets edgeInsets) => this._padding = edgeInsets;

  @override
  String toString() {
    return "LegendToastr -> Message: '$_message', Second: $_second, Position: ${_position.toString()}, Theme: ${_theme.toString()}";
  }
}
