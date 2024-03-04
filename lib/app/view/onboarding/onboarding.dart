import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/app/model/image.dart';
import 'package:hotel_booking/app/utils/colorconstans.dart';
import 'package:hotel_booking/app/view/auth/signin/signin.dart';
import 'package:hotel_booking/app/view/onboarding/bloc/onboarding_bloc.dart';
import 'package:hotel_booking/app/view/onboarding/bloc/onboarding_event.dart';
import 'package:hotel_booking/app/view/onboarding/bloc/onboarding_state.dart';

class Onboarding extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);
  Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 235, 234),
      body: BlocBuilder<OnboardingBloc, OnboardingStates>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              PageView(
                controller: controller,
                onPageChanged: (value) {
                  state.pageIndex = value;
                  BlocProvider.of<OnboardingBloc>(context)
                      .add(OnboardingEvents());
                },
                children: [
                  _page(
                    context: context,
                    pageIndex: 0,
                    imageUrl: AppAssets.kOnboardingFirst,
                    title: 'Discover Unique Stays',
                    desc:
                        'Explore a world of unique accommodations curated just for you.  find the perfect stay for every occasion.',
                  ),
                  _page(
                    context: context,
                    pageIndex: 1,
                    imageUrl: AppAssets.kOnboardingSecond,
                    title: 'Book with Ease',
                    desc:
                        'Our user-friendly app makes booking your dream getaway a breeze. secure payment options, planning your next adventure has never been easier.',
                  ),
                  _page(
                    context: context,
                    pageIndex: 2,
                    imageUrl: AppAssets.kOnboardingThird,
                    title: 'Unlock Exclusive Deals',
                    desc:
                        'Gain access to exclusive deals in our app users. personalized recommendations tailored to your travel preferences. Start saving on your next booking today!',
                  ),
                ],
              ),
              Positioned(
                bottom: 210,
                child: DotsIndicator(
                  dotsCount: 3,
                  position:
                      BlocProvider.of<OnboardingBloc>(context).state.pageIndex,
                  decorator: DotsDecorator(
                    color:
                        const Color.fromARGB(255, 16, 15, 15).withOpacity(0.2),
                    activeColor: const Color.fromARGB(255, 29, 28, 28),
                    size: const Size.square(9.0),
                    activeSize: const Size(36.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _page({
    required pageIndex,
    required imageUrl,
    required title,
    required desc,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
          ),
          Text(title,
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Text(desc,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14)),
          ),
          const SizedBox(height: 150),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: pageIndex == 2
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: pageIndex != 2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const SignIn();
                      }));
                    },
                    child: Text(
                      'Skip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: const Color.fromARGB(255, 22, 21, 21)
                            .withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pageIndex == 2
                        ? Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                            return const SignIn();
                          }))
                        : controller.animateToPage(pageIndex + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.decelerate);
                  },
                  child: pageIndex == 2
                      ? Container(
                          width: 150,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.kPrimary,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Text(
                            'Get Started',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Container(
                          width: 60,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.kPrimary,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
