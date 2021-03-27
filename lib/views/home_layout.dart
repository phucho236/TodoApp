import 'package:TodoApp/views/add_todo_dialog.dart';
import 'package:TodoApp/views/home_page.dart';
import 'package:TodoApp/widget/icon_tab_widget.dart';
import 'package:flutter/material.dart';
class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}
class _HomeLayoutState extends State<HomeLayout>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Widget> _tabBars;
  List<Widget> tabScreen = <Widget>[
    HomePage(
      type: 1,
    ),
    HomePage(
      type: 2,
    ),
    HomePage(
      type: 3,
    ),
  ];
  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoApp"),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: tabScreen,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _openAddItemDialog(context);
          }),
      bottomNavigationBar: Container(
        height: 56,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Colors.grey.withOpacity(0.3),
              offset: Offset(0, -5),
            ),
          ],
          color: Colors.white,
        ),
        child: TabBar(
          controller: _tabController,
          tabs: _tabBars,
          indicatorPadding: EdgeInsets.all(5.0),
          unselectedLabelColor: Color(0xFFB4B4B4),
          labelColor: Colors.blue,
          labelStyle: TextStyle(fontSize: 10),
          indicator: BoxDecoration(),
        ),
      ),
    );
  }
  _openAddItemDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => AddTodoDialog());
  }
  _init() async {
    _tabBars = <Widget>[
      IconTabWidget(
        child: Column(
          children: <Widget>[
            Icon(Icons.home),
            Text('All'),
          ],
        ),
      ),
      IconTabWidget(
        child: Column(
          children: <Widget>[Icon(Icons.check), Text('Complete')],
        ),
      ),
      IconTabWidget(
        child: Column(
          children: <Widget>[Icon(Icons.close), Text('Incomplete')],
        ),
      ),
    ];

    _tabController = TabController(vsync: this, length: _tabBars.length);
  }
}
