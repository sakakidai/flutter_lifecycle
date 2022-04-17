import 'package:flutter/material.dart';
import 'package:flutter_widget_lifecycle/dummy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      // print("call setState");
      _counter++;
    });
    nextpage();
  }

  void nextpage() async {
    await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return const DummyPage();
    }));
  }

  @override
  void initState() {
    // print("call initState");
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    // print("call didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // print("call build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void didUpdateWidget(oldWidget) {
    // print("call didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // print("call deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    // print("call dispose");
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("stete = $state");
    switch (state) {
      case AppLifecycleState.inactive:
        print('非アクティブになったときの処理');
        break;
      case AppLifecycleState.paused:
        print('停止されたときの処理');
        break;
      case AppLifecycleState.resumed:
        print('再開されたときの処理');
        break;
      case AppLifecycleState.detached:
        print('破棄されたときの処理');
        break;
    }
  }
}
