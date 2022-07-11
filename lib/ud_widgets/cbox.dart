import 'package:flutter/material.dart';

class CBox extends StatefulWidget {
  const CBox({
    Key? key,
  }) : super(key: key);

  @override
  State<CBox> createState() => _CBoxState();
}

class _CBoxState extends State<CBox> {
  bool? checkedValue = true;
  
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
        child: SizedBox(width: 200,
          child: ListTile(
            leading: Checkbox(
              activeColor: Colors.green[400],
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue;
                });
              },
            ),
            title: Text(
              "Remember me",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
    );
  }
}
