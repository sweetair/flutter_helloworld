import 'package:flutter/material.dart';
import 'jspang/bottomAppBarDemo.dart';
import 'jspang/pages.dart';
import 'jspang/frostedGlassDemo.dart';
import 'jspang/keepAliveDemo.dart';
import 'jspang/searchBarDemo.dart';
import 'jspang/wrapDemo.dart';
import 'jspang/expansionTileDemo.dart';
import 'jspang/expansionPanelList.dart';
import 'jspang/customClipper.dart';
import 'jspang/splashScreen.dart';
import 'jspang/rightBackDemo.dart';
import 'jspang/toolTipsDemo.dart';
import 'jspang/draggableDemo.dart';
import 'flutterChinaDemos/demo001.dart';
import 'flutterChinaDemos/demo002.dart';
import 'flutterChinaDemos/demo003.dart';
import 'flutterChinaDemos/shoppingListItem.dart';
import 'flutterChinaDemos/shoppingList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Way2Coding',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  List<Widget> myTabs = [];

  @override
  void initState() {
    super.initState();
    controller = new TabController(initialIndex: 0, vsync: this, length: 2);
    myTabs
      ..add(Tab(text: "技术胖", icon: Icon(Icons.home)))
      ..add(Tab(text: "FlutterChina", icon: Icon(Icons.games)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demos -- way2coding'),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          JSPang(),
          FlutterChina(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: const Color(0xFFF0EEEF), //底部导航栏主题颜色
        child: new Container(
          height: 85.0,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: const Color(0xFFd0d0d0),
                blurRadius: 3.0,
                spreadRadius: 2.0,
                offset: Offset(-1.0, -1.0),
              ),
            ],
          ),
          child: new TabBar(
            controller: controller,
            indicatorColor: Theme.of(context).primaryColor, //tab标签的下划线颜色
            indicatorWeight: 3.0,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: const Color(0xFF8E8E8E),
            tabs: myTabs,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class JSPang extends StatefulWidget {
  _JSPangState createState() => _JSPangState();
}

class _JSPangState extends State<JSPang> {
  final List _jspang = new List<MapEntry<String, Widget>>();

  @override
  void initState() {
    super.initState();
    _jspang
      ..add(MapEntry("不规则底部工具栏", BottomAppBarDemo()))
      ..add(MapEntry("酷炫的路由动画", FirstPage()))
      ..add(MapEntry("毛玻璃效果", FrostedGlassDemo()))
      ..add(MapEntry("保持页面状态", KeepAliveDemo()))
      ..add(MapEntry("搜索条", SearchBarDemo()))
      ..add(MapEntry("展开闭合", ExpansionTileDemo()))
      ..add(MapEntry("展开闭合列表", ExpansionPanelDemo()))
      ..add(MapEntry("闪屏动画", SplashScreen()))
      ..add(MapEntry("右滑返回上一页", RightBackDemo()))
      ..add(MapEntry("拖拽控件", DraggableDemo()))
      ..add(MapEntry("流式布局", WrapDemo()))
      ..add(MapEntry("贝塞尔曲线", ClipperPage()))
      ..add(MapEntry("轻提示", ToolTipsDemo()))
      ..add(MapEntry("HomePage", HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: _jspang.map((index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(index.key[0]),
            ),
            title: Text(index.key),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return index.value;
              }));
            },
          );
        }).toList(),
      ),
    );
  }
}

class FlutterChina extends StatefulWidget {
  _FlutterChinaState createState() => _FlutterChinaState();
}

class _FlutterChinaState extends State<FlutterChina> {
  final List _flutterChina = new List<MapEntry<String, Widget>>();

  @override
  void initState() {
    super.initState();

    _flutterChina
      ..add(MapEntry("MyScaffold", MyScaffold()))
      ..add(MapEntry("TutorialHome", TutorialHome()))
      ..add(MapEntry("计数器", Counter()))
      ..add(MapEntry(
        "购物车",
        ShoppingList(
          products: new List<Product>()
            ..add(Product(name: '鸡蛋'))
            ..add(Product(name: '面粉'))
            ..add(Product(name: '巧克力'))
            ..add(Product(name: '薯片'))
            ..add(Product(name: '薯片'))
            ..add(Product(name: '薯片'))
            ..add(Product(name: '薯片'))
            ..add(Product(name: '薯片'))
            ..add(Product(name: '薯片'))
            ..add(Product(name: '薯片'))
            ..add(Product(name: '薯片4'))
            ..add(Product(name: '薯片5'))
            ..add(Product(name: '薯片6'))
            ..add(Product(name: '薯片7'))
            ..add(Product(name: '薯片8'))
            ..add(Product(name: '薯片9'))
            ..add(Product(name: '薯片10'))
            ..add(Product(name: '薯片')),
        ),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: _flutterChina.map((index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(index.key[0]),
            ),
            title: Text(index.key),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return index.value;
              }));
            },
          );
        }).toList(),
      ),
    );
  }
}
