import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/reel_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';

import '../common_widget/common_text.dart';

class ProfileScrren extends StatelessWidget {
  List<String> posts = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image5.jpg',
    'assets/images/image6.jpg',
    'assets/images/image7.jpg',
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image5.jpg',
    'assets/images/image6.jpg',
    'assets/images/image7.jpg',
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image5.jpg',
    'assets/images/image6.jpg',
    'assets/images/image7.jpg',
  ];
  List<String> imageList = [
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
  ];
  final List<String> video = [
    'assets/images/video.mp4',
    'assets/images/bday.mp4',
    'assets/images/temple.mp4',
    'assets/images/pp.mp4',
    'assets/images/mo.mp4',
    'assets/images/ko.mp4',
    'assets/images/fo.mp4',
    'assets/images/temple.mp4',
    'assets/images/pp.mp4',
    'assets/images/mo.mp4',
    'assets/images/video.mp4',
    'assets/images/bday.mp4',
    'assets/images/temple.mp4',
  ];
  late VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, isScolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                collapsedHeight: 250,
                expandedHeight: 250,
                flexibleSpace: TopView(),
              ),
              SliverPersistentHeader(
                delegate: MyDelegate(TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.grid_on)),
                    Tab(icon: Icon(Icons.favorite_border_outlined)),
                    Tab(icon: Icon(Icons.bookmark_border)),
                  ],
                  indicatorColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                )),
                floating: true,
                pinned: true,
              )
            ];
          },
          body: TabBarView(
            children: [
              GridView.count(
                physics: BouncingScrollPhysics(),
                crossAxisCount: 3,
                shrinkWrap: true,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
                children: posts
                    .map((e) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(e), fit: BoxFit.fill)),
                        ))
                    .toList(),
              ),

              StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          itemCount: video.length,
          itemBuilder: (context, index) {

            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ReelView(
                src: video[index],

              ),
            );

          },
          staggeredTileBuilder: (index) {
            return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
          }),

              Center(child: Text("No Saved Post"))
            ],
          ),
        ),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class TopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "John Herry",
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/profile_user.jpg')),
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                    alignment: Alignment.bottomRight,
                  ),
                  Column(
                    children: [
                      Text(
                        '10',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text('Posts')
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '80k',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text('Followers')
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '30k',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text('Following')
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomText(
              title: 'John Herry',
              color: Colors.black,
              fontSize: 15,
            ),
            CustomText(
              title:
                  "💓Happy Soul 👻 😱Unique Personality 💯Fashion Model📸 💕Cheers Life ✌😘Single"
                  " Raho Men🚶🏙️From (name) 🏖🎊Wish me 🎂18 March 🎂",
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ],
        ),
      ),
    );
  }
}
