import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });
  // answerText butonun gösterilecek cevabı içerir.
  final String answerText;

  //onTap, butona basıldığında çağrılacak fonksiyonu içerir.
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //butona tıklandığında onTap fonk. çağrılır.
      onPressed: onTap,

      //buton stili için ElevatedButton kullandık.
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 90, 13, 64),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),

      // butonun metnini göstermek için Text widgeti kullandık.
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ), //soruların cevaplarını gösterir.
    );
  }
}
