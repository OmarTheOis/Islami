import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/Screens/hadith/hadith_page.dart';
import 'package:islami/Screens/quran/quran_page.dart';
import 'package:islami/Screens/radio.dart';
import 'package:islami/Screens/sebha_page.dart';
import 'package:islami/Screens/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> view = [
     QuranPage(),
     HadithPage(),
    const SebhaPage(),
    const RadioPage(),
     const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
   var vm = Provider.of<SettingsProvider>(context);
    var lang =AppLocalizations.of(context)!;
    return Container(
      decoration:  BoxDecoration(
          image: vm.isDark()? DecorationImage(
              image: AssetImage("assets/image/MainBg DM.png"), fit: BoxFit.fill): DecorationImage(
              image: AssetImage("assets/image/MainBg.png"), fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title:  Text(
            lang.islami,
          ),
        ),
        body: view[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items:  [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/moshaf.png"),
                ),
                label: lang.quran),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/hadith.png")),
                label: lang.hadith),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/sebha.png")),
                label: lang.sebha),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/radio.png")),
                label: lang.radio),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings,size: 35,),
                label: lang.settings),
          ],
        ),
      ),
    );
  }
}
