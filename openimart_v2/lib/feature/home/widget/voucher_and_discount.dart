import 'package:flutter/material.dart';
import 'package:openimart_v2/feature/home/hom_section_pages/voucher_and_discount_page.dart';

class VoucherAndDiscount extends StatelessWidget {
  const VoucherAndDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VoucherAndDiscountPage(),
          ),
        );
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Voucher & Discount",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Text(
                  "More vouchers >",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildVoucherCard("10% OFF", "Open I Mart"),
                const SizedBox(width: 10),
                _buildVoucherCard("৳40", "Free shipping"),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VoucherAndDiscountPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ).copyWith(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.transparent),
                    elevation: WidgetStateProperty.all(0),
                    overlayColor: WidgetStateProperty.resolveWith((states) {
                      return states.contains(WidgetState.pressed)
                          // ignore: deprecated_member_use
                          ? Colors.white.withOpacity(0.1)
                          : null;
                    }),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange.shade400,
                          Colors.deepOrange.shade400,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: const Text(
                      "Collect All",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoucherCard(String title, String subtitle) {
    return CustomPaint(
      painter: TicketPainter(
        borderColor: Colors.transparent,
        gradientColors: [
          Colors.orange.shade400,
          Colors.deepOrange.shade400,
        ],
      ),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 1,
              color: Colors.white.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(vertical: 4),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketPainter extends CustomPainter {
  final Color borderColor;
  final List<Color> gradientColors;

  TicketPainter({
    required this.borderColor,
    required this.gradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();
    final radius = 8.0;
    final circleRadius = 8.0;

    // Left side
    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    // Top side
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Right side with circle cutout
    path.lineTo(size.width, size.height / 2 - circleRadius);
    path.arcToPoint(
      Offset(size.width, size.height / 2 + circleRadius),
      radius: Radius.circular(circleRadius),
      clockwise: false,
    );

    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - radius, size.height);

    // Bottom side
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);

    // Left side with circle cutout
    path.lineTo(0, size.height / 2 + circleRadius);
    path.arcToPoint(
      Offset(0, size.height / 2 - circleRadius),
      radius: Radius.circular(circleRadius),
      clockwise: false,
    );

    path.close();
    canvas.drawPath(path, paint);

    // Draw dotted line
    final dashPaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    double startY = size.height / 2;
    double dashWidth = 2;
    double dashSpace = 3;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX + dashWidth, startY),
        dashPaint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
