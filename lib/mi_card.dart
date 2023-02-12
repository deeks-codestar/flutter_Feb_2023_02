import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: double.infinity,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage('https://thumbs.dreamstime.com/b/gradient-cartoon-illustration-cute-singing-kawaii-girl-creative-150389415.jpg'),
              radius: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Nakul Rajan Kumar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "CEO of Hustlers",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(start: 12),
                    child: Icon(
                      Icons.add_ic_call,
                    )
                ),
                labelText: '+1 607 282 2829',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.teal,
      ),

    );
  }
}
