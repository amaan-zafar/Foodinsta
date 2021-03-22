import 'package:flutter/material.dart';
import 'package:food_insta/remove_later/post_json.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:
                            NetworkImage('https://picsum.photos/250?image=9'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(posts[0]['name'])
                ],
              ),
              Icon(Icons.more_horiz),
            ],
          ),
        ),
        SizedBox(height: 12),
        Container(
          height: 400,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/250?image=9'),
                  fit: BoxFit.cover)),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [Text(posts[0]['name'])],
              ),
              MaterialButton(
                elevation: 0.0,
                color: Colors.black,
                textColor: Colors.white,
                child: Text('DEAL'),
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
