// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputDoneView extends StatelessWidget {
  InputDoneView(
      {Key? key,
      required this.cont,
      this.titype,
      this.obSecure,
      this.formatters,
      required this.label,
      this.maxLines,
      this.minline})
      : super(key: key);
  TextEditingController cont;
  TextInputType? titype;
  String label;
  bool? obSecure;
  List<TextInputFormatter>? formatters;
  int? minline;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          width: double.infinity,
          color: const Color(0xFFEFEFF4),
          child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          controller: cont,
                          obscureText: obSecure ?? false,
                          keyboardType: titype,
                          minLines: minline,
                          maxLines: (obSecure ?? false) ? 1 : maxLines,
                          decoration: InputDecoration(hintText: label),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: CupertinoButton(
                        padding: const EdgeInsets.only(
                            right: 24.0, top: 8.0, bottom: 8.0),
                        onPressed: () {
                          KeyboardOverlay.removeOverlay();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: const Text("Done",
                            style: TextStyle(
                              color: CupertinoColors.activeBlue,
                            )),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}

class KeyboardOverlay {
  static OverlayEntry? _overlayEntry;

  static showOverlay(
      {required BuildContext context,
      required TextEditingController con,
      bool? obsecure,
      TextInputType? type,
      List<TextInputFormatter>? formatters,
      int? maxline,
      int? minline,
      required String label}) {
    if (_overlayEntry != null) {
      return;
    }

    OverlayState? overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: 0.0,
          left: 0.0,
          child: InputDoneView(
            cont: con,
            obSecure: obsecure,
            titype: type,
            formatters: formatters,
            label: label,
            maxLines: maxline,
            minline: minline,
          ));
    });

    overlayState.insert(_overlayEntry!);
  }

  static removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
