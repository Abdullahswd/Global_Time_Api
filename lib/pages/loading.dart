import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../getAllCountry.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitSpinningLines(
              color: Colors.blue,
              size: 100.0,
            )
          ],
        ),
      ),
    );
  }

  getData() async {
    GatAllCountry allCountry =
    GatAllCountry(link: 'Asia/Aden',name: "Yemen", flag: 'images/yemen.png');
    await allCountry.getData();

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "time": allCountry.timeNow,
      "zone": allCountry.name,
      "isDayTime": allCountry.isDayTime,
    });
  }
}
