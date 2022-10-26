import 'package:flutter/material.dart';
import 'package:odc_interview/view/components/auth_components/auth_components.dart';
import 'package:odc_interview/view/components/core/style.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: defaultField(controller: searchController, type: TextInputType.text, text: 'Search', radius: 50),
      ),
    );
  }
}
