import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'page2_driver_found.dart';

class Page1Booking extends StatefulWidget {
  const Page1Booking({super.key});

  @override
  State<Page1Booking> createState() => _Page1BookingState();
}

class _Page1BookingState extends State<Page1Booking> {
  int _selected = 0;

  void _next() => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const Page2DriverFound()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  FlutterMap(
                    options: const MapOptions(
                      initialCenter: LatLng(-6.3040, 106.6615),
                      initialZoom: 14.5,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      PolylineLayer(polylines: [
                        Polyline(
                          points: [
                            const LatLng(-6.2988, 106.6544),
                            const LatLng(-6.3015, 106.6572),
                            const LatLng(-6.3042, 106.6615),
                            const LatLng(-6.3075, 106.6660),
                            const LatLng(-6.3097, 106.6678),
                          ],
                          color: Colors.blue,
                          strokeWidth: 5,
                        ),
                      ]),
                      MarkerLayer(markers: [
                        _dot(const LatLng(-6.2988, 106.6544), Colors.white, Colors.black),
                        _dot(const LatLng(-6.3097, 106.6678), Colors.orange, Colors.white),
                      ]),
                    ],
                  ),

                  Positioned(
                    top: 12, left: 12, right: 12,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8)],
                      ),
                      child: Column(
                        children: [
                          _locationRow(
                            icon: Icons.circle,
                            iconColor: Colors.black87,
                            label: 'BMW ASTRA BSD',
                            trailing: _addBadge(),
                          ),
                          Divider(height: 1, indent: 32, color: Colors.grey.shade200),
                          _locationRow(
                            icon: Icons.circle,
                            iconColor: Colors.orange,
                            label: "B'Residence BSD",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('For you',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 10),
                  _VehicleCard(
                    icon: Icons.directions_car,
                    label: 'CAR',
                    price: 'Rp24.500',
                    selected: _selected == 0,
                    onTap: () => setState(() => _selected = 0),
                  ),
                  const SizedBox(height: 8),
                  _VehicleCard(
                    icon: Icons.motorcycle,
                    label: 'Motorcycle',
                    price: 'Rp12.500',
                    oldPrice: 'Rp15.000',
                    selected: _selected == 1,
                    onTap: () => setState(() => _selected = 1),
                  ),
                  const SizedBox(height: 14),
                  _YellowButton(label: 'Confirm', onPressed: _next),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Marker _dot(LatLng point, Color fill, Color border) => Marker(
        point: point,
        width: 18,
        height: 18,
        child: Container(
          decoration: BoxDecoration(
            color: fill,
            shape: BoxShape.circle,
            border: Border.all(color: border, width: 3),
          ),
        ),
      );

  Widget _addBadge() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: Colors.white, size: 13),
            SizedBox(width: 2),
            Text('Add', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
          ],
        ),
      );

  Widget _locationRow({
    required IconData icon,
    required Color iconColor,
    required String label,
    Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 12, color: iconColor),
          const SizedBox(width: 10),
          Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14))),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}


class _VehicleCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String price;
  final String? oldPrice;
  final bool selected;
  final VoidCallback onTap;

  const _VehicleCard({
    required this.icon,
    required this.label,
    required this.price,
    required this.selected,
    required this.onTap,
    this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? Colors.black87 : Colors.grey.shade300,
            width: selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: selected ? Colors.grey.shade50 : Colors.white,
        ),
        child: Row(
          children: [
            Icon(icon, size: 26, color: Colors.black87),
            const SizedBox(width: 12),
            Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15))),
            if (oldPrice != null) ...[
              Text(oldPrice!,
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 13,
                      decoration: TextDecoration.lineThrough)),
              const SizedBox(width: 6),
            ],
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ],
        ),
      ),
    );
  }
}

class _YellowButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _YellowButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF5C518),
          foregroundColor: Colors.black87,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
