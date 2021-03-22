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
      this.name = 'Amaan Zafar',
      this.location = 'Patna, India',
      this.postImgUrl,
      this.waiting = 14,
      this.credibiility = 'Super',
      this.description = 'kadklsfjlajkld',
      this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Amaan')
          // ListTile(
          //   title: Text(name),
          //   subtitle: Text(location),
          //   leading: Icon(Icons.person),
          //   trailing: IconButton(
          //     icon: Icon(Icons.more_horiz),
          //     onPressed: onPressed,
          //   ),
          // ),
          // Container(color: Colors.green),
          // Container(
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           Column(
          //             children: [
          //               Text('$waiting Waiting'),
          //               Text('Credibility: $credibiility')
          //             ],
          //           ),
          //           MaterialButton(
          //             color: Colors.black,
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(4)),
          //             onPressed: onPressed,
          //             child:
          //                 Text('DEAL', style: TextStyle(color: Colors.white)),
          //           ),
          //         ],
          //       ),
          //       Text(description)
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
