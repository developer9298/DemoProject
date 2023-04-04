import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/single_story_view.dart';

import 'content_screen.dart';

class HomePage extends StatelessWidget {
  final List<String> videos = [
    'https://vod-progressive.akamaized.net/exp=1680534155~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F1876%2F24%2F609382957%2F2845100859.mp4~hmac=88a3626d89255a8c0e6abf7f49a02473f64b0bc5867ad80de627202c278c3b12/vimeo-prod-skyfire-std-us/01/1876/24/609382957/2845100859.mp4',
    'https://vod-progressive.akamaized.net/exp=1680534234~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F4421%2F14%2F372109448%2F1545849603.mp4~hmac=a03852cb600676f1ae86fa171027621df7a9a35d3ef17a6119b472a19cad430b/vimeo-prod-skyfire-std-us/01/4421/14/372109448/1545849603.mp4',
    'https://vod-progressive.akamaized.net/exp=1680534322~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F3854%2F14%2F369272439%2F1529352990.mp4~hmac=39d0d36ee55fd4ae47b9647266ae19f69e79bb105c28e7ffa6691e63ff37cfa3/vimeo-prod-skyfire-std-us/01/3854/14/369272439/1529352990.mp4',
    'https://vod-progressive.akamaized.net/exp=1680534092~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F2135%2F17%2F435675771%2F1899006721.mp4~hmac=89caff50daadd0e3b4cb20db9f1f9f42082adc17494a2f7670399539253ee0e4/vimeo-prod-skyfire-std-us/01/2135/17/435675771/1899006721.mp4',
    'https://vod-progressive.akamaized.net/exp=1680534039~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F3917%2F15%2F394587229%2F1675534911.mp4~hmac=642dd7ad65938e943127c2de31ebee2f76f75acb086034bfdb11ef62fc7f8e3b/vimeo-prod-skyfire-std-us/01/3917/15/394587229/1675534911.mp4',
    'https://vod-progressive.akamaized.net/exp=1680533996~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F1094%2F16%2F405474058%2F1736142810.mp4~hmac=2cb85ea33c9896313db237c1045107e5010470d0af10ff3618eb74fe27e60a30/vimeo-prod-skyfire-std-us/01/1094/16/405474058/1736142810.mp4',
    'https://vod-progressive.akamaized.net/exp=1680533847~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F1094%2F16%2F405471622%2F1736129269.mp4~hmac=20fc1b77873450e5dc3b1e754a84504ce7d475b656f404fd33c171e4acb9fc52/vimeo-prod-skyfire-std-us/01/1094/16/405471622/1736129269.mp4'
  ];
  final List<String> video = [
    'assets/images/video.mp4',
    'assets/images/bday.mp4',
    'assets/images/temple.mp4',
    'assets/images/pp.mp4',
    'assets/images/mo.mp4',
    'assets/images/ko.mp4',
    'assets/images/fo.mp4',
  ];
  final List<String> user = [
    "John Herry",
    "Herry Roy",
    "Roy Charle",
    "Herry Poster",
    "Charsles Gey",
    "johnsen Hey",
    "Priyn Gey",
  ];
  final List<String> images = [
    "https://images.pexels.com/photos/4963060/pexels-photo-4963060.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/5077393/pexels-photo-5077393.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/3775553/pexels-photo-3775553.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/4963060/pexels-photo-4963060.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/8972801/pexels-photo-8972801.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/6235052/pexels-photo-6235052.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/7603052/pexels-photo-7603052.jpeg?auto=compress&cs=tinysrgb&w=600",
  ];
  final List<String> quotes = [
    "The purpose of our lives is to be happy 😀",
    "Get busy living or get busy dying😀😀",
    "You only live once, but if you do it right, once is enough💁👌🎍😍",
    "Herry PosterIn order to write about life first you must live it💁.",
    "The big lesson in life, baby, is never be scared of anyone or anything🎍😍",
    "Life is not a problem to be solved, but a reality to be experienced👌😍",
    "I like criticism. It makes you strong👌"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("Social Life"),
        actions: [
          Icon(
            Icons.messenger_outline_outlined,
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 5.0,
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  SingleStory()),
                );
              },
              child: Container(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: user == null ? 0 : user!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(images[index])),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2,
                                    color: index == 0
                                        ? Colors.white
                                        : Colors.orangeAccent),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            index == 0
                                ? Text("My Story",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12))
                                : Text(user[index],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ContentScreen(
                    src: video[index],
                    user: user[index],
                    quotes: quotes[index],
                    images: images[index],
                  );
                },
                itemCount: video.length,
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
