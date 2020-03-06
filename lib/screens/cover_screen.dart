import 'package:destini_challenge_starting/screens/story_page.dart';
import 'package:flutter/material.dart';

class CoverScreen extends StatefulWidget {
  @override
  _CoverScreenState createState() => _CoverScreenState();
}

class _CoverScreenState extends State<CoverScreen> {
  int num = 1;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(0),
      child: Scaffold(
        body: SizedBox.expand(
          child: Container(
              child: Image.asset('images/coverpage/coverpage$num.png', fit: BoxFit.fill,gaplessPlayback: true,),

              ),
        ),
      ),

      onPressed: () {
        setState(
          () {

            if (num >= 4) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StoryPage()));
            }else{
              num++;
            }
          },
        );
      },
    );
  }
}



