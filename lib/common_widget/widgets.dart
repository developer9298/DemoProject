import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget commonText(title){
  return Text(title,style: TextStyle( color: Colors.black,fontWeight: FontWeight.normal,fontSize: 16.0),);

}
Widget cardText(title){
  return Text(title,style: TextStyle( color: Colors.black,fontWeight: FontWeight.normal,fontSize: 14.0),);

}
Widget cardSubtitleText(title){
  return Text(title,style: TextStyle( color: Colors.orange.shade700,fontWeight: FontWeight.normal,fontSize: 12.0),);

}
Container circleImage(String networkImage, double size) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: const Color(0xff7c94b6),
      image: DecorationImage(
        image: NetworkImage(networkImage),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      gradient: LinearGradient(colors: [
        Colors.red,
        Colors.pink,
      ]),
      border: Border.all(
        color: Colors.red,
        width: 2.0,
      ),
    ),
  );
}

Container rectImage(String networkImage, double size) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: const Color(0xff7c94b6),
      image: DecorationImage(
        image: NetworkImage(networkImage),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      gradient: LinearGradient(colors: [
        Colors.red,
        Colors.pink,
      ]),
      border: Border.all(
        color: Colors.red,
        width: 2.0,
      ),
    ),
  );
}


class CommentWithPublisher extends StatefulWidget {
  @override
  _CommentWithPublisherState createState() => _CommentWithPublisherState();
}

class _CommentWithPublisherState extends State<CommentWithPublisher> {
  @override
  Widget build(BuildContext context) => Column(
    children: [
      SizedBox(height: 50),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Icon(CupertinoIcons.arrow_left,color: Colors.white),
            SizedBox(width: 20),
            Text(
              'Reels',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Icon(CupertinoIcons.camera, color: Colors.white),
          ],
        ),
      ),
      Spacer(),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                circleImage(
                    'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                    30),
                SizedBox(width: 8.0),
                Text('indian music talent', style: TextStyle(color: Colors.white)),
                SizedBox(width: 8.0),
                Text(
                  'Follow',
                  style: textStyle,
                )
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Text(
                  'Tag someone special 😍 🔥 💡... ',
                  style: textStyle,
                ),
                Text(
                  'more',
                  style: greyText,
                )
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  'Anoop Shankar Tu Mile Dil Khile ',
                  style: textStyle,
                ),
                Spacer(),
                rectImage(
                    'https://images.pexels.com/photos/906052/pexels-photo-906052.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
                    35)
              ],
            ),
          ],
        ),
      )
    ],
  );

  TextStyle greyText = TextStyle(
    color: Colors.white,
  );

  TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
  );
}