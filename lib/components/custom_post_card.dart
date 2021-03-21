import 'package:flutter/material.dart';

class CustomPostCard extends StatelessWidget {
  final String userImgUrl;
  final String name;
  final String location;
  final String postImgUrl;
  final int waiting;
  final String credibiility;
  final String description;
  final Function onPressed;

  const CustomPostCard(
      {Key key,
      this.userImgUrl,
      this.name,
      this.location,
      this.postImgUrl,
      this.waiting,
      this.credibiility,
      this.description,
      this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      child: Column(
        children: [
          ListTile(
            title: Text(name),
            subtitle: Text(location),
            leading: Icon(Icons.person),
            trailing: IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: onPressed,
            ),
          ),
          Container(height: 40, color: Colors.green),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text('$waiting Waiting'),
                        Text('Credibility: $credibiility')
                      ],
                    ),
                    MaterialButton(
                      height: 64,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      onPressed: onPressed,
                      child:
                          Text('DEAL', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                Text(description)
              ],
            ),
          )
        ],
      ),
    );
  }
}
