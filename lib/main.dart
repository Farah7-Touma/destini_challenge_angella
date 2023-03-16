import 'package:destini_challenge_angella/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Destini'),
          backgroundColor: Colors.red,
        ),
        body:  const StoryPage(),
      ),
    ),
  );
}


class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain sb = StoryBrain();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        //constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    sb.getStory(),
                    style: const TextStyle(
                      fontSize: 25.0,
                      color:Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.red,
                  child: InkWell(
                    onTap: () {
                      //Choice 1 made by user.
                      setState(() {
                        sb.nextStory(1);
                      });
                    },
                    child: Center(
                      child: Text(
                        sb.getChoice1(),
                        style: const TextStyle(
                          fontSize: 18.0,
                          color:Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: sb.buttonShouldBeVisible(),
                  child: Container(
                    color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          sb.nextStory(2);
                        });
                        //Choice 2 made by user.
                      },
                      child: Center(
                        child: Text(
                          sb.getChoice2(),
                          style: const TextStyle(
                            fontSize: 18.0,
                            color:Colors.white,
                          ),
                        ),
                      ),
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

