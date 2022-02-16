import 'package:flutter/cupertino.dart';

class Loader extends StatelessWidget {
  final String? message;

  const Loader({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 25.0,
            width: 25.0,
            child: CupertinoActivityIndicator(),
          ),
          if (message != null)
            Text(
              message ?? "",
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}
