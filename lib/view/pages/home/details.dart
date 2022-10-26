import 'package:flutter/material.dart';

import '../../../model/home/movies_find_model.dart';
import '../../../model/models.dart';

class DetailsScreen extends StatefulWidget {
  final MoviesFindModel data;
  const DetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              widget.data.name.toString(),
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Hero(
                  tag: widget.data.imageUrl.toString(),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage(
                              widget.data.imageUrl.toString(),
                            ),
                            fit: BoxFit.fill),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              color: Colors.black26)
                        ]),
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Price \$${widget.data.duration}",
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
