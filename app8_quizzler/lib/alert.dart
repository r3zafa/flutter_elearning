import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ShowAlert {
  late String title;
  late String desc;
  late BuildContext context;
  late AlertType type;
  bool _confirmed = false;

  bool getConfirm() {
    return _confirmed;
  }

  DialogButton _cancelButton() {
    return DialogButton(
      onPressed: () {
        if (kDebugMode) {
          print('canceled');
        }
        Navigator.pop(context);
      },
      width: 120,
      color: Colors.red,
      child: Text("Cancel",
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.white)),
    );
  }

  DialogButton _confirmBtn() {
    return DialogButton(
      onPressed: () {
        _confirmed = true;
        if (kDebugMode) {
          print('confirmed');
        }
        Navigator.pop(context);
      },
      width: 120,
      color: type == AlertType.success ? Colors.green : Colors.blue,
      child: Text("OK",
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.white)),
    );
  }

  List<DialogButton> _addButtons() {
    if (type == AlertType.success) {
      return [_confirmBtn()];
    } else if (type == AlertType.warning) {
      return [_cancelButton(), _confirmBtn()];
    } else {
      return [];
    }
  }

  _alert() => Alert(
        context: context,
        title: title,
        type: type,
        desc: desc,
        style: AlertStyle(
          isCloseButton: true,
          backgroundColor: Colors.blueGrey.shade900,
          titleStyle: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          descStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        buttons: _addButtons(),
      );

  show() {
    _alert().show();
  }

  ShowAlert({
    required this.title,
    required this.desc,
    required this.context,
    required this.type,
  });
}
