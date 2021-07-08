import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class BasicDragDrop extends StatefulWidget {
  const BasicDragDrop({Key? key}) : super(key: key);

  @override
  _BasicDragDropState createState() => _BasicDragDropState();
}

GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

class _BasicDragDropState extends State<BasicDragDrop> {
  bool _isDropped = false;
  String _color = 'red';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Draggable<String>(
                // Data is the value this Draggable stores.
                data: _color,
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  child: Center(
                    child: Image.asset('assets/images/tomato.png'),
                  ),
                ),
                feedback: Container(
                  height: 120.0,
                  width: 120.0,
                  child: Center(
                    child: Image.asset('assets/images/tomato.png'),
                  ),
                ),
                childWhenDragging: Container(
                  height: 120.0,
                  width: 120.0,
                  child: Center(
                    child: Image.asset('assets/images/tomato_greyed.png'),
                  ),
                ),
                //axis: Axis.vertical,
                // onDragCompleted: () {
                //   scaffoldKey.currentState
                //       ?.showSnackBar(SnackBar(content: Text("Correct!")));
                // },
                // onDragStarted: () {
                //   showSnackBarGlobal(context, 'Drag start');
                // },
                // onDragEnd: (dragDetails) {
                //   showSnackBarGlobal(context, 'Drag end');
                // },
                // onDraggableCanceled: (velocity, offset) {
                //   showSnackBarGlobal(context, 'Drag cancelled');
                // },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              DragTarget<String>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    padding: EdgeInsets.all(6),
                    color: Colors.white,
                    strokeWidth: 2,
                    dashPattern: [8],
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        height: 300,
                        width: 300,
                        child: Center(
                          child: Image.asset(_isDropped
                              ? 'assets/images/bowl_full.png'
                              : 'assets/images/bowl.png'),
                        ),
                      ),
                    ),
                  );
                },
                // onWillAccept: (data) {
                //   return true;
                // },
                onAccept: (data) {
                  debugPrint('hi $data');
                  setState(() {
                    //showSnackBarGlobal(context, 'Dropped successfully!');
                    _isDropped = true;
                  });
                },
                onMove: (dragtarget) {
                  //print('I am over droppable area');
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //     content: Text(
                  //   'Yay! A SnackBar!',
                  //   textScaleFactor: 2,
                  // )));
                },
                onWillAccept: (data) {
                  return data == _color;
                },
                onLeave: (data) {
                  //showSnackBarGlobal(context, 'Missed');
                },
              ),
            ],
          ),
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
