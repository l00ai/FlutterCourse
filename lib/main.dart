import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_applecation/theme/my_theme.dart';

import 'booster.dart';
import 'my_shared_perf.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MySharedPref().init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.getThemeData(isLight: true),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          flexibleSpace: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const Text("العنوان الحالي", style: TextStyle(fontSize: 12),),
                    Booster.textBody(context, "العنوان الحالي"),
                    Row(
                      children: [
                        // const Text("15A, James Street", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                        Booster.textBody(context, "15A, James Street",
                            fontWeight: FontWeight.w600),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          color: theme.primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Booster.verticalSpace(),
              Booster.textTitle(context, "مرحبا بك وبعودتك  👋"),
              Booster.verticalSpace(),
              Container(
                //height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Booster.textBody(context, "ما الذي تريد أن تبحث عنه",
                        color: theme.primaryColor.withOpacity(0.5)),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: theme.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Booster.verticalSpace(height: 35),
              CarouselDemo(
                listItem: [
                  SliderItem(
                    img: "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png",
                    onClicked: () {

                    },
                  ),
                  SliderItem(
                    img: "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                    onClicked: (){

                    },
                  ),
                  SliderItem(
                    img: "https://img.freepik.com/premium-photo/image-colorful-galaxy-sky-generative-ai_791316-9864.jpg?w=2000",
                    onClicked: (){

                    },
                  ),
                ],
              ),
              Booster.verticalSpace(height: 35),
              Booster.textTitle(context, "الخدمات التي نقدمها"),
              Booster.verticalSpace(),

            ],
          ),
        ),
      ),
    );
  }
}

class SliderItem extends StatelessWidget {
  final String img;
  final Function onClicked;

  const SliderItem({Key? key, required this.img, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClicked(),
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.deepOrangeAccent,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CarouselDemo extends StatelessWidget {
  final List<Widget> listItem;

  CarouselDemo({super.key, required this.listItem});

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) => CarouselSlider(
        items: listItem,
        carouselController: buttonCarouselController,
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: false,
          autoPlayInterval: const Duration(seconds: 1),
          viewportFraction: 0.92,
          aspectRatio: 2.0,
          initialPage: 1,
          padEnds: false,
          pageSnapping: true,
        ),
      );
}
