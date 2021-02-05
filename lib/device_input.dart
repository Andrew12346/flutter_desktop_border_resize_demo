import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class DeviceInputListener extends StatefulWidget {
  final Widget child;

  final Key key;

  final FocusNode focusNode;

  DeviceInputListener({
    @required this.child,
    this.key,
    this.focusNode,
  })  : assert(child != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DeviceInputListenerState();
  }
}

class DeviceInputListenerState extends State<DeviceInputListener> {

  //鼠标进入区域
  void _onEnter(PointerEnterEvent event) {
    print("enterWidget: " + event.toStringFull());
  }

  //鼠标离开区域
  void _onExit(PointerExitEvent event) {
    print("exitWidget: " +event.toStringFull());
  }

  //鼠标在该区域滑动
  void _onHover(PointerHoverEvent event) {
    print("hover widget: " + event.toStringFull());
  }

  //鼠标滚轮滑动
  void _onPointerSignal(PointerSignalEvent event){
    print(event.toStringFull());
  }

  void _onPointerUp(PointerUpEvent event){
    print(event.toStringFull());
  }

  void _onPointerDown(PointerDownEvent event){
    print(event.toStringFull());
  }

  void _onPointerCancel(PointerCancelEvent event){
    print(event.toStringFull());
  }

  void _onPointerMove(PointerMoveEvent event){
    print(event.toStringFull());
  }


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      onHover: _onHover,
      cursor: SystemMouseCursors.resizeColumn,
      child: Listener(
        onPointerSignal: _onPointerSignal,
        onPointerMove: _onPointerMove,
        onPointerDown: _onPointerDown,
        onPointerUp: _onPointerUp,
        onPointerCancel: _onPointerCancel,
        child: RawKeyboardListener(
          focusNode: widget.focusNode,
          child: widget.child,
        ),
      ),
    );
  }
}
