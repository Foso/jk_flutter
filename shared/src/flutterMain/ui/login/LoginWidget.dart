import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.left,
        ),
      ),
      body: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                suffixIcon: Icon(Icons.account_box),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.account_box),
              ),
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
