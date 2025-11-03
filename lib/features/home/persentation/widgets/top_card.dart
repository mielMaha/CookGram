import 'package:cookgram/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  const TopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image(
          image: AssetImage('assets/homeTopImage.png'),
          width: double.infinity,
          height: 362,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 101,
          right: 17,
          child: Container(
            // margin: EdgeInsets.only(top: 330),
            width: 308,
            height: 161,
            decoration: BoxDecoration(
              color: AppColors.blackAppC.withOpacity(0.6),
              borderRadius: BorderRadiusDirectional.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Food of the Day',
                    style: TextStyle(
                      color: AppColors.whiteAppC,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Dosai',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.yellowAppC,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'An iconic dish that represents the rich culinary heritage of South India.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.whiteAppC,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, right: 17.0),
          child: TextButton.icon(
            iconAlignment: IconAlignment.end,
            style: TextButton.styleFrom(
              minimumSize: Size(180, 30),
              foregroundColor: AppColors.blackAppC,
              backgroundColor: AppColors.whiteAppC.withOpacity(0.5),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            label: Text('Explore Recipes'),
            icon: Icon(Icons.arrow_forward),
          ),
        ),
      ],
    );
  }
}
