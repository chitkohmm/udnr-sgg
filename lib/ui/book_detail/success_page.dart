import 'package:flutter/material.dart';
import 'package:libms_flutter/domain/constants.dart';
import 'package:libms_flutter/ui/bottom_nav_bar/bottom_nav_bar.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/checking.png",
                height: 80,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Text(
                "Order Success",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  kGoToNextAndRemove(context, const BottomNavBar(index: 0));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      color: const Color(0xFF5AE4A8),
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text("Back to home"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
