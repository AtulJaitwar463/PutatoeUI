import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:putatoe_ui/home_controller.dart';
import 'package:putatoe_ui/home_page.dart';
import 'package:putatoe_ui/string.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    var controller=Get.put(HomeController());
    var navbarItem =[
      BottomNavigationBarItem(icon: Image.asset("assets/home.png",width: 26,),label: home),
      BottomNavigationBarItem(icon: Image.asset("assets/users.png",width: 26,),label: profile),
      BottomNavigationBarItem(icon: Image.asset("assets/putatoe.png",width: 26,),label: ''),
      BottomNavigationBarItem(icon: Image.asset("assets/clipboard.png",width: 26,),label: followlist),
      BottomNavigationBarItem(icon: Image.asset("assets/bubble-chat.png",width: 26,),label: chat),
    ];
    
    var navBody=[
      const HomePage(),
      //const HomeController(),
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(child: navBody.elementAt(controller.currentNavIndex.value)))
        ],
      ),
      bottomNavigationBar:Obx(()=>BottomNavigationBar(
        selectedItemColor: Colors.cyan,
        currentIndex: controller.currentNavIndex.value,
        selectedLabelStyle: TextStyle(fontFamily: 'bold'),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: navbarItem,
        onTap:(value){
          controller.currentNavIndex.value=value;
        },
      ) ,
      ),
    );
  }
}
