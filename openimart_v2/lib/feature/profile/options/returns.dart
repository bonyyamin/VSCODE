import 'package:flutter/material.dart';

class ReturnsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Returns"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Returns",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5, // Replace with the dynamic count of returns
                    itemBuilder: (context, index) {
                      return ReturnCard(isMobile: isMobile);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ReturnCard extends StatelessWidget {
  final bool isMobile;

  const ReturnCard({Key? key, required this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: isMobile ? 60 : 80,
                  width: isMobile ? 60 : 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                    image: const DecorationImage(
                      image: AssetImage('assets/sample_product.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Product Name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Reason: Wrong Product",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Refund: \$123.45",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ReturnStepsIndicator(currentStep: 2),
          ],
        ),
      ),
    );
  }
}

class ReturnStepsIndicator extends StatelessWidget {
  final int currentStep;

  const ReturnStepsIndicator({Key? key, required this.currentStep})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final steps = ["Initiated", "In Transit", "Refunded"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: steps.map((step) {
        final stepIndex = steps.indexOf(step);
        final isCompleted = stepIndex <= currentStep;

        return Column(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: isCompleted ? Colors.green : Colors.grey[300],
              child: Icon(
                Icons.check,
                size: 16,
                color: isCompleted ? Colors.white : Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              step,
              style: TextStyle(
                fontSize: 12,
                color: isCompleted ? Colors.black : Colors.grey,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
