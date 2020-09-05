import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interactive_story/Logic.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(InteractiveStory());
}

Logic appLogic = Logic();

class InteractiveStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Interactive Story",
          style: GoogleFonts.nunito(
            fontStyle: FontStyle.normal,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                color: Colors.cyanAccent[200],
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Container(
                      //fit: BoxFi,
                      child: Text(
                        '${appLogic.getStory()[0]}',
                        style: GoogleFonts.gayathri(
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            choiceButton(context, appLogic.getStory()[1], () {
              setState(() {
                appLogic.nextStory(1);
              });
            }, Colors.green, true),
            choiceButton(context, appLogic.getStory()[2], () {
              setState(() {
                appLogic.nextStory(2);
              });
            }, Colors.blue, appLogic.isvisible()),
            choiceButton(context, appLogic.getStory()[3], () {
              setState(() {
                appLogic.nextStory(3);
              });
            }, Colors.orange, appLogic.isvisible()),
          ],
        ),
      ),
    );
  }
}

Widget choiceButton(context, title, onpress, color, visibility) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.all(10),
    height: 50,
    child: Visibility(
        visible: visibility,
        child: RaisedButton(
    color: color,
    onPressed: onpress,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: FittedBox(
      child: Text(
        title,
        style:
            GoogleFonts.raleway(fontSize: 25, fontWeight: FontWeight.w600),
      ),
    ),
        ),
      ),
  );
}
