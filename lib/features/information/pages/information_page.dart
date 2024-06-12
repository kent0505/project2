import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/appbar/custom_appbar.dart';
import '../models/news_model.dart';
import '../widgets/dash_plane.dart';
import '../widgets/news_card.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(title: 'News'),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            children: [
              Container(
                height: 30,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: const Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Different places',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    DashPlane(dash: '- — — — — — — — — -', right: 80),
                  ],
                ),
              ),
              const Text(
                'Good place',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15),
              ...List<Widget>.generate(
                getAllNews().length,
                (index) {
                  return NewsCard(
                    newsModel: getAllNews()[index],
                    ago: index,
                    onPressed: () {
                      context.push('/news', extra: getAllNews()[index]);
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
        const SizedBox(height: 65),
      ],
    );
  }
}
