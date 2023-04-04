import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class SingleStory extends StatefulWidget {
  @override
  State<SingleStory> createState() => _SingleStoryState();
}

class _SingleStoryState extends State<SingleStory> {
  final StoryController controller = StoryController();

  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,

        title:  Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://images.unsplash.com/photo-1572537165377-627a37043464?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGl4ZWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")),
            shape: BoxShape.circle,
            border: Border.all(
                width: 2,
                color:
                     Colors.white
                   ),
          )),

      ),
      backgroundColor: Colors.black,
      body: StoryView(
        storyItems: [
          StoryItem.text(
            title: "There’s a real sweet spot between challenge and hope,leaders make pathways that keep both firmly in view.",
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: "Young people have an almost biological destiny to be hopeful",
            backgroundColor: Colors.red.shade800,
            textStyle: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),
   StoryItem.text(
            title: "Experience is the name everyone gives to their mistakes",
            backgroundColor: Colors.deepOrange,
            textStyle: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ), StoryItem.text(
            title: "Knowledge is power",
            backgroundColor: Colors.black,
            textStyle: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 30,
            ),
          ), StoryItem.text(
            title: "In order to be irreplaceable, one must always be different",
            backgroundColor: Colors.green.shade800,
            textStyle: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),

        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }}