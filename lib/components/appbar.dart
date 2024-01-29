import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_app/components/const.dart';
import 'package:riverpod_app/components/search.dart';
import 'package:riverpod_app/models/model_product.dart';
import 'package:riverpod_app/pages/cartpage.dart';
import 'package:riverpod_app/providers/addtocart.dart';

class AppBarCarousel extends ConsumerWidget {
  const AppBarCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addCart = ref.watch(cartProvider) as CartModel;
    return SliverAppBar.medium(
      backgroundColor: const Color.fromARGB(255, 43, 42, 42),
      title: const Search(),
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
          background: Stack(
        children: [
          CarouselSlider.builder(
              itemCount: carouselImages.length,
              itemBuilder: ((context, index, realIndex) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(carouselImages[index]))),
                  )),
              options: CarouselOptions(
                height: 300,
                viewportFraction: 1,
                autoPlay: true,
              )),
          Container(
            color: Colors.black.withOpacity(.5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Flexible(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Shop what you need!',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'JUST FOR YOU!',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                  Flexible(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ),
                        );
                      },
                      
                      child: Stack(
                        children: [
                          LottieBuilder.network(
                              "https://lottie.host/1f0ce3e8-3ea4-49fe-8125-9af227dae49f/FmSnVEFKKj.json"),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${addCart.cart.length} ",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
