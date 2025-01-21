import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const _BackGround(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Hello, World!',
                ),
                ClipPath(
                  clipper: CustomerClipper(),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.orange),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                            itemCount: 9,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: ShapeDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment(0.00, -1.00),
                                          end: Alignment(0, 1),
                                          colors: [
                                            Color(0xFF624FBB),
                                            Color(0xFF8C6BBD),
                                            Color(0xFF6A46B2)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    Text('Flights')
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        TextFormField(),
                        TextFormField(),
                        TextFormField(),
                        Container(
                          width: 330,
                          height: 44,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.00, -1.00),
                              end: Alignment(0, 1),
                              colors: [Color(0xFF6D41CE), Color(0xFF8D20C2)],
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0xFF1A0C57),
                                blurRadius: 30,
                                offset: Offset(0, 10),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _BackGround extends StatelessWidget {
  const _BackGround();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [
            Color(0xFF180D41),
            Color(0xFF350D53),
            Color(0xFF190E43),
            Color(0xFF130736)
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x4C000000),
            blurRadius: 219.71,
            offset: Offset(131.82, 131.82),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 100,
            offset: Offset(0, 60),
            spreadRadius: 0,
          )
        ],
      ),
    );
  }
}

class CustomerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    var controlPoint2 = Offset(50, size.height - 100);
    var controlPoint1 = Offset(size.width + 100, size.height + 100);
    var endPoint = Offset(size.width + 100, size.height - 100);
    path.moveTo(size.width, 0); // Start at the top-left corner
    path.lineTo(0, 0); // Draw a line to the bottom-left corner
    path.lineTo(0, size.height); // Draw a line to the bottom-right corner
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);
    // Add cubic curve from bottom-right corner to the top-right corner

    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
