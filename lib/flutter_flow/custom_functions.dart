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

double stripePay(double total) {
  return total * 100;
}

double fraisStripeEtOrderNow(
  double total,
  double fraisOrderNow,
  double fraisStripe,
) {
  return total - (total * fraisOrderNow / 100) - fraisStripe;
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
