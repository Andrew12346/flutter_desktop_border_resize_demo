import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AdjustPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdjustPageState();
  }
}

class AdjustPageState extends State<AdjustPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 200,
          color: Colors.blue,
        ),
        Container(
          width: 100,
          color: Colors.lightGreenAccent,
        ),
        Expanded(
          child: Container(
            color: Colors.lightBlueAccent,
          ),
        ),
      ],
    );
  }
}

class AdjustableColumn extends StatefulWidget {
  final Key key;
  final double leftColumnMinWidth;
  final double leftColumnMaxWidth;
  double leftColumnWidth;
  final double middleColumnWidth;

  AdjustableColumn({
    this.key,
    this.leftColumnMinWidth = 100,
    this.leftColumnMaxWidth = 200,
    this.leftColumnWidth = 150,
    this.middleColumnWidth = 10,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AdjustableColumnState();
  }
}

class AdjustableColumnState extends State<AdjustableColumn> {
  void _onMouseMove(PointerMoveEvent event) {
    setState(() {
      double updatedWidth = widget.leftColumnWidth + event.delta.dx;
      if (updatedWidth < widget.leftColumnMinWidth) {
        widget.leftColumnWidth = widget.leftColumnMinWidth;
      } else if (updatedWidth > widget.leftColumnMaxWidth) {
        widget.leftColumnWidth = widget.leftColumnMaxWidth;
      } else {
        widget.leftColumnWidth = updatedWidth;
      }
    });
  }


  MouseCursor _calculateCursor(){
    if(widget.leftColumnWidth == widget.leftColumnMinWidth){
      return SystemMouseCursors.resizeRight;
    } else if(widget.leftColumnWidth == widget.leftColumnMaxWidth){
      return SystemMouseCursors.resizeLeft;
    }
    return SystemMouseCursors.resizeColumn;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: widget.leftColumnWidth,
          color: Colors.blue,
        ),
        MouseRegion(
          cursor: _calculateCursor(),
          child: Listener(
            onPointerMove: _onMouseMove,
            child: Container(
              width: widget.middleColumnWidth,
              color: Colors.lightGreenAccent,
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.lightBlueAccent,
          ),
        ),
      ],
    );
  }

}
