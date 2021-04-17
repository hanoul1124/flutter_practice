import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MiCard());
}

class MiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 54.0,
                backgroundColor: Colors.tealAccent.shade700,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/puppy.jpeg'),
                ),
              ),
              Text(
                'Dohyang Kim',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 36.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0),
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                'Backend Developer',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 24.0,
                  color: Colors.tealAccent.shade200,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 200.0,
                child: Divider(
                  color: Colors.tealAccent,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 24.0,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+82 10 4680 7046',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    size: 24.0,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'hanoul1124@gmail.com',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
