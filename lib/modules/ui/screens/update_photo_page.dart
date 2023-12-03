import 'package:flutter/material.dart';

class UpdatePhotoPage extends StatelessWidget {
  const UpdatePhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.blue,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Upload a photo of your Details of your illness",
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
              const SizedBox(height: 30),
              const Text(
                "Regulations reuire you to upload a photo for illness. Don't worry. Your data will stay safe and private.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
                maxLines: 4,
              ),
              const SizedBox(height: 30),
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Select file",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Scan Your skin",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: const Text("Continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
