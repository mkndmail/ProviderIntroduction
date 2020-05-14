import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: MyText(),
            ),
            body: Level1(),
          ),
        ),
        create: (context) => Data());
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Text(Provider.of<Data>(context).getData());
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Text(Provider.of<Data>(context, listen: false).getData());
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TextField(
        onChanged: (newValue) {
          Provider.of<Data>(context).setData(newValue);
        },
      );
}

class Data extends ChangeNotifier {
  String _data = 'Hello  notifier';

  void setData(String newData) {
    _data = newData;
    notifyListeners();
  }

  getData() => _data;
}
