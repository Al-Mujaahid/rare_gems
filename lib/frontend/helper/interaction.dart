import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/styles/colors.dart';

class MessageAlert {
  static showAlert(BuildContext context, String message, {Function? onClick}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('$message'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (onClick != null) {
                    onClick();
                  }
                },
                child: Text('Okay'))
          ],
        );
      },
    );
  }

  //MessageAlert.showAlert(context, '');
  static showErrorAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.cancel,
                color: Colors.red,
              ),
              SizedBox(
                width: 5,
              ),
              Text('Error'),
            ],
          ),
          content: Text('$message'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Okay'))
          ],
        );
      },
    );
  }

  static showLoadingAlert(BuildContext context, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              RowSpace(16),
              Expanded(
                  child: Text(
                '$message',
                maxLines: 5,
              )),
            ],
          ),
        );
      },
    );
  }

  static showConfirmAlert(
      BuildContext context, String message, Function onOkay) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              Icon(
                Icons.warning,
                color: warningColor,
              ),
              RowSpace(16),
              Expanded(
                  child: Text(
                '$message',
                maxLines: 5,
              )),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onOkay();
                },
                child: Text("Yes")),
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("No")),
          ],
        );
      },
    );
  }
}
