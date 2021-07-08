
import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
 /// const ElevatedButton({ Key? key }) : super(key: key);
 ElevatedBtn({this.onPressed , this.text});
 final GestureTapCallback onPressed;
 String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SizedBox(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    
                    onPressed: onPressed,
                    child: Text(
                      text,
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                  ),
                ),
              ),
            );
  }
}