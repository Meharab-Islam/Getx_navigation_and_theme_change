import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_routing/main.dart';

class NextScreen extends StatefulWidget {
  final String rName;
  const NextScreen({Key? key, this.rName = 'default route'}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.rName}")),
      body: Center(
        child: Column(
          children: [
            Text(
              "${widget.rName}",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Off'))
          ],
        ),
      ),
    );
  }
}
