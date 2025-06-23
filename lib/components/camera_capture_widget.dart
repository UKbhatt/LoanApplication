import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class CameraCaptureWidget extends StatefulWidget {
  final Function(XFile) onImageCaptured;

  const CameraCaptureWidget({super.key, required this.onImageCaptured});

  @override
  State<CameraCaptureWidget> createState() => _CameraCaptureWidgetState();
}

class _CameraCaptureWidgetState extends State<CameraCaptureWidget> {
  CameraController? _cameraController;
  bool _isCameraInitialized = false;
  bool _isCapturing = false;
  File? _capturedImageFile;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
        (cam) => cam.lensDirection == CameraLensDirection.front,
      );

      _cameraController = CameraController(
        frontCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _cameraController!.initialize();
      if (!mounted) return;
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      print("Camera initialization error: $e");
    }
  }

  Future<void> _captureImage() async {
    if (_cameraController != null &&
        _cameraController!.value.isInitialized &&
        !_isCapturing) {
      setState(() => _isCapturing = true);
      try {
        final xfile = await _cameraController!.takePicture();
        final file = File(xfile.path);

        await _cameraController?.pausePreview();

        setState(() {
          _capturedImageFile = file;
          _isCapturing = false;
        });

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showVerifySelfieModal(xfile);
        });
      } catch (e) {
        print("Error capturing image: $e");
        setState(() => _isCapturing = false);
      }
    }
  }

  void _showVerifySelfieModal(XFile image) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please verify your selfie",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Make sure your face is clearly visible and well-lit before proceeding.",
                style: GoogleFonts.poppins(fontSize: 13),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        setState(() {
                          _capturedImageFile = null;
                        });
                        await _cameraController?.resumePreview();
                      },
                      child: const Text("Retake"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        _showKycModal(image);
                      },
                      child: Text(
                        "Confirm",
                        style: GoogleFonts.poppins(color: Colors.white),
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
  }

  void _showKycModal(XFile image) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please submit your KYC",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "🔒 Your selfie is used only for one-time verification and never stored.",
                style: GoogleFonts.poppins(fontSize: 13),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Get.offNamed("/success2");
                  widget.onImageCaptured(XFile(_capturedImageFile!.path));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
                child: const Text("Submit KYC"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let’s match your face to your Aadhaar",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "A quick selfie for smooth verification.",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: _capturedImageFile != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      _capturedImageFile!,
                      height: 350,
                      width: width * 0.85,
                      fit: BoxFit.cover,
                    ),
                  )
                : _isCameraInitialized
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      height: 350,
                      width: width * 0.85,
                      child: CameraPreview(_cameraController!),
                    ),
                  )
                : Container(
                    height: 350,
                    width: width * 0.85,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
          ),
          const SizedBox(height: 30),
          Center(
            child: GestureDetector(
              onTap: _captureImage,
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: _isCapturing
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
