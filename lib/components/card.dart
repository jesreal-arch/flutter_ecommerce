import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';
import 'package:riverpod_app/models/model_product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.products,
    required this.index,
  });

  final List<ProductModel> products;
  final int index;

  @override
  Widget build(BuildContext context) {
    final CategoryModel categoryProduct =
        CategoryModel.fromJson(products[index].category);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(3, 0),
              blurRadius: 6,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                products[index].images[0],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                products[index].title,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 11),
              ),
              const SizedBox(
                height: 10,
              ),
              ReadMoreText(
                products[index].description,
                trimLines: 3,
                colorClickableText: Colors.black,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read more',
                trimExpandedText: 'Show less',
                style: GoogleFonts.poppins(color: Colors.grey, fontSize: 10),
                moreStyle: GoogleFonts.poppins(color: Colors.red, fontSize: 10),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Price",
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "P${products[index].price}0",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12),
                  ),
                  Flexible(
                    child: Text(
                      categoryProduct.name,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 11),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
