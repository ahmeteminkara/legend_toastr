# Legend Toastr

This Flutter plugin displays sequential message pop-ups on the screen.

## Getting Started

```yaml
dependencies:
    legend_toastr:
        git:
            url: git://github.com/ahmeteminkara/legend_toastr.git
```
```dart
import 'package:legend_toastr/legend_toastr.dart';
```

## Usage
```java


final builder = LegendToastrBuilder(context)
                ..setMessage("TOASTR MESSAGE")
                ..setTheme(Style.SUCCESS) 
                ..setDuration(5);

LegendToastr.show(builder);


Style {
  SUCCESS,
  DANGER,
  WARNING,
  INFO,
  LIGHT,
  DARK,
}
```

## Media

<kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/legend_toastr/main/example/ss/gif.gif" width="350" /></kbd>