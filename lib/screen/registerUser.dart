import 'package:creditsea/components/appBar.dart';
import 'package:creditsea/components/stepProgressBar.dart';
import 'package:creditsea/statemanagement/progressGetx.dart';
import 'package:creditsea/statemanagement/registerGetx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final controller = Get.put(RegisterController());
  final progressController = Get.put(ProgressController());

  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final dobCtrl = TextEditingController();
  final pincodeCtrl = TextEditingController();
  final panCtrl = TextEditingController();

  void _showConfirmationModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please re-confirm the details",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            _buildDetailRow("First Name", controller.firstName.value),
            _buildDetailRow("Last Name", controller.lastName.value),
            _buildDetailRow("Personal Email ID", controller.email.value),
            _buildDetailRow("Date of Birth", controller.dob.value),
            _buildDetailRow("Gender", controller.gender.value),
            _buildDetailRow("Pincode", controller.pincode.value),
            _buildDetailRow("PAN Card Number", controller.pan.value),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Edit details", style: GoogleFonts.poppins()),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); 
                    Future.delayed(Duration(milliseconds: 100), () {
                      Get.toNamed('/approval'); 
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                  ),
                  child: Text(
                    "Yes, proceed",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget pincodeDashedInput({
    required TextEditingController controller,
    required Function(String) onChanged,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pincode", style: GoogleFonts.poppins()),
            const SizedBox(height: 8),
            Stack(
              children: [
                TextField(
                  controller: controller,
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 0,
                    color: Colors.transparent,
                  ),
                  cursorColor: Colors.transparent,
                  decoration: const InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                  ),
                  onChanged: (val) {
                    onChanged(val);
                    setState(() {});
                  },
                ),
                IgnorePointer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      String ch = "";
                      if (controller.text.length > index) {
                        ch = controller.text[index];
                      }
                      return Column(
                        children: [
                          Text(
                            ch,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(width: 20, height: 1, color: Colors.grey),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 160,
            child: Text(
              label,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: Text(value, style: GoogleFonts.poppins())),
        ],
      ),
    );
  }

  Widget panCardDashedInput({
    required TextEditingController controller,
    required Function(String) onChanged,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("PAN Card Number", style: GoogleFonts.poppins()),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: Stack(
                children: [
                  TextField(
                    controller: controller,
                    maxLength: 10,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 0,
                      color: Colors.transparent,
                    ),

                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                    onChanged: (val) {
                      onChanged(val);
                      setState(() {});
                    },
                  ),
                  IgnorePointer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(10, (index) {
                        String ch = "";
                        if (controller.text.length > index) {
                          ch = controller.text[index];
                        }
                        return Column(
                          children: [
                            Text(
                              ch,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(width: 20, height: 1, color: Colors.grey),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  Widget _customTextField({
    required String label,
    required TextEditingController controller,
    required Function(String) onChanged,
    String? hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins()),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText ?? '',
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreaditSea(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Center(child: StepProgressBar()),
              ),

              SizedBox(height: 10),
              Text(
                "Quick details to unlock your credit journey",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              _customTextField(
                label: "First Name",
                controller: firstNameCtrl,
                onChanged: (val) => controller.firstName.value = val,
              ),
              _customTextField(
                label: "Last Name",
                controller: lastNameCtrl,
                onChanged: (val) => controller.lastName.value = val,
              ),
              _customTextField(
                label: "Personal Email ID",
                controller: emailCtrl,
                onChanged: (val) => controller.email.value = val,
              ),
              _customTextField(
                label: "Date of Birth",
                hintText: "(dd/mm/yyyy)",
                controller: dobCtrl,
                onChanged: (val) => controller.dob.value = val,
              ),
              Text("Gender", style: GoogleFonts.poppins()),
              Obx(
                () => Row(
                  children: [
                    Radio<String>(
                      value: "Male",
                      groupValue: controller.gender.value,
                      onChanged: (val) => controller.gender.value = val!,
                    ),
                    const Text("Male"),
                    Radio<String>(
                      value: "Female",
                      groupValue: controller.gender.value,
                      onChanged: (val) => controller.gender.value = val!,
                    ),
                    const Text("Female"),
                    Radio<String>(
                      value: "Others",
                      groupValue: controller.gender.value,
                      onChanged: (val) => controller.gender.value = val!,
                    ),
                    const Text("Others"),
                  ],
                ),
              ),
              pincodeDashedInput(
                controller: pincodeCtrl,
                onChanged: (val) => controller.pincode.value = val,
              ),
              panCardDashedInput(
                controller: panCtrl,
                onChanged: (val) => controller.pan.value = val,
              ),

              const SizedBox(height: 30),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    final progress = Get.find<ProgressController>();
                    progress.preAdvanceLine();
                    _showConfirmationModal(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
