import 'package:flutter/material.dart';

class Searching extends StatefulWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  State<Searching> createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: NetworkImage(
                'https://cdn.dribbble.com/users/3474264/screenshots/16771748/media/71c3710e4011359391975e33c170b54e.png?compress=1&resize=1000x750&vertical=top'),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 50.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  cityName = value;
                },
                decoration: InputDecoration(
                  filled: false,
                  hintText: 'Enter City Name',
                  hintStyle: TextStyle(
                    color: Colors.grey[300],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context,cityName);
              },
              child: Text(
                'Enter',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
