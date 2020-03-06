import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';



StoryBrain storyBrain = StoryBrain();
String type;
int storyNumber;




class StoryPage extends StatefulWidget {

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    type = storyBrain.getType();
    storyNumber = storyBrain.getStoryNumber();





    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Page ${storyNumber+1}', style: TextStyle(fontWeight: FontWeight.w400),),
        leading: Container(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              // Show image if it's a textimage or fullimage display
              (type == 'textimage'|| type == 'fullimage')? DisplayImage(): SizedBox(),
              //Show text if it's a textimage or fultext
              (type =='textimage'|| type == 'fulltext')?DisplayText() : SizedBox(),
              //Show scroll down if there's a text. No text = SizedBox(),
              (type =='textimage'|| type == 'fulltext')? SizedBox(
                height: 40.0,
                child: Center(child: FadeAnimatedTextKit(
                  text: [ "SCROLL DOWN️"],
                  textStyle: TextStyle(fontSize: 12.0,letterSpacing: 1.7, fontWeight: FontWeight.w300, color: Colors.grey[700],),
                  totalRepeatCount :1000,),),
              ): SizedBox(),

              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(storyBrain.getChoice1Page()-1);
                    });
                    //Choice 1 made by user.
                  },
                  color: Colors.red,
                  child: Text(
                    storyBrain.getChoice1(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      setState(() {
                        storyBrain.nextStory(storyBrain.getChoice2Page()-1);
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      storyBrain.getChoice2(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.center,
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




class DisplayText extends StatefulWidget {
  @override
  _DisplayTextState createState() => _DisplayTextState();
}

class _DisplayTextState extends State<DisplayText> {



  @override
  Widget build(BuildContext context) {
    //The ScrollController keeps the text starting position at the top, after user scrolls down in the previous page.
    ScrollController _controller = ScrollController();
    Timer(Duration(milliseconds: 0), () => _controller.jumpTo(_controller.position.minScrollExtent));

    return Expanded(
      flex: 12,
      child: ListView(
        controller: _controller,
        children: <Widget>[
          Text(
            storyBrain.getStory(),
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w200,
              height : 1.7,
            ),
          ),
        ],

      ),
    );//image code

  }
}


class DisplayImage extends StatefulWidget {
  @override
  _DisplayImageState createState() => _DisplayImageState();
}


class _DisplayImageState extends State<DisplayImage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 12,
      child:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/story/page${storyNumber+1}.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
