import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterController extends GetxController {
  var firstName = ''.obs;
  var lastName = ''.obs;
  var email = ''.obs;
  var dob = ''.obs;
  var gender = 'Male'.obs;
  var pincode = ''.obs;
  var pan = ''.obs;
}

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(RegisterController());

  final TextEditingController firstNameCtrl = TextEditingController();
  final TextEditingController lastNameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController dobCtrl = TextEditingController();
  final TextEditingController pincodeCtrl = TextEditingController();
  final TextEditingController panCtrl = TextEditingController();

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
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Edit details",
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle final submission
                    Navigator.pop(context);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Text(
                  "Quick details to unlock your credit journey",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  "First Name",
                  firstNameCtrl,
                  (val) => controller.firstName.value = val,
                ),
                _buildTextField(
                  "Last Name",
                  lastNameCtrl,
                  (val) => controller.lastName.value = val,
                ),
                _buildTextField(
                  "Personal Email ID",
                  emailCtrl,
                  (val) => controller.email.value = val,
                ),
                _buildTextField(
                  "Date of Birth",
                  dobCtrl,
                  (val) => controller.dob.value = val,
                  hintText: "dd/mm/yyyy",
                ),
                const SizedBox(height: 10),
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
                _buildTextField(
                  "Pincode",
                  pincodeCtrl,
                  (val) => controller.pincode.value = val,
                ),
                _buildTextField(
                  "PAN Card Number",
                  panCtrl,
                  (val) => controller.pan.value = val,
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
                      if (_formKey.currentState!.validate()) {
                        _showConfirmationModal(context);
                      }
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
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    Function(String) onChanged, {
    String? hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: (value) =>
            value == null || value.isEmpty ? "Required" : null,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
