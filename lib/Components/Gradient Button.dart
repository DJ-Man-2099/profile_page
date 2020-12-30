import "package:flutter/material.dart";

class GradientButton extends StatelessWidget {
  final onPressed, text, width;
  const GradientButton({Key key, this.onPressed, this.text, this.width = 300.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [Colors.red, Colors.blue])),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        elevation: 10,
        child: InkWell(
            onTap: this.onPressed,
            splashColor: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(50),
            child: Ink(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                    child: Text(
                  this.text,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )))),
      ),
      alignment: Alignment.center,
    );
  }
}
