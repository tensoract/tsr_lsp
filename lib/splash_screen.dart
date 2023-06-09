import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tsr_lsp/style.dart';
import 'package:tsr_lsp/home_screen.dart';
import 'package:tsr_lsp/port_model.dart';
import 'dart:convert';
import 'package:tsr_lsp/dio_get.dart';
import 'package:tsr_lsp/error_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

List items = [];
List<UsagedPort> datas = [];

class SplashScreenState extends State<SplashScreen> {
// Fetch content from the json file
  Future<void> readJson() async {
    /* final String response =
        await rootBundle.loadString('assets/mock_port_data.json');*/
    final data = await json.decode(response.data);
    setState(() {
      items = data;
    });
    items.forEach((element) {
      datas.add(UsagedPort.fromJson(element));
    });

    datas.sort((a, b) => a.local_port.compareTo(b.local_port));
  }

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (response.statusCode == 200) {
        readJson();
        // set your desired delay time here
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ErrorScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 20 / 100,
            left: MediaQuery.of(context).size.width * 10 / 100,
            right: MediaQuery.of(context).size.width * 10 / 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                LogoTSR_notext,
                color: Colors.black,
                height: MediaQuery.of(context).size.height * 50 / 100,
                width: MediaQuery.of(context).size.width * 60 / 100,
              ),
            ),
            Center(
                child: AutoSizeText(
              "TENSORACT",
              style: boldPCTextStylebl,
              minFontSize: 12,
              maxLines: 1,
            )),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 10 / 100),
            ),
            const Center(
              child: SpinKitWave(
                type: SpinKitWaveType.start,
                itemCount: 5,
                color: Colors.black,
                size: 60,
                duration: Duration(milliseconds: 3000),
              ),
            )
          ],
        ),
      ),
    );
  }
}
