
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(color: Colors.white,
        child: const SizedBox(width: 25,
            height: 25,
            child: Align(alignment: Alignment.center,
                child: CircularProgressIndicator(color: Colors.blue,)))));
  }
}
