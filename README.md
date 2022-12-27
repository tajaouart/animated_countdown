

A light widget to display a countdown animation.

## Features

You can customize the duration and the text style.

## Getting started

To start the countdown juste display the widget and it will disappear after the given duration.
It is recommended to hide the widget once the countdown has finished.



## Usage

to `/example` folder.

```dart
import 'material.dart';

Center(
    child: CountDownWidget(
      duration: myWidget.timerDuration,
      onEnd: () {
      setState(() {
      displayTimer = false;
      });
      },
    ),
),




```

## Additional information

Don't hesitate to contribute or contact me if needed.
