import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/common_widget/common_text.dart';
import 'package:video_player/video_player.dart';
import 'like_icon.dart';

class ContentScreen extends StatefulWidget {
  final String? src;
  final user;
  final images;
  final quotes;
  const ContentScreen({Key? key, this.src, this.user, this.quotes, this.images})
      : super(key: key);
  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _liked = false;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.asset(widget.src!);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
       aspectRatio: 25.0 / 25.0,
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {

    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    _liked = !_liked;
                  });
                },
                child: Chewie(
                  controller: _chewieController!,

                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  CustomText(
                    title: 'Loading...',
                    color: Colors.white,
                    fontSize: 15,
                  )
                ],
              ),

        InkWell(
          onTap: (){
            setState(() {
              if (_videoPlayerController.value.isPlaying) {
                _videoPlayerController.pause();
              } else {
                _videoPlayerController.play();
              }
            });
          },
          child: Icon(
            _videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,color: Colors.white,
           ),
        ),

        if (_liked)
          Center(
            child: LikeIcon(),
          ),
        SizedBox(),

        Align(
          alignment: Alignment.bottomCenter,
          child: Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.8, 0.2, 0.5, 1],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                _liked = !_liked;                              });
                            },
                            child:


                            _liked?Icon(
                              Icons.favorite,
                              size: 25,
                              color: Colors.red,
                            ):Icon(
                              Icons.favorite_border,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: (){

                            },
                            child: CustomText(
                              title: '601k',
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: 5),

                          Image.asset(
                            "assets/images/bubble-chat.png",
                            color: Colors.white,
                            height: 25,
                          ),
                          // Icon(
                          //   Icons.comment,
                          //   size: 25,
                          //   color: Colors.white,
                          // ),
                          SizedBox(height: 5),
                          CustomText(
                            title: '124',
                            color: Colors.white,
                            fontSize: 10,
                          ),

                          SizedBox(height: 10),

                          Image.asset(
                            "assets/images/share.png",
                            color: Colors.white,
                            height: 20,
                          ),

                          SizedBox(height: 30),
                          Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(widget.images),
                              radius: 20,
                            ),
                            SizedBox(width: 10),
                            CustomText(
                              title: widget.user,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.verified,
                              size: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 6),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Follow',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: CustomText(
                            title: widget.quotes,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.music_note,
                          size: 15,
                          color: Colors.white,
                        ),
                        CustomText(
                          title: 'Original Audio - some music track--',
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
