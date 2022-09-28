import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'keyboardoverlay.dart';
import 'formatter/maxLineFormatter.dart';

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

  FocusNode numberFocusNode = FocusNode();
  TextEditingController textController = TextEditingController();
  final int maxLength = 20;
  final int maxVisibleLines = 5;
  final int maxLinesForced = 5;

  @override
  void initState() {
    super.initState();
    numberFocusNode.addListener(() {
      bool hasFocus = numberFocusNode.hasFocus;
      if (hasFocus) {
        KeyboardOverlay.showOverlay(context);
      } else {
        KeyboardOverlay.removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    // Clean up the focus node
    numberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              alignment: Alignment.centerLeft,
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                  MaxLinesTextInputFormatter(maxLinesForced),
                ],
                textAlign: TextAlign.center,
                // textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.multiline,
                maxLength: maxLength,
                maxLines: maxVisibleLines,
                focusNode: numberFocusNode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ことばを残そう',
                  // isDense: true,
                  contentPadding: EdgeInsets.all(10.0)
                ),
                style: const TextStyle(
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