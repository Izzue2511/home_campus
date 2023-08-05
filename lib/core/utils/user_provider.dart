import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _currentUserId = '';
  String _propertyId = '';
  String _bookingId = '';

  String get currentUserId => _currentUserId;
  String get propertyId => _propertyId;
  String get bookingId => _bookingId;

  void setCurrentUserId(String userId) {
    _currentUserId = userId;
    notifyListeners();
  }

  void setCurrentUserIdByTenantId(String tenantId) {
    _currentUserId = tenantId;
    notifyListeners();
  }

  void setCurrentUserIdByOwnerId(String ownerId) {
    _currentUserId = ownerId;
    notifyListeners();
  }

  void setCurrentUserIdByAdminId(String adminId) {
    _currentUserId = adminId;
    notifyListeners();
  }

  // New method to set the propertyId
  void setPropertyId(String propertyId) {
    _propertyId = propertyId;
    notifyListeners();
  }

  // New method to set the bookingId
  void setBookingId(String bookingId) {
    _bookingId = bookingId;
    notifyListeners();
  }
}
