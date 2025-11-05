import 'package:cookgram/core/utils/app_colors.dart';

import 'package:cookgram/features/search/persentation/widgets/recommed_list.dart';
import 'package:flutter/material.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back_ios),
              Container(
                width: 320,
                height: 50,

                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: AppColors.greyAppC),
                    hintText: 'Search Recipes / Ingredients ',
                    hintStyle: TextStyle(
                      color: AppColors.greyAppC.withOpacity(0.6),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xffEEECE7)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xffEEECE7)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Recommeded Cuisines',
            style: TextStyle(
              color: AppColors.blackAppC,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 130, child: RecommedList()),
          SizedBox(height: 12),
          Text(
            'Popular Recipes',
            style: TextStyle(
              color: AppColors.blackAppC,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 130, child: RecommedList()),
          SizedBox(height: 12),
          Text(
            'Top Chefs',
            style: TextStyle(
              color: AppColors.blackAppC,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 130, child: RecommedList()),
        ],
      ),
    );
  }
}
