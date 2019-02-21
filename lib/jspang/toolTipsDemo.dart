import 'package:flutter/material.dart';

class ToolTipsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tool tips demo'),
      ),
      body: Center(
        child: Tooltip(
          message: '不要点我，啥也点不出来',
          child: Image.network(
              'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=555998589,3675625617&fm=26&gp=0.jpg'),
        ),
      ),
    );
  }
}
