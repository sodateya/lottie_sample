import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_lottie/border_widget.dart';
import 'package:test_lottie/constantly_moving_lottie.dart';
import 'package:test_lottie/reset_lottie.dart';
import 'package:test_lottie/slide_show_lottie.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text('一回だけ再生されてとまる'),
                    SingleShotLottie(asset: 'assets/mail.json'), //一回だけ再生されてとまる,
                    const BorderWidjet(),
                    const Text('ずっと動き続ける'),
                    const ConstantlyMoving(
                        asset: 'assets/mail.json'), //ずっと動き続ける,
                    const BorderWidjet(),
                    const Text('スライドショー(横スライドしてください)'),
                    SlideShowlottie(
                        assetsList: list, isBorder: true) //スライドショー(横スライド可能)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final list = [
  'assets/mail.json',
  'assets/1.json',
  'assets/2.json',
  'assets/3.json',
  'assets/4.json',
  'assets/5.json',
  'assets/6.json',
];
