import 'package:flutter/material.dart';
import 'package:toonflix/models/user.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/services/service.dart';

class JsonParse extends StatefulWidget {
  const JsonParse({super.key});

  @override
  State<JsonParse> createState() => _JsonParseState();
}

class _JsonParseState extends State<JsonParse> {
  List<User> _user = <User>[];
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Services.getInfo().then(
      (value) => setState(
        () {
          _user = value;
          loading = true;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loading ? 'User' : 'loading'),
      ),
      body: ListView.builder(
          itemCount: _user.length,
          itemBuilder: (context, index) {
            User user = _user[index];
            return ListTile(
              leading: const Icon(
                Icons.account_circle_rounded,
                color: Colors.blue,
              ),
              trailing: const Icon(
                Icons.phone_android_outlined,
                color: Colors.red,
              ),
              title: Text(user.name),
              subtitle: Text(user.email),
            );
          }),
    );
  }
}
