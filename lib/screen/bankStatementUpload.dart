import 'package:creditsea/components/appBar.dart';
import 'package:creditsea/components/stepProgressBar.dart';
import 'package:creditsea/services/file__picker_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';

class BankstatementuploadScreen extends StatefulWidget {
  const BankstatementuploadScreen({super.key});

  @override
  State<BankstatementuploadScreen> createState() =>
      _BankstatementuploadScreenState();
}

class _BankstatementuploadScreenState extends State<BankstatementuploadScreen> {
  PlatformFile? pickedFile;
  double uploadProgress = 0.0;
  var isbar = false;

  void pickFile() async {
    final file = await FilePickerService.pickPDF();
    if (file != null) {
      setState(() {
        pickedFile = file;
        uploadProgress = 0.8;
      });
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          uploadProgress = 1.0;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CreaditSea(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: pickedFile != null && uploadProgress == 1.0
                ? () {
                  Get.toNamed("/success"); 
                }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: pickedFile != null && uploadProgress == 1.0
                  ? Colors.blue
                  : Colors.blue.shade300,
              foregroundColor: Colors.white,
              disabledBackgroundColor: Colors.blue.shade100,
              disabledForegroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              pickedFile != null && uploadProgress == 1.0
                  ? "Continue"
                  : "Upload Statement",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
      body: Padding(
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
            const SizedBox(height: 10),
            Text(
              'Upload bank statement (PDF) to move forward with your loan.',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Text(
                  "Upload your bank statement",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "(Last 3 or 6 months)",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (pickedFile == null)
              GestureDetector(
                onTap: pickFile,
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFCECECE)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          color: Colors.blue,
                          size: 30,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Upload File",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "File should be in .pdf format",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.insert_drive_file,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            pickedFile!.name,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              pickedFile = null;
                              isbar = true;
                              uploadProgress = 0.0;
                            });
                          },
                          child: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "File Uploaded Successfully",
                      style: GoogleFonts.poppins(
                        color: Colors.green,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 24),
            if (isbar)
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: LinearProgressIndicator(
                      value: uploadProgress,
                      minHeight: 20,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.green,
                      ),
                    ),
                  ),
                  Text(
                    "${(uploadProgress * 100).toInt()}% Completed",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
