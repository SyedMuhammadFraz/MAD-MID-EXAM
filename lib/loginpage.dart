import 'package:flutter/material.dart';
import 'package:mid_term_exam/friendlist.dart';
import 'package:mid_term_exam/friends.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Registration/ SignUP',
            style: TextStyle(fontSize: 28,
            fontWeight: FontWeight.bold),),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Forgot password code here
              },
              child: Text('Forgot password?'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                  String email = _usernameController.text;
                  if (email.isEmpty) {
                    // Show an error message if email is empty
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Email cannot be empty.'),),
                  );
                  }
                  else {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                        FriendsListPage()),
                    );
                  }

              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
