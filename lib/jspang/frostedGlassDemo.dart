import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            //约束盒子组件，添加额外的约束条件
            constraints: const BoxConstraints.expand(),
            child: Image.network(
                'http://www.pptbz.com/pptpic/UploadFiles_6909/201211/2012111719294197.jpg'),
          ),
          Center(
            child: ClipRect(
              //可裁切的矩形
              child: BackdropFilter(
                //背景过滤器
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 500.0,
                    height: 700.0,
                    decoration:
                        BoxDecoration(color: Colors.grey.shade200), //盒子修饰器
                    child: Center(
                      child: Text(
                        '模糊Blur',
                        style: Theme.of(context).textTheme.display3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
