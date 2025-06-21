import 'package:creditsea/statemanagement/progressGetx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepProgressBar extends StatelessWidget {
  final List<String> steps = ["Register", "Approved Offer", "KYC", "Disbursal"];
  final controller = Get.find<ProgressController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(steps.length, (index) {
          final isActive = controller.currentStep.value >= index;
          final isCurrent = controller.currentStep.value == index;

          return Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: isActive
                          ? Colors.blue
                          : Colors.grey.shade300,
                      child: isActive
                          ? const Icon(
                              Icons.check,
                              size: 14,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    if (index != steps.length - 1)
                      Expanded(
                        child: Container(
                          height: 2,
                          color: controller.currentStep.value > index
                              ? Colors.blue
                              : Colors.grey.shade300,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  steps[index],
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: isCurrent ? Colors.black : Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
