import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sayac extends StatefulWidget {
  const Sayac({Key? key}) : super(key: key);

  @override
  State<Sayac> createState() => _SayacState();
}

class _SayacState extends State<Sayac> {
  int _sayac = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: FloatingActionButton(
              onPressed: () => sayaciAzalt(),
              elevation: 2.0,
              mini: true,
              backgroundColor: Colors.white,
              child: Icon(
                CupertinoIcons.minus,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 9),
          Text(
            _sayac.toString(),
            style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 9),
          SizedBox(
            height: 30,
            width: 30,
            child: FloatingActionButton(
              onPressed: () => sayaciArttir(),
              elevation: 2.0,
              mini: true,
              backgroundColor: Colors.white,
              child: Icon(
                CupertinoIcons.plus,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
          /* InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      CupertinoIcons.plus,
                                      size: 18,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),*/
        ],
      ),
    );
  }

  void sayaciArttir() {
    setState(() {
      _sayac++;
    });
  }

  void sayaciAzalt() {
    setState(() {
      _sayac--;
    });
  }
}
