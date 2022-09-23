import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {



    double screenWidth = MediaQuery.of(context).size.width;
    return
    GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: AspectRatio(
            aspectRatio: 0.8,
            child: Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                ],
                maxLength: 50,
                // expands: true,
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ことばを残そう(140文字まで)',
                  isDense: true,
                  contentPadding: EdgeInsets.all(10)
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              )
            )
          )
        )
      )
    );
  }
}

// AspectRatio(
//   aspectRatio: 1,
//   child: Container(
//     width: double.infinity,
//     child: Text(),
//   ),
// )