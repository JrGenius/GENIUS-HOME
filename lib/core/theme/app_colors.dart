import 'package:flutter/material.dart';

/// GENIUS HOME™ — Dark glass dashboard palette
/// Inspired by night sky with glowing frosted glass cards
class AppColors {
  AppColors._();

  // ─── Background gradient ──────────────────────────────────────────
  static const Color bgDarkTop = Color(0xFF0A0E1A);
  static const Color bgDarkMid = Color(0xFF0F1628);
  static const Color bgDarkBottom = Color(0xFF0D1220);

  // ─── Brand / Accent ───────────────────────────────────────────────
  static const Color accentBlue = Color(0xFF4A9EFF);
  static const Color accentBlueSoft = Color(0xFF6BB3FF);
  static const Color accentBlueGlow = Color(0xFF2D7AE8);
  static const Color accentPurple = Color(0xFF7C5CFC);

  // ─── Semantic ─────────────────────────────────────────────────────
  static const Color success = Color(0xFF34D399);
  static const Color successGlow = Color(0xFF10B981);
  static const Color energyYellow = Color(0xFFFBBF24);
  static const Color gasOrange = Color(0xFFF97316);
  static const Color warning = Color(0xFFF59E0B);
  static const Color critical = Color(0xFFEF4444);

  // ─── Glass surfaces ───────────────────────────────────────────────
  static const Color glassCard = Color(0xFF141B2E);
  static const Color glassCardLight = Color(0xFF1A2340);
  static const Color glassBorder = Color(0x30FFFFFF);
  static const Color glassBorderGlow = Color(0x504A9EFF);
  static const Color glassInner = Color(0x0CFFFFFF);

  // ─── Text ─────────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0BEC5);
  static const Color textTertiary = Color(0xFF6B7A8D);
  static const Color textMuted = Color(0xFF4A5568);

  // ─── Sidebar ──────────────────────────────────────────────────────
  static const Color sidebarBg = Color(0xFF0D1526);
  static const Color sidebarActive = Color(0xFF4A9EFF);
  static const Color sidebarItemHover = Color(0x1A4A9EFF);

  // ─── Neutral ──────────────────────────────────────────────────────
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color divider = Color(0x1AFFFFFF);

  // ─── Ring / Chart colors ──────────────────────────────────────────
  static const Color ringElectricity = Color(0xFF4A9EFF);
  static const Color ringGas = Color(0xFF34D399);
  static const Color chartLine = Color(0xFF6BB3FF);
  static const Color chartDot = Color(0xFFFFFFFF);

  // ─── Onboarding (dark glass premium, Ivorian-friendly) ───────────
  static const Color onbBgTop = Color(0xFFFFFFFF);
  static const Color onbBgBottom = Color(0xFFFFFFFF);
  static const Color onbCard = Color(0xFFF8FAFE);
  static const Color onbCardBorder = Color(0xFFDDE5F1);
  static const Color onbBlue = Color(0xFF155AD8);
  static const Color onbBlueBright = Color(0xFF2F7DF6);
  static const Color onbOrange = Color(0xFFFFB703);
  static const Color onbGreen = Color(0xFF22C55E);
  static const Color onbRed = Color(0xFFFF5A5F);
  static const Color onbTextPrimary = Color(0xFF111827);
  static const Color onbTextSub = Color(0xFF60708D);
  static const Color onbGlass = Color(0xFFFFFFFF);
  static const Color onbGlassBorder = Color(0xFFDCE4F0);
  static const Color onbBtnGlow = Color(0xFF1E5ABA);

  // ─── Backward compatibility aliases ───────────────────────────────
  static const Color geniusBlue = accentBlue;
  static const Color geniusBlueSoft = accentBlueSoft;
  static const Color geniusBlueGlow = accentBlueGlow;
  static const Color economy = success;
  static const Color surfaceCardDark = glassCard;
  static const Color glassBorderDark = glassBorder;
  static const Color grey200 = Color(0xFF2A3548);
  static const Color grey400 = textTertiary;
  static const Color grey500 = textMuted;
}
