import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:demo_video/utility/constant.dart';

class EngagementScreen extends StatefulWidget {

  @override
  State<EngagementScreen> createState() => _EngagementScreenState();
}

class _EngagementScreenState extends State<EngagementScreen> {
  VideoPlayerController _controller =
      VideoPlayerController.asset("assets/videos/electro2.mp4");

  @override
  void initState() {
    super.initState();
    _controller.initialize().then((_) {
      //   _controller?.setLooping(true);
      // _controller?.setVolume(1.0);
      _controller.pause();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller != null
          ? SafeArea(
              child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: gradiantBlue,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                  ),
                  height: 67.h,
                  width: 395.w,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.keyboard_arrow_left_sharp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Bite Size Engagements",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Image(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.fill,
                        height: 28.h,
                        width: 100.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 236.h,
                  width: 395.w,
                  child: Stack(children: [
                    VideoPlayer(_controller),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                        child: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 50.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ]),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                  image: AssetImage("assets/images/note.png"),
                  fit: BoxFit.fill,
                  height: 20.41.h,
                  width: 14.74.w,
                ),
                Image(
                  image: AssetImage("assets/images/chat.png"),
                  fit: BoxFit.fill,
                  height: 20.1.h,
                  width: 25.65.w,
                ),
                  
                  Image(
                  image: AssetImage("assets/images/frame.png"),
                  fit: BoxFit.fill,
                  height: 21.h,
                  width: 23.w,
                ),
                  
                  Image(
                  image: AssetImage("assets/images/eye.png"),
                  fit: BoxFit.fill,
                  height: 20.1.h,
                  width: 33.5.w,
                ),
                  
                  Image(
                  image: AssetImage("assets/images/calender.png"),
                  fit: BoxFit.fill,
                  height: 19.74.h,
                  width: 19.43.w,
                ),
                  
                    
                  ],)
                )
              ],
            ))
          : Text("Video Not Available"),
    );
  }
}
