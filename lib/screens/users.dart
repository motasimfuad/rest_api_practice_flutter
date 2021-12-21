import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_practice/models/user.dart';

List<User> users = [];

Future<List<User>> getUsers() async {
  var userUrl = Uri.parse('https://jsonplaceholder.typicode.com/users');
  final response = await http.get(userUrl);
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    users.clear();
    for (var user in data) {
      users.add(User.fromJson(user));
    }
    print(users);
    return users;
  } else {
    print(users);
    return users;
  }
}

class Users extends StatefulWidget {
  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: SafeArea(
        child: Expanded(
          child: FutureBuilder(
            future: getUsers(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            users[index].name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'ID: ${users[index].id}',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Email: ${users[index].email}',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
