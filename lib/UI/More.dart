import 'package:flutter/material.dart';

class More extends StatefulWidget {
  final String title;
  final String discn;
  final String contry;
  final String sub;

  const More({
    super.key,
    required this.title,
    required this.discn,
    required this.contry, required this.sub,
  });

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'More',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,width: 320,
              color: Colors.blue[100],
            ),
            Center(
                child: Container(
                    width: 320,
                    child: Text(
                      widget.title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ))),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SubTitle : '),
                      SizedBox(width:200,child: Text(widget.sub)),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('country : '),
                      Text(widget.contry),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                width: 320,
                child: Text(widget.discn,))
          ],
        ),
      ),
    );
  }
}
