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
  static Duration get _animDuration => Duration(milliseconds: 400);
  static Map<String, LegendToastrBuilder> _listToastr = Map();
  static OverlayState _overlayState;
  static OverlayEntry _overlayEntry;

  static Future<void> close() async {
    _listToastr.clear();
    _overlayState.dispose();
    _overlayEntry.dispose();
    _overlayEntry = null;
  }

  static Future<void> show(LegendToastrBuilder builder) async {
    await _initOverlay(builder);

    final key = DateTime.now().toIso8601String();

    // ignore: invalid_use_of_protected_member
    _overlayState.setState(() {
      _listToastr[key] = builder;
    });
    Timer(Duration(milliseconds: 200), () {
      // ignore: invalid_use_of_protected_member
      _overlayState.setState(() => _listToastr[key]._isActive = true);
    });

    Timer(Duration(seconds: builder._second), () {
      // ignore: invalid_use_of_protected_member
      _overlayState.setState(() => _listToastr[key]._isActive = false);
      Timer(_animDuration, () {
        // ignore: invalid_use_of_protected_member
        _overlayState.setState(() => _listToastr.remove(key));
      });

      if (_listToastr.isEmpty) {
        Timer(Duration(seconds: 1), () {
          _overlayEntry.remove();
          _overlayEntry = null;
        });
      }
    });
  }

  static _initOverlay(LegendToastrBuilder builder) {
    if (_overlayEntry != null) {
      return;
    }

    _overlayState = Overlay.of(builder.context);
    _overlayEntry = OverlayEntry(
      builder: (context) {
        double topPadding = 20;
        try {
          topPadding += MediaQuery.of(builder.context).padding.top;
        } catch (e) {}

        return Positioned(
            top: topPadding,
            left: 0,
            right: 0,
            child: Column(
              children: _generatorMessageBox,
            ));
      },
    );

    _overlayState.insert(_overlayEntry);
  }

  static List<Widget> get _generatorMessageBox {
    List<Widget> list = [];

    Orientation orientation = Orientation.portrait;
    double width = 100;
    bool isTablet = false;

    _listToastr.forEach((key, builder) {
      double padding = 0;
      try {
        width = MediaQuery.of(builder.context).size.width;
        orientation = MediaQuery.of(builder.context).orientation;
        isTablet = MediaQuery.of(builder.context).size.shortestSide > 600;
      } catch (e) {}
      if (isTablet) {
        padding = width * 0.3;
      } else {
        if (orientation == Orientation.portrait) {
          padding = 10;
        } else {
          padding = width * 0.1;
        }
      }

      StyleSchema style = _getColor(builder._theme);
      list.add(AnimatedOpacity(
        opacity: builder._isActive ? 1 : 0,
        duration: _animDuration,
        child: AnimatedContainer(
          duration: _animDuration,
          padding: EdgeInsets.symmetric(horizontal: builder._isActive ? (padding + 0) : (padding + 40)),
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
          ),
        ),
      ));
    });
    return list.reversed.toList();
  }

  static StyleSchema _getColor(Style style) {
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
  Style _theme = Style.INFO;
  bool _isActive = false;

  LegendToastrBuilder(this.context);

  setMessage(String message) => this._message = message;
  setDuration(int second) => this._second = second;
  setTheme(Style theme) => this._theme = theme;

  @override
  String toString() {
    return "LegendToastr -> Message: '$_message', Second: $_second, Theme: ${_theme.toString()}";
  }
}
