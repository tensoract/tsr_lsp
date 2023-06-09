import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tsr_lsp/style.dart';
import 'package:tsr_lsp/splash_screen.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  items = [];
                  datas = [];
                });
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SplashScreen()),
                    (Route<dynamic> route) => false);
              },
              child: SvgPicture.asset(
                LogoTSR_notext,
                width: MediaQuery.of(context).size.width * 10 / 100,
                height: MediaQuery.of(context).size.height * 10 / 100,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              child: AutoSizeText(
                "TENSORACT",
                style: boldPCTextStyle,
                minFontSize: 10,
                maxLines: 1,
              ),
              onTap: () => {
                setState(() {
                  items = [];
                  datas = [];
                }),
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SplashScreen()),
                    (Route<dynamic> route) => false),
              },
            )
          ],
        ),
        elevation: 1.0,
        backgroundColor: Colors.black,
      ),
      body: const BodyScreen(),
    );
  }
}

class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 5 / 100,
          left: MediaQuery.of(context).size.width * 5 / 100,
          right: MediaQuery.of(context).size.width * 5 / 100),
      width: double.maxFinite,
      height: double.maxFinite,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "Port In-used List: ",
              style: mediumPCTextStylebl,
              maxLines: 1,
              minFontSize: 7,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: DataTable2(
                    sortAscending: true,
                    border: TableBorder.all(color: Colors.black, width: 1.0),
                    minWidth: 800,
                    columns: [
                      DataColumn2(
                          label: Center(
                              child: AutoSizeText(
                        "Local Port",
                        style: mediumPCTextStylebl,
                        minFontSize: 7,
                        maxLines: 1,
                      ))),
                      DataColumn2(
                          label: Center(
                              child: AutoSizeText(
                        "Foreign Port",
                        style: mediumPCTextStylebl,
                        minFontSize: 7,
                        maxLines: 1,
                      ))),
                      DataColumn2(
                          label: Center(
                              child: AutoSizeText(
                        "Service",
                        style: mediumPCTextStylebl,
                        maxLines: 1,
                        minFontSize: 7,
                      ))),
                      DataColumn2(
                          label: Center(
                              child: AutoSizeText(
                        "Protocol",
                        style: mediumPCTextStylebl,
                        maxLines: 1,
                        minFontSize: 7,
                      ))),
                      DataColumn2(
                          label: Center(
                              child: AutoSizeText(
                        "Status",
                        style: mediumPCTextStylebl,
                        minFontSize: 7,
                        maxLines: 1,
                      ))),
                    ],
                    rows: List<DataRow>.generate(
                        datas.length,
                        (index) => DataRow(
                              cells: [
                                DataCell(AutoSizeText(
                                  datas[index].local_port,
                                  style: lightPCTextStylebl,
                                  minFontSize: 7,
                                  maxLines: 1,
                                )),
                                DataCell(AutoSizeText(
                                  datas[index].foreign_port,
                                  style: lightPCTextStylebl,
                                  minFontSize: 7,
                                  maxLines: 1,
                                )),
                                DataCell(AutoSizeText(
                                  datas[index].program_name,
                                  style: lightPCTextStylebl,
                                  minFontSize: 7,
                                  maxLines: 1,
                                )),
                                DataCell(AutoSizeText(
                                  datas[index].proto,
                                  style: lightPCTextStylebl,
                                  minFontSize: 7,
                                  maxLines: 1,
                                )),
                                DataCell(AutoSizeText(
                                  datas[index].state,
                                  style: lightPCTextStylebl,
                                  minFontSize: 7,
                                  maxLines: 1,
                                ))
                              ],
                            )))),
          ],
        ),
      ),
    );
  }
}
