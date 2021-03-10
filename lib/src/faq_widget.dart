import 'package:flutter/material.dart';
import 'package:list_expandable/list_expandable_widget.dart';

void faq_widget() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expandable List demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'Expandable List demo',
        data: _generateData(),
      ),
    );
  }

  List<List<String>> _generateData() {
    int numberOfGroups = 5;
    List<List<String>> results = List<List<String>>();
    for (int i = 0; i < numberOfGroups; i++) {
      List<String> items = List<String>();
      for (int j = 1; j < 6; j++) {
        items.add("Item $j in group $i");
      }
      results.add(items);
    }
    return results;
  }
}

class MyHomePage extends StatefulWidget {
  final List<List<String>> data;
  MyHomePage({Key key, this.title, this.data}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: widget.data.map((group) {
              int index = widget.data.indexOf(group);
              return ListExpandableWidget(
                isExpanded: index == 0,
                header: _header('Group $index'),
                items: _buildItems(context, group),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _header(String name) => Text(name,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ));
  List<ListTile> _buildItems(BuildContext context, List<String> items) => items
      .map((e) => ListTile(
            title: Text(e),
          ))
      .toList();
}
