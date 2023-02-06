import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void sweatAlert(BuildContext context) {
  Alert(
    style: alertStyle,
    context: context,
    type: AlertType.success,
    title: "Berhasil",
    desc: "Anda berhasil menambahkan data",
    buttons: [
      DialogButton(
        radius: BorderRadius.circular(15),
        color: const Color(0xFFF1C950),
        child: Text(
          "Selanjutnya",
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700),
        ),
        onPressed: () {
          var count = 0;
          Navigator.popUntil(context, (route) {
            return count++ == 2;
          });
        },
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 174, 0, 255),
          Color(0xFFE94057),
          Color.fromARGB(255, 242, 151, 33),
        ]),
      )
    ],
  ).show();
  return;
}

void invoiceAlert(BuildContext context) {
  Alert(
    style: alertStyle,
    context: context,
    type: AlertType.success,
    title: "Berhasil",
    desc: "Anda berhasil menambahkan data",
    buttons: [
      DialogButton(
        radius: BorderRadius.circular(15),
        color: const Color(0xFFF1C950),
        child: Text(
          "Selanjutnya",
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700),
        ),
        onPressed: () {
          // context.goNamed('invoice');
          var count = 0;
          Navigator.popUntil(context, (route) {
            return count++ == 1;
          });
        },
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 174, 0, 255),
          Color(0xFFE94057),
          Color.fromARGB(255, 242, 151, 33),
        ]),
      )
    ],
  ).show();
  return;
}

void updateAlert(BuildContext context) {
  Alert(
    style: alertStyle,
    context: context,
    type: AlertType.success,
    title: "Berhasil",
    desc: "Anda berhasil mengupdate data",
    buttons: [
      DialogButton(
        radius: BorderRadius.circular(15),
        color: const Color(0xFFF1C950),
        child: Text(
          "Selanjutnya",
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700),
        ),
        onPressed: () {
          var count = 0;
          Navigator.popUntil(context, (route) {
            return count++ == 3;
          });
        },
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 174, 0, 255),
          Color(0xFFE94057),
          Color.fromARGB(255, 242, 151, 33),
        ]),
      )
    ],
  ).show();
  return;
}

void deleteAlert(BuildContext context) {
  Alert(
    context: context,
    type: AlertType.warning,
    title: "Berhasil",
    desc: "Selamat anda berhasil menambah data",
    buttons: [
      DialogButton(
          child: const Text(
            "Selanjutnya",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {
            var count = 0;
            Navigator.popUntil(context, (route) {
              return count++ == 2;
            });
          })
    ],
  ).show();
  return;
}

final alertStyle = AlertStyle(
  animationType: AnimationType.grow,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  animationDuration: const Duration(milliseconds: 600),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),
    side: const BorderSide(
      color: Colors.black,
    ),
  ),
  titleStyle: const TextStyle(
    color: Colors.black,
  ),
  alertAlignment: Alignment.center,
);
