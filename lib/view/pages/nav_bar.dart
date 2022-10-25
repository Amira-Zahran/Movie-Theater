import 'package:flutter/material.dart';

import '../components/core/style.dart';

Widget drawer() {
    return Drawer(
      backgroundColor: secondary,
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Oflutter.com'),
            accountEmail: const Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person, color: primary,),
            title: Text('Account'),
          ),
          const ListTile(
            leading: Icon(Icons.settings, color: primary,),
            title: Text('Setting'),
          ),
          const ListTile(
            leading: Icon(Icons.mark_chat_read_outlined),
            title: Text('About'),
          ),
          const ListTile(
            leading: Icon(Icons.leave_bags_at_home),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
