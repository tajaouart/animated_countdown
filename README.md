

A light widget to perform a countdown animation.


<img src="https://raw.githubusercontent.com/tajaouart/animated_countdown/main/countdown_demo.gif" height="600"/>

## Features

You can customize the duration and the text style & size.

## Getting started

To start the countdown juste display the widget and it will disappear after the given duration.
It is recommended to hide the widget once the countdown has finished.


## Usage



```dart
CountDownWidget(
  textStyle: const TextStyle(color: Colors.red),
  totalDuration: 3,
  maxTextSize: 100,
  minTextSize: 10,
  onEnd: () {
    // do some job if needed
  },
);
```

## Additional information

Don't hesitate to contribute or to contact me if needed.
