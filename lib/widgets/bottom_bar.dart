import 'package:flutter/material.dart';

class TabBarMaterial extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChangeTab;
  const TabBarMaterial(
      {Key? key, required this.index, required this.onChangeTab})
      : super(key: key);

  Widget buildTabItem(BuildContext context,
      {required int index,
      required IconData selectedIcon,
      required IconData notSelectedicon}) {
    final isSelected = index == this.index;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            splashRadius: 1,
            onPressed: () => onChangeTab(index),
            icon: Icon(isSelected ? selectedIcon : notSelectedicon,
                size: 28, color: isSelected ? Colors.white : Colors.grey)),
        Icon(
          Icons.circle,
          size: 10,
          color: isSelected ? Colors.white : Colors.transparent,
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  final placeholder = const Opacity(
    opacity: 0,
    child: IconButton(onPressed: null, icon: Icon(Icons.no_cell)),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 100,
      width: size.width,
      child: CustomPaint(
        size: Size(
            size.width,
            (size.width * 0.125)
                .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
        painter: RPSCustomPainter(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTabItem(context,
                index: 0,
                selectedIcon: Icons.home_rounded,
                notSelectedicon: Icons.home_outlined),
            buildTabItem(context,
                index: 1,
                selectedIcon: Icons.favorite_rounded,
                notSelectedicon: Icons.favorite_border_rounded),
            placeholder,
            buildTabItem(context,
                index: 2,
                selectedIcon: Icons.bookmark_rounded,
                notSelectedicon: Icons.bookmark_border_rounded),
            buildTabItem(context,
                index: 3,
                selectedIcon: Icons.settings_rounded,
                notSelectedicon: Icons.settings_outlined),
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = Paint()
      ..color = const Color.fromRGBO(48, 52, 69, 1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.2000000);
    path_0.quadraticBezierTo(size.width * 0.0018250, size.height * 0.0250000,
        size.width * 0.0250000, size.height * 0.1000000);
    path_0.cubicTo(
        size.width * 0.0370625,
        size.height * 0.1248000,
        size.width * 0.0602750,
        size.height * 0.1826000,
        size.width * 0.0750000,
        size.height * 0.2000000);
    path_0.cubicTo(
        size.width * 0.1687625,
        size.height * 0.3005000,
        size.width * 0.3196250,
        size.height * 0.3999000,
        size.width * 0.4125000,
        size.height * 0.3000000);
    path_0.cubicTo(
        size.width * 0.4089375,
        size.height * 0.4392000,
        size.width * 0.4088875,
        size.height * 0.5537000,
        size.width * 0.4125000,
        size.height * 0.7000000);
    path_0.cubicTo(
        size.width * 0.4571125,
        size.height * 0.7073000,
        size.width * 0.5384125,
        size.height * 0.7071000,
        size.width * 0.5875000,
        size.height * 0.7000000);
    path_0.cubicTo(
        size.width * 0.5910750,
        size.height * 0.5393000,
        size.width * 0.5901250,
        size.height * 0.4250000,
        size.width * 0.5875000,
        size.height * 0.3000000);
    path_0.cubicTo(
        size.width * 0.6794875,
        size.height * 0.4354000,
        size.width * 0.8330500,
        size.height * 0.3568000,
        size.width * 0.9250000,
        size.height * 0.2000000);
    path_0.cubicTo(
        size.width * 0.9397625,
        size.height * 0.1750000,
        size.width * 0.9638875,
        size.height * 0.1322000,
        size.width * 0.9750000,
        size.height * 0.1000000);
    path_0.quadraticBezierTo(size.width * 0.9981500, size.height * 0.0181000,
        size.width, size.height * 0.2000000);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.3000000);
    path_0.lineTo(0, size.height * 0.2000000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
