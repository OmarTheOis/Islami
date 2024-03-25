import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/provider.dart';
import 'package:islami/theme_controll.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SebhaPage extends StatefulWidget {

  const SebhaPage({super.key});

  @override
  State<SebhaPage> createState() => _SebhaPageState();
}

class _SebhaPageState extends State<SebhaPage> {
  double degree = 0;
  int tasbehNumber = 0;
  int index = 0;
  List <String> tasbeh = ["سبحان الله", "الحمدلله", "الله أكبر"];

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);
    var lang = AppLocalizations.of(context)!;
    var size = MediaQuery
        .of(context)
        .size;
    return Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(top: 15),
        alignment: Alignment.center,
        child: Column(
          children: [

            Container(
              width: 250,
              height: 320,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 105,
                    bottom: 220,
                    child: vm.isDark()?Image.asset(
                      "assets/image/head of seb7a DM.png",
                    ):Image.asset(
                      "assets/image/head of seb7a.png",
                    ),
                  ),
                  Positioned(
                    top: 75,
                    child: Transform.rotate(
                      angle: degree * pi / 180,
                      child: InkWell(
                        overlayColor: MaterialStateProperty.all(
                            Colors.transparent),
                        onTap: () {
                          sebhaOnTap();
                        },
                        child: vm.isDark()? Image.asset(
                          "assets/image/body of seb7a DM.png",

                        ) :Image.asset(
                          "assets/image/body of seb7a.png",

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Text(
              lang.tasbehNumber,
              style: TextStyle(

                fontFamily: "ELMessiri",
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: vm.isDark() ? Colors.white :Colors.black,

              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 69,
              height: 81,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: vm.isDark()? ThemeControl.primarydarkColor : ThemeControl.primarylightColor,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Text(
                tasbehNumber.toString(),
                style: TextStyle(
                    color: vm.isDark() ? Colors.white :Colors.black,
                    fontFamily: "Inter",
                    fontSize: 25,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 137,
              height: 51,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: vm.isDark()? ThemeControl.primarydarkColor : ThemeControl.primarylightColor,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Text(
                tasbeh[index],
                style: TextStyle(
                    color: vm.isDark() ? Colors.white :Colors.black,
                    fontFamily: "ELMessiri",
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),


          ],
        )
    );
  }

  sebhaOnTap() {
    degree += 90;
    tasbehNumber++;
    setState(() {});
    if (tasbehNumber == 34) {
      tasbehNumber = 0;
      index++;
      setState(() {});
      if (index == 3) {
        index = 0;
      }
    }
  }
}
