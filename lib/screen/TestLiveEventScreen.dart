import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:demo_video/screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:demo_video/Constant/AppConstants.dart';
import 'package:demo_video/Widget/CustomAppbar.dart';
import 'package:demo_video/Widget/questionBox.dart';
import 'package:demo_video/screen/Leaderboard.dart';
import 'package:demo_video/screen/reward.dart';
import 'package:demo_video/screen/select_language.dart';
import 'package:video_player/video_player.dart';

import '../Constant/app_colors.dart';
import '../Widget/QuestionList.dart';
import '../Widget/customFooter.dart';
import 'package:flutter_meedu/meedu.dart';
import '../utility/constant.dart';

class TestLiveEventScreen extends StatefulWidget {
  const TestLiveEventScreen({Key? key}) : super(key: key);

  @override
  State<TestLiveEventScreen> createState() => _TestLiveEventScreenState();
}

class _TestLiveEventScreenState extends State<TestLiveEventScreen>
    with SingleTickerProviderStateMixin {

  List<int> currentIndex = [0, 0, 0, 0];
  List<String> givenAnswerIndexs = [];

  var color = Color(0xffE9E9E9);
  var icon;
  Timer? _timer;
  int _start = 10;
  int flag = 0;
  int score = 0;
  PageController controller = PageController();
  bool isQuestionsVisible = false;
  late TabController _tabController;

  final _meeduPlayerController = MeeduPlayerController(
    controlsStyle: ControlsStyle.primary,
    enabledButtons: const EnabledButtons(pip: false),
    // enabledControls: const EnabledControls(doubleTapToSeek: false),
    pipEnabled: true,
    manageBrightness: false,
    excludeFocus: false,
    manageWakeLock: false,
    controlsEnabled: false,
  );

  StreamSubscription? _playerEventSubs;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        // print(timer.tick);
        // print( "${currentIndex.length}length of current index" );
        if (_start == 0) {
          setState(() {
            flag = 0;
            for (int i = 0; i < currentIndex.length; i++) {
              currentIndex[i] = 0;
            }
            _timer?.cancel();
            _start = 10;
            questionCount++;
            isQuestionsVisible = false;
            _meeduPlayerController.play();
            currentQuestionIndex++;
            runFunctionAfterTenSeconds();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void resetTimer() {
    _timer?.cancel();
    _start = 10;
  }

  List<Tab> CustomMenuTabs() {
    return [
      const Tab(
        icon: ImageIcon(
          AssetImage("assets/images/note.png"),
        ),
      ),
      const Tab(
        icon: ImageIcon(
          AssetImage("assets/images/chat.png"),
        ),
      ),
      const Tab(
        icon: ImageIcon(
          AssetImage("assets/images/Frame.png"),
          color: Color(0xffDC1C29),
        ),
      ),
      Tab(
        icon: InkWell(
          onTap: () {
            _timer?.cancel();
            _meeduPlayerController.dispose();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Leaderboard()));
          },
          child: ImageIcon(
            AssetImage("assets/images/leaderboard.png"),
            // size: 60.h,
            color: Color(0xffDC1C29),
          ),
        ),
      ),
      const Tab(
        icon: ImageIcon (
          AssetImage("assets/images/calender.png"),
        ),
      ),
    ];
  }


  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: CustomMenuTabs().length, initialIndex: 1, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
    runFunctionAfterTenSeconds();
  }
  @override
  void dispose() {
    _playerEventSubs?.cancel();
    _meeduPlayerController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(
  //       length: CustomMenuTabs().length, initialIndex: 1, vsync: this);
  //
  //   // _chewieController = ChewieController(
  //   //     videoPlayerController: videoController,
  //   //     autoPlay: true,
  //   //     autoInitialize: true,
  //   //     showOptions: false,
  //   //     showControls: false,
  //   //     looping: true,
  //   //     aspectRatio: 16 / 9,
  //   //     cupertinoProgressColors: ChewieProgressColors(
  //   //         backgroundColor: Color(0xff5B5B5B), playedColor: Color(0xffDC1C29))
  //   //   // Add other options here as needed
  //   // );
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _init();
  //     setState(() {});
  //   });
  //   runFunctionAfterTenSeconds();
  // }

  Future<void> initMeeduPlayer(
      {bool iosUseMediaKit = false, bool androidUseMediaKit = false}) async {
    WidgetsFlutterBinding.ensureInitialized();
    initVideoPlayerMediaKitIfNeeded(
        iosUseMediaKit: iosUseMediaKit, androidUseMediaKit: androidUseMediaKit);
  }

  _init() async {
    await _meeduPlayerController.setDataSource(
        DataSource(
          type: DataSourceType.network,
          source:
          "https://atechnosmedia.com/vingage_demo/assets/assets/videos/electro2.mp4",
        ),
        autoplay: true,
        looping: false);
  }

  Future<void> runFunctionAfterTenSeconds() async {
    await Future.delayed(
      Duration(seconds: 10),
      () {
        if (questionCount < 4) {
          _meeduPlayerController.pause();
          isQuestionsVisible = true;
          setState(() {});
          startTimer();
        }
      },
    );
  }


  int currentQuestionIndex = 0;
  Map<int, String> answers = {};
  int questionCount = 0;

  void selectOption(String option) {
    setState(() {
      answers[questions[currentQuestionIndex].id] = option;
    });
  }

  List<Question> questions = [
    Question(
      id: 1,
      text: "Is SIP available for all types of mutual funds?",
      options: [
        "Open-Ended Mutual Fund",
        "Money Market Funds",
        "Bond Funds",
        "Target Date Funds"
      ],
    ),
    Question(
      id: 2,
      text: "Does SIP offer the options of Growth and Dividend?",
      options: ["Yes", "No"],
    ),
    Question(
      id: 3,
      text: "What is the minimum amount to start the SIP?",
      options: ["500", "1000", "2000", "<5000"],
    ),
    Question(
      id: 4,
      text: "Can we start the SIP through Kotak App?",
      options: ["Yes", "No"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                    padding: EdgeInsets.only(bottom: 15.h, top: 10.h),
                    height: 60.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             SelectLanguage()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Image(
                                  image:
                                      AssetImage("assets/images/hamburger.png"),
                                  fit: BoxFit.fitWidth,
                                  height: 30.h,
                                  width: 24.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              "Bite Size Engagements",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 18.0.w),
                          child: Image(
                            image: AssetImage("assets/images/KotakLogo.png"),
                            fit: BoxFit.fill,
                            height: 26.21.h,
                            // width: 150.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SizedBox(
                    height: 310.h,
                    width: double.infinity,
                    child: MeeduVideoPlayer(
                      bottomRight: (context, controller, responsive) {
                        return SizedBox();
                      },
                      customIcons: (responsive) {
                        return CustomIcons();
                      },
                      customControls: (context, controller, responsive) {
                        return SizedBox();
                      },
                      controller: _meeduPlayerController,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 3.h,
                    ),
                    child: TabBar(
                      tabs: CustomMenuTabs(),
                      controller: _tabController,
                    ),
                  ),
                  Divider(
                    color: Color(0xff5B5B5B).withOpacity(0.5),
                    thickness: 2,
                  ),
                  isQuestionsVisible && questionCount < 4
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 19.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                  height: 300.h,
                                  width: 350.w,
                                  padding: EdgeInsets.all(15.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      color: Color(0xffFFFFFF)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${questions[currentQuestionIndex].id}. ${questions[currentQuestionIndex].text}",
                                        textAlign: TextAlign.left,
                                        style: SET_FONT_STYLE(14.sp,
                                            FontWeight.w600, Color(0xff1E1E1E)),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      SizedBox(
                                        height: 200.h,
                                        child: ListView.builder(
                                          itemCount:
                                              questions[currentQuestionIndex]
                                                  .options
                                                  .length,
                                          itemBuilder: (context, index) {
                                            // print("$index" + "lenght of list");
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    color =
                                                        AppColors.primaryColor;
                                                    icon = Icons.check_box;
                                                    // print("${questionCount}questionCount");
                                                    // print("${flag}flag1");
                                                    if (questionCount <= 4) {
                                                      if (flag == 0) {
                                                        flag = 1;
                                                        currentIndex[index] = 1;
                                                        print("${flag}flag2");
                                                        score++;
                                                        selectOption(questions[
                                                                currentQuestionIndex]
                                                            .options[index]);
                                                      } else {}
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                    height: 38.h,
                                                    decoration: BoxDecoration(
                                                      color: currentIndex[
                                                                  index] ==
                                                              1
                                                          ? AppColors
                                                              .primaryColor
                                                          : Color(0xffE9E9E9),
                                                      // color: Color(0xffE9E9E9),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.r),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 4.w),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: 20.w,
                                                          ),
                                                          Text(
                                                              "${questions[currentQuestionIndex].options[index]}",
                                                              style: SET_FONT_STYLE(
                                                                  14.sp,
                                                                  FontWeight
                                                                      .w400,
                                                                  currentIndex[
                                                                              index] ==
                                                                          1
                                                                      ? AppColors
                                                                          .whiteColor
                                                                      : AppColors
                                                                          .blackColor)),
                                                          Icon(
                                                            currentIndex[
                                                                        index] ==
                                                                    1
                                                                ? Icons
                                                                    .check_box
                                                                : null,
                                                            color: Colors.white,
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  )),

                              // Row(
                              //   children: [
                              //     Expanded(
                              //       child: Container(
                              //         height: 52.h,
                              //         decoration: BoxDecoration(
                              //           // color: (selectedBoxIndexs.contains(personality[index],))
                              //           borderRadius: BorderRadius.circular(12),
                              //             border: Border.all(
                              //               color: Colors.black,
                              //               width: 1,
                              //             )),
                              //         child: Center(child: Text("3 / 5"))
                              //       ),
                              //     ),
                              //     SizedBox(width: 50.w,),
                              //     Expanded(
                              //       child: Container(
                              //         height: 52.h,
                              //         decoration: BoxDecoration(
                              //           // color: (selectedBoxIndexs.contains(personality[index],))
                              //           borderRadius: BorderRadius.circular(12),
                              //             border: Border.all(
                              //               color: Colors.black,
                              //               width: 1,
                              //             )),
                              //         child: Center(child: Text("3 / 5"))
                              //       ),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 19.0.w),
                          child: SizedBox(
                            height: 252.h,
                            width: 346.w,
                            child: Image(
                              image: AssetImage("assets/images/rewards.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            height: 42.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                )),
                            child: Center(
                              child: Text(
                                "Score: $score/4",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Container(
                            height: 42.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                )),
                            child: Center(
                              child: Text(
                                "Time: ${_start} Sec",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  questionCount >= 4
                      ? InkWell(
                          onTap: () {
                            _meeduPlayerController.dispose();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RewardScreen()));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 19.w, vertical: 10.h),
                            height: 42.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xffDC1C29)),
                            child: Center(
                              child: Text(
                                "Get Your Rewards",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
          CustomFooter(),
        ],
      ),
    );
  }
}
