import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//如何监听Android Activity生命周期事件

//resumed - 应用程序可见并响应用户输入。这是来自Android的onResume
//inactive - 应用程序处于非活动状态，并且未接收用户输入。此事件在Android上未使用，仅适用于iOS
//paused - 应用程序当前对用户不可见，不响应用户输入，并在后台运行。这是来自Android的暂停
//suspending - 该应用程序将暂时中止。这在iOS上未使用

class LifecycleWatcher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LifecycleWatcherState();
}

class _LifecycleWatcherState extends State with WidgetsBindingObserver {

  AppLifecycleState _appLifecycleState;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      _appLifecycleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_appLifecycleState == null)
      return new Text('This widget has not observed any lifecycle changes.',
          textDirection: TextDirection.ltr);
    return new Text(
        'The most recent lifecycle state this widget observed was: $_appLifecycleState.',
        textDirection: TextDirection.ltr);
  }
}

void main() {
  runApp(new Center(child: new LifecycleWatcher()));
}