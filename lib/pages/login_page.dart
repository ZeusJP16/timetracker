import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
          child: FlutterLogo(
            size: 40,
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(90.0),
              ),
              labelText: 'Email',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(90.0),
              ),
              labelText: 'Password',
            ),
          ),
        ),
        Container(
            height: 80,
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Log In'),
              onPressed: () {},
            )),
        TextButton(
          onPressed: () {},
          child: Text(
            'Forgot Password?',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
