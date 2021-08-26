import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoExample());
}

class CupertinoExample extends StatefulWidget {
  const CupertinoExample({Key? key}) : super(key: key);

  @override
  _CupertinoExampleState createState() => _CupertinoExampleState();
}

class _CupertinoExampleState extends State<CupertinoExample> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: ExamplePage());
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  Duration initialtimer = const Duration();
  int selectitem = 1;

  Future<void> bottomSheet(BuildContext context, Widget child,
      {double? height}) {
    return showModalBottomSheet(
        isScrollControlled: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13), topRight: Radius.circular(13))),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => SizedBox(
            height: height ?? MediaQuery.of(context).size.height / 3,
            child: child));
  }

  Widget button(String text, {required Function onPressed, Color? color}) {
    return Container(
      width: 200,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: color ?? Colors.redAccent,
      child: MaterialButton(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
          onPressed: () => onPressed()),
    );
  }

  String? time;
  String? dateTime;
  var list = List<int>.generate(10, (i) => i + 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              button(
                "Cupertino Picker",
                color: Colors.blueAccent,
                onPressed: () {
                  Widget child = Scaffold(
                      appBar: AppBar(
                        title: const Text(
                          "CupertinoPicker",
                          textAlign: TextAlign.justify,
                        ),
                        backgroundColor: Colors.teal,
                        actions: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () {},
                          )
                        ],
                      ),
                      body: CupertinoPicker(
                        magnification: 1.2,
                        backgroundColor: Colors.black87,
                        children: list
                            .map((e) => Text(
                                  "Text Widget $e",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ))
                            .toList(),
                        itemExtent: 30, //height of each item
                        looping: true,
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            selectitem = index;
                          });
                        },
                      ));
                  bottomSheet(context, child,
                      height: MediaQuery.of(context).size.height / 2);
                },
              ),
              Text('$selectitem'),
            ],
          ),
        ),
      ),
    );
  }
}
