import 'package:flutter/material.dart';
import 'package:propuesta_enchiladas/src/utils/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
            itemCount: 5,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 2,
              mainAxisSpacing: responsive.hp(1),
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'home${index + 1}');
                },
                child: Container(
                  child: Center(
                    child: Text('Propuesta (${index + 1})'),
                  ),
                ),
              );
            }),
      ),
    );
  }
}