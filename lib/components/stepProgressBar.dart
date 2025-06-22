import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../statemanagement/progressGetx.dart';

class StepProgressBar extends StatelessWidget {
  final List<String> steps = ["Register", "Approved Offer", "KYC", "Disbursal"];
  final controller = Get.find<ProgressController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Row(
            children: List.generate(steps.length * 2 - 1, (index) {
              if (index.isEven) {
                final stepIndex = index ~/ 2;
                final isActive = controller.currentStep.value >= stepIndex;
                return Expanded(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 14,
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
                    ],
                  ),
                );
              } else {
                final lineIndex = (index - 1) ~/ 2;
                final isLineActive =
                    controller.progressLineStep.value > lineIndex;

                return Expanded(
                  child: Container(
                    height: 2,
                    color: isLineActive ? Colors.blue : Colors.grey.shade300,
                  ),
                );
              }
            }),
          ),

          const SizedBox(height: 6),
          Row(
            children: List.generate(steps.length, (index) {
              final isCurrent = controller.currentStep.value == index;

              return Expanded(
                child: Text(
                  steps[index],
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: isCurrent ? Colors.black : Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }),
          ),
        ],
      );
    });
  }
}
