<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

A flutter debugging tool for the developers to manage the environments and widgets view testing.

## Features

- A picture in picture button view which inspires from Flutter PIPView
https://github.com/lslv1243/pip_view
- The button will open dev environment page

## Getting started
```
flutter pub get jane
```

## Usage

Add Jane wrapper at the top of home

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: JaneWrapper(
        builder: (context) {
          return const MyHomePage(title: 'Flutter Demo Home Page');
        },
        // Create your own view by adding the environment variables
        // - Api environments
        // - Ongoing testing pages
        janeContent: Text('Test'),
      ),
    );
  }
}
```

## Additional information

More information can be get from the original github of the PIPView
https://github.com/lslv1243/pip_view
