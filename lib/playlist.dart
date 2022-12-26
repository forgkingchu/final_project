import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin:Alignment.topCenter,
          end: Alignment.bottomCenter,
            colors: [
              Color(0xFF30351).withOpacity(0.6),
              Color(0XFF303151).withOpacity(0.9),
            ]

        )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top:20,left:22),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(right: 15)
                ),

              ],

            )
          ),
        ),


      )
      );

  }
}
