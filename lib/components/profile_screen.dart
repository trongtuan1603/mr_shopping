import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ScrollController _scrollController = ScrollController();
  final showFullAvatar = RxBool(false);
  final scrollPixels = RxDouble(0);

  @override
  void initState() {
    _scrollController.addListener(_scrollHandler);
    super.initState();
  }

  void _scrollHandler() {
    if (!showFullAvatar.value && _scrollController.position.pixels < -35) {
      showFullAvatar.value = true;
    } else if (showFullAvatar.value && _scrollController.position.pixels > 10) {
      showFullAvatar.value = false;
    }
    scrollPixels(_scrollController.position.pixels);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Container(
                color: Colors.blue,
                width: double.infinity,
                constraints: BoxConstraints(minHeight: Get.height + 10),
                child: Column(
                  children: [
                    Obx(
                      () => AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          height: showFullAvatar.value
                              ? 0
                              : MediaQuery.of(context).viewPadding.top + 40),
                    ),
                    Obx(
                      () {
                        return AnimatedContainer(
                          height: showFullAvatar.value ? 300 : 100,
                          width: showFullAvatar.value ? Get.width : 100,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(showFullAvatar.value ? 0 : 100),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://t3.ftcdn.net/jpg/02/00/90/24/360_F_200902415_G4eZ9Ok3Ypd4SZZKjc8nqJyFVp1eOD6V.jpg'))),
                          duration: Duration(milliseconds: 100),
                        );
                      },
                    ),
                    Text("Tuan Nguyen"),
                    SizedBox(height: 70),
                    ...List.generate(20, (index) => ListTile(title: Text("Item $index")))
                  ],
                ),
              ),
            ),
            Obx(() => showFullAvatar.value
                ? Image.network(
                    'https://t3.ftcdn.net/jpg/02/00/90/24/360_F_200902415_G4eZ9Ok3Ypd4SZZKjc8nqJyFVp1eOD6V.jpg',
                    height: 400 + scrollPixels.value.abs(),
                    fit: BoxFit.cover,
                  )
                : Container()),
            _headerIcons()
          ],
        ),
      ),
    );
  }

  Widget _headerIcons() {
    return Obx(
      () => AnimatedContainer(
        duration: Duration(microseconds: 100),
        decoration: BoxDecoration(
            color: showFullAvatar.value ? Colors.transparent : Colors.white),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedContainer(
              padding: EdgeInsets.symmetric(
                  horizontal: showFullAvatar.value ? 16 : 0,
                  vertical: showFullAvatar.value ? 5 : 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(showFullAvatar.value ? 20 : 0),
                  color: showFullAvatar.value ? Colors.white : Colors.transparent),
              duration: Duration(milliseconds: 100),
              child: Icon(Icons.arrow_back_outlined),
            ),
            AnimatedContainer(
              padding: EdgeInsets.symmetric(
                  horizontal: showFullAvatar.value ? 16 : 0,
                  vertical: showFullAvatar.value ? 5 : 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(showFullAvatar.value ? 20 : 0),
                  color: showFullAvatar.value ? Colors.white : Colors.transparent),
              duration: Duration(milliseconds: 100),
              child: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
