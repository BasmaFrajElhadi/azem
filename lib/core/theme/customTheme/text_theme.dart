import 'package:final_azem/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTextTheme{
  AppTextTheme._();

  static TextTheme lightTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0,fontWeight: FontWeight.bold,color: AppColors.textPrimary ),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0,fontWeight: FontWeight.w600,color: AppColors.textPrimary),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0,fontWeight: FontWeight.w600,color: AppColors.textPrimary),

    titleLarge: const TextStyle().copyWith(fontSize: 16.0,fontWeight: FontWeight.w600,color: AppColors.textPrimary),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0,fontWeight: FontWeight.w500,color: AppColors.textPrimary),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0,fontWeight: FontWeight.w400,color: AppColors.textPrimary),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0,fontWeight: FontWeight.w500,color: AppColors.textPrimary),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0,fontWeight: FontWeight.normal,color: AppColors.textPrimary),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0,fontWeight: FontWeight.w500,color: AppColors.textPrimary),

    labelLarge: const TextStyle().copyWith(fontSize: 12.0,fontWeight: FontWeight.normal,color: AppColors.textPrimary),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0,fontWeight: FontWeight.normal,color: AppColors.textSecondary),
  );

  static TextTheme darkTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0,fontWeight: FontWeight.bold,color: Colors.white),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0,fontWeight: FontWeight.w600,color: Colors.white),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0,fontWeight: FontWeight.w600,color: Colors.white),

    titleLarge: const TextStyle().copyWith(fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.white),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0,fontWeight: FontWeight.w500,color: Colors.white),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0,fontWeight: FontWeight.w400,color: Colors.white),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0,fontWeight: FontWeight.w500,color: Colors.white),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0,fontWeight: FontWeight.normal,color: Colors.white),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0,fontWeight: FontWeight.w500,color: Colors.white),

    labelLarge: const TextStyle().copyWith(fontSize: 12.0,fontWeight: FontWeight.normal,color: Colors.white),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0,fontWeight: FontWeight.normal,color: Colors.white.withOpacity(0.5)),
  );
}