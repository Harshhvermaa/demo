
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'basic_example_page.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BasicExamplePage(),
                    ));
                  },
                  child: Text("Navigate")),
            ],
          )
        ],
      ),
    );
  }
}
