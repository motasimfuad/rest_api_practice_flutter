import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rest_api_practice/models/user-model.dart';
import 'package:rest_api_practice/screens/login_screen.dart';
import 'package:rest_api_practice/screens/products.dart';
import 'package:rest_api_practice/screens/users.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

final box = GetStorage();

Map<String, dynamic> settings = {};

Map<String, bool> defaultSettings = {
  'Audio Enabled': false,
  'Music Enabled': false,
  'Show notification': false,
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserModel userModel = UserModel(id: 001, name: 'Fuad', age: 26);
  String userJson = '{"id": "001", "name": "Fuad", "age": "26"}';

  int counter = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
      _counter++;

      box.write('counter', _counter);
    });
  }

  @override
  void initState() {
    settings = box.read('settings') ?? defaultSettings;

    if (box.read('counter') != null) {
      _counter = box.read('counter');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    box.writeIfNull('counter', 0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page: ' + (box.read('title') ?? 'n/a')),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                'Normal counter: $counter',
                // box.read('counter'),
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'Stored counter: ${box.read('counter')}',
                // box.read('counter'),
                style: Theme.of(context).textTheme.headline4,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    box.write('title', 'Changed');
                  });
                },
                child: const Text('Change'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    box.remove('title');
                    box.remove('counter');
                  });
                },
                child: const Text('Remove'),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: settings.length,
                  itemBuilder: (BuildContext context, int index) {
                    var key = settings.keys.elementAt(index);
                    return CheckboxListTile(
                      title: Text(key),
                      value: settings[key],
                      onChanged: (value) {
                        setState(() {
                          settings[key] = value;
                        });
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await box.write('settings', settings);
                },
                child: const Text('Save Settings'),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('user map: $userModel');
                      Map<String, dynamic> userMap = userModel.toJson();
                      var json = jsonEncode(userMap);
                      print(json);
                    },
                    child: const Text('Serialize'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('userJson: $userJson');
                      var decoded = jsonDecode(userJson);
                      Map<String, dynamic> userMap = decoded;
                      UserModel newUser = UserModel.fromJson(userMap);
                      print('user map: $newUser'.toString());
                    },
                    child: const Text('Deserialize'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Users()),
                      );
                    },
                    child: const Text('User page'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: const Text('Login page'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Products()),
                      );
                    },
                    child: const Text('Products page'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
