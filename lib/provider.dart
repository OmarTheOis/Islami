import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
 ThemeMode themeMode = ThemeMode.dark;
 String lang ="ar";

 changeLang(String x){
   if(x == lang) return;
   lang = x;
   notifyListeners();
 }
 changeTheme(ThemeMode x){
   if(x == themeMode) return;
   themeMode = x;
   notifyListeners();
 }
 isDark(){
   return themeMode==ThemeMode.dark;
 }
}