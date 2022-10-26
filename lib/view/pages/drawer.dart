import 'package:flutter/material.dart';
import 'package:odc_interview/view/components/core/components.dart';
import 'package:odc_interview/view/pages/home/nav_bottom_bar.dart';

import '../components/core/style.dart';
import 'home/search.dart';

Widget drawer(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*.6,
      child: Drawer(
        backgroundColor: secondary,
        child: ListView(
          // Remove padding
          padding: const EdgeInsets.only(top: 20, left: 8),
          children: [
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(padding: const EdgeInsets.all(8),
                  child: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                ),
                const SizedBox(width: 20,),
                const Text('name', style: TextStyle(color: Colors.white),),
              ],
            ),
            GestureDetector(
              onTap: (){
                //navigateTo(context, NavBottomBar());
              },
              child: const ListTile(
                leading: Icon(Icons.person, color: primary,),
                title: Text('Account', style: TextStyle(color: Colors.white)),
              ),
            ),
            GestureDetector(
              onTap: (){

              },
              child: const ListTile(
                leading: Icon(Icons.settings, color: primary,),
                title: Text('Setting', style: TextStyle(color: Colors.white)),
              ),
            ),
            GestureDetector(
              onTap: (){

              },
              child: ListTile(
                leading: Image.asset('assets/img/about.png', width: 20, height: 20,),
                title: const Text('About', style: TextStyle(color: Colors.white)),
              ),
            ),
            GestureDetector(
              onTap: (){

              },
              child: ListTile(
                leading: Image.asset('assets/img/logout.png', width: 20, height: 20),
                title: const Text('Logout', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
