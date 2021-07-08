import 'package:flutter/material.dart';

class Puzzle extends StatefulWidget {
  const Puzzle({Key? key}) : super(key: key);

  @override
  _PuzzleState createState() => _PuzzleState();
}

GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

class _PuzzleState extends State<Puzzle> {
  bool _isBlueDropped = false;
  bool _isRedDropped = false;
  bool _isYelloDropped = false;
  bool _isGreenDropped = false;
  String _blue = 'blue';
  String _red = 'red';
  String _yellow = 'yellow';
  String _green = 'green';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 20,
            ),
            Center(
              child: Container(
                height: 314,
                width: 315,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: DragTarget<String>(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return Container(
                            height: 160,
                            width: 200,
                            child: Image.asset(_isBlueDropped
                                ? 'assets/images/bo.png'
                                : 'assets/images/bt.png'),
                          );
                        },
                        onWillAccept: (data) {
                          return data == _blue;
                        },
                        onAccept: (data) {
                          setState(() {
                            _isBlueDropped = true;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: DragTarget<String>(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return Container(
                            height: 200,
                            width: 160,
                            child: Image.asset(_isRedDropped
                                ? 'assets/images/ro.png'
                                : 'assets/images/rt.png'),
                          );
                        },
                        onWillAccept: (data) {
                          return data == _red;
                        },
                        onAccept: (data) {
                          setState(() {
                            _isRedDropped = true;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: DragTarget<String>(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return Container(
                            height: 200,
                            width: 160,
                            child: Image.asset(_isYelloDropped
                                ? 'assets/images/yo.png'
                                : 'assets/images/yt.png'),
                          );
                        },
                        onWillAccept: (data) {
                          return data == _yellow;
                        },
                        onAccept: (data) {
                          setState(() {
                            _isYelloDropped = true;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: DragTarget<String>(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return Container(
                            height: 160,
                            width: 200,
                            child: Image.asset(_isGreenDropped
                                ? 'assets/images/go.png'
                                : 'assets/images/gt.png'),
                          );
                        },
                        onWillAccept: (data) {
                          return data == _green;
                        },
                        onAccept: (data) {
                          setState(() {
                            _isGreenDropped = true;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            Divider(
              thickness: 5,
              color: Colors.white,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Visibility(
                      visible: !_isRedDropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: _red,
                        child: Container(
                          height: 165.0,
                          width: 165.0,
                          child: Center(
                            child: Image.asset('assets/images/ro.png'),
                          ),
                        ),
                        feedback: Container(
                          height: 165.0,
                          width: 165.0,
                          child: Center(
                            child: Image.asset('assets/images/ro.png'),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                    Visibility(
                      visible: !_isGreenDropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: _green,
                        child: Container(
                          height: 165.0,
                          width: 165.0,
                          child: Center(
                            child: Image.asset('assets/images/go.png'),
                          ),
                        ),
                        feedback: Container(
                          height: 165.0,
                          width: 165.0,
                          child: Center(
                            child: Image.asset('assets/images/go.png'),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                    Visibility(
                      visible: !_isBlueDropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: _blue,
                        child: Container(
                          height: 165.0,
                          width: 165.0,
                          child: Center(
                            child: Image.asset('assets/images/bo.png'),
                          ),
                        ),
                        feedback: Container(
                          height: 165.0,
                          width: 165.0,
                          child: Center(
                            child: Image.asset('assets/images/bo.png'),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                    Visibility(
                      visible: !_isYelloDropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: _yellow,
                        child: Container(
                          height: 165.0,
                          width: 165.0,
                          child: Center(
                            child: Image.asset('assets/images/yo.png'),
                          ),
                        ),
                        feedback: Container(
                          height: 165.0,
                          width: 165.0,
                          child: Center(
                            child: Image.asset('assets/images/yo.png'),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void showSnackBarGlobal(BuildContext context, String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      message,
      textScaleFactor: 2,
    )));
  }
}
