import 'package:creditsea/components/appBar.dart';
import 'package:creditsea/components/stepProgressBar.dart';
import 'package:creditsea/statemanagement/progressGetx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Approvaloffer extends StatefulWidget {
  const Approvaloffer({super.key});

  @override
  State<Approvaloffer> createState() => _ApprovalofferState();
}

class _ApprovalofferState extends State<Approvaloffer> {
  final selectedEmployment = ''.obs;
  late final ProgressController progressController;
  ProgressController get progress => progressController;
  final TextEditingController companyController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController incomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    progressController = Get.put(ProgressController());
  }

  final List<Map<String, String>> employmentOptions = [
    {
      "title": "Salaried",
      "subtitle":
          "Choose this if you receive a regular salary from an employer in your bank account.",
      "value": "salaried",
    },
    {
      "title": "Self-employed / Business Owner / Freelancer",
      "subtitle":
          "Choose this if you earn through your own business, freelance work, or client projects.",
      "value": "self",
    },
    {
      "title": "Unemployed / Workless",
      "subtitle":
          "Choose this if you're between jobs or not receiving regular income right now.",
      "value": "unemployed",
    },
  ];

  Widget _confirmationRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: Text(value, style: GoogleFonts.poppins())),
        ],
      ),
    );
  }

  Widget _customInputField(
    String label,
    String hint,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins()),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey.shade500,
              fontSize: 14,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CreaditSea(),
      bottomNavigationBar: Obx(() {
        return selectedEmployment.value.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Please confirm your details",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                if (companyController.text.trim().isNotEmpty)
                                  _confirmationRow(
                                    selectedEmployment.value == "salaried"
                                        ? "Company Name"
                                        : selectedEmployment.value == "self"
                                        ? "Business or Firm Name"
                                        : "What do you currently do?",
                                    companyController.text,
                                  ),
                                if (incomeController.text.trim().isNotEmpty)
                                  _confirmationRow(
                                    selectedEmployment.value == "salaried"
                                        ? "Net Monthly Income (INR)"
                                        : selectedEmployment.value == "self"
                                        ? "Business Domain"
                                        : "Alternate Personal Email Address",
                                    incomeController.text,
                                  ),

                                if (emailController.text.trim().isNotEmpty)
                                  _confirmationRow(
                                    "Work Email Address",
                                    emailController.text,
                                  ),

                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () {
                                          progressController.goToPreviousStep();
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Edit Details",
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue
                                        ),
                                        onPressed: () {
                                          Get.toNamed("/otpVerification");
                                        },
                                        child: Text(
                                          "Yes, Proceed",
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 24,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Verify Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink();
      }),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 70,
                  width: width * 0.9,
                  child: StepProgressBar(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Let’s get to know your work life',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "This helps us tailor offers just for you safely and securely",
                style: GoogleFonts.poppins(color: Colors.black45),
              ),
              const SizedBox(height: 20),
              Obx(
                () => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) => SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                  child: selectedEmployment.value.isEmpty
                      ? Column(
                          key: const ValueKey('radioSelection'),
                          children: employmentOptions.map((option) {
                            final isSelected =
                                selectedEmployment.value == option['value'];
                            return GestureDetector(
                              onTap: () {
                                selectedEmployment.value = option['value']!;
                                companyController.clear();
                                incomeController.clear();
                                emailController.clear();
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.blue
                                        : Colors.grey.shade300,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            option['title']!,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            option['subtitle']!,
                                            style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Radio<String>(
                                      value: option['value']!,
                                      groupValue: selectedEmployment.value,
                                      onChanged: (val) {
                                        selectedEmployment.value = val!;
                                        companyController.clear();
                                        incomeController.clear();
                                        emailController.clear();
                                      },
                                      activeColor: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      : Column(
                          key: const ValueKey('formSection'),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (selectedEmployment.value == "salaried") ...[
                              _customInputField(
                                "Company Name",
                                "e.g. Infosys, HDFC Bank",
                                companyController,
                              ),
                              const SizedBox(height: 12),
                              _customInputField(
                                "Net Monthly Income (INR)",
                                "e.g. ₹45,000",
                                incomeController,
                              ),
                              const SizedBox(height: 12),
                              _customInputField(
                                "Work Email Address",
                                "e.g. you@company.com",
                                emailController,
                              ),
                            ] else if (selectedEmployment.value == "self") ...[
                              _customInputField(
                                "Business or Firm Name",
                                "e.g. TechGrow Solutions",
                                companyController,
                              ),
                              const SizedBox(height: 12),
                              _customInputField(
                                "Business Domain",
                                "e.g. IT Services, Retail, Content Writing",
                                incomeController,
                              ),
                              const SizedBox(height: 12),
                              _customInputField(
                                "Work Email Address",
                                "e.g. hello@yourbrand.com",
                                emailController,
                              ),
                            ] else if (selectedEmployment.value ==
                                "unemployed") ...[
                              _customInputField(
                                "What do you currently do?",
                                "e.g. Freelancing",
                                companyController,
                              ),
                              const SizedBox(height: 12),
                              _customInputField(
                                "Alternate Personal Email Address",
                                "e.g. yourname@gmail.com",
                                incomeController,
                              ),
                              const SizedBox(height: 12),
                            ],
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Icon(Icons.lock_outline, size: 16),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    "Your data stays safe. We never share without your consent.",
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
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
