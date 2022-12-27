

A light widget to display a countdown animation.


<img src="https://raw.githubusercontent.com/tajaouart/animated_countdown/main/countdown_demo.gif" height="600"/>

## Features

You can customize the duration and the text style.

## Getting started

To start the countdown juste display the widget and it will disappear after the given duration.
It is recommended to hide the widget once the countdown has finished.



## Usage



```dart
final myWidget = CountDownWidget(
  stepDuration: 3,
  textStyle: const TextStyle(color: Colors.red),
  maxTextSize: 100,
  minTextSize: 10,
  onEnd: () {
    // do some job
  },
);

```

## Additional information

Don't hesitate to contribute or contact me if needed.
