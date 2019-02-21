import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<int> mList;
  List<ExpandStateBean> expanStateList;

  _ExpansionPanelDemoState() {
    mList = new List();
    expanStateList = new List();
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expanStateList.add(ExpandStateBean(i, false));
    }
  }

  _setCurrentIndex(int index, isExpand) {
    setState(() {
      expanStateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expansionPanel list'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, bol) {
            _setCurrentIndex(index, bol);
          },
          children: mList.map((index) {
            return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text('this is No.$index'),
                  );
                },
                body: ListTile(
                  title: Text('expansion No.$index'),
                ),
                isExpanded: expanStateList[index].isOpen);
          }).toList(),
        ),
      ),
    );
  }
}

class ExpandStateBean {
  var isOpen;
  var index;
  ExpandStateBean(this.index, this.isOpen);
}
