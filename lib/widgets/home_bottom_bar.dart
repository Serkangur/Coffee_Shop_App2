import 'package:coffe_maker/widgets/home_bottom_bar2.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: Color(0xffe57534).withOpacity(0.6),
              width: 0.5,
              style: BorderStyle.solid),
          color: Color(0xfff3c2aa),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 10),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.home,
              color: Color(0xffe57534),
              size: 35,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: Icon(
                Icons.favorite_outline,
                color: Color(0xffe57534),
                size: 35,
              ),
            ),
            Icon(
              Icons.notifications,
              color: Color(0xffe57534),
              size: 35,
            ),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.person,
                color: Color(0xffe57534),
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
