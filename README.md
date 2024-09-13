# PRO DESIGN

**pro_design package helps developing responsive Flutter applications.**

Note: This package is still under development. Try not to use same value for mobile, tab and desktop or large devices. Always check for updated version.

## Usage:

### Add dependency：

Please check the latest version before installation.

```yaml
dependencies:
  flutter:
    sdk: flutter
  pro_design: ^0.0.5
```

### Add the following import to your Dart code:

```dart
import 'package:pro_design/pro_design.dart';
```

### Initialization:

You must call **ProDesign.init()** and pass **context** in a **Widget build()** function and it should be inside a **MaterialApp**, Not Before **MaterialApp**.

**Example:**

```dart
void  main() {
  runApp(MyApp());
}

class  MyApp  extends  StatelessWidget {
  @override
  Widget  build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class  Home  extends  StatelessWidget {
  @override
  Widget  build(BuildContext context) {
  //Initializing ProDesign!
    ProDesign.init(context);
    return  Scaffold();
  }
}
```

## Responsiveness

- To make responsive design using point or pt values, use **ProDesign.pt()** and pass point or pt value. Larger devices or screens like laptop will use default value of Flutter. So responsiveness using **ProDesign.pt()** will work on mobile, tabs and and mini laptops.

- For responsiveness you can use **ProDesign.horizontally()** by passing how much screen portion you want to use in horizontal (X) axis in the range of **0% - 100%**. You can use this method on any devices or screens based on your need.

- For responsiveness you can use **ProDesign.vertically()** by passing how much screen portion you want to use in vertical (Y) axis in the range of **0% - 100%**. You can use this method on any devices or screens based on your need.

- For responsive font size, use **ProDesign.sp()** and pass value. Larger devices or screens like laptop will use default value of Flutter. So responsive fonts using **ProDesign.sp()** will work on mobile, tabs and and mini laptops.

- To get device type use **ProDesign.deviceType** or call **ProDesign.getDeviceType()**.

- For device orientation update use **ProDesign.orientation**. Landscape orientation will change **ProDesign.deviceType** value based on screen width.

  **Check [example](https://pub.dev/packages/pro_design/example) page for code examples**
