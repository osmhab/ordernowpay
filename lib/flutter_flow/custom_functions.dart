import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double newCustomFunction(
  int quantity,
  double price,
) {
  return quantity * price;
}

double deleteItem(
  int quantity,
  double price,
) {
  return quantity * price;
}

double totalCalculate(
  double extraCharge,
  double tip,
  double discount,
  int quantity,
  double price,
) {
  return (quantity * price);
}

bool showSearchResult(
  String searchTextFor,
  String searchTextIn,
) {
  return searchTextIn.toLowerCase().contains(searchTextFor.toLowerCase());
}

double fraisStripeEtOrderNowCreatedByAdmin(
  double total,
  double fraisStripe1,
  double fraisStripe2,
  double tips,
) {
  return total - (total * fraisStripe1 / 100) - fraisStripe2;
}

double fraisStripeEtOrderNowStaff(
  double fraisStripe1,
  double fraisStripe2,
  double tips,
) {
  return (tips) - (tips * fraisStripe1 / 100) - fraisStripe2;
}

double stripePay(double total) {
  return total * 100;
}

double fraisStripeEtOrderNowCreatedByStaff(
  double total,
  double fraisStripe1,
  double fraisStripe2,
  double tips,
) {
  return (total - tips) - ((total - tips) * fraisStripe1 / 100) - fraisStripe2;
}

double tipCalculate(
  double subtotal,
  double tip,
  double discount,
  double extraCharges,
) {
  return subtotal + tip + extraCharges - discount;
}

double discountCalculate(
  double subtotal,
  double discount,
  double tip,
  double extraCharges,
) {
  return subtotal - discount + extraCharges + tip;
}

double extraChargesCalculate(
  double subtotal,
  double discount,
  double tip,
  double extraCharges,
) {
  return subtotal - discount + extraCharges + tip;
}

double oNFeesCalculate(
  double subtotal,
  double extraCharge,
  double discount,
) {
  double total = subtotal + extraCharge - discount;
  return (total + (0.01 * total) / 0.971) + 0.30;
}
