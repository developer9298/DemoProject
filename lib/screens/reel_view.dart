import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/common_widget/common_text.dart';
import 'package:video_player/video_player.dart';
import 'like_icon.dart';

class ReelView extends StatefulWidget {
  final String? src;

  const ReelView({Key? key, this.src, })
      : super(key: key);
  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ReelView> {
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
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Chewie(
              controller: _chewieController!,

            ),
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



      ],
    );
  }
}
