import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'page4_request_oil.dart';

class Page3DriverDetail extends StatefulWidget {
  const Page3DriverDetail({super.key});

  @override
  State<Page3DriverDetail> createState() => _Page3DriverDetailState();
}

class _Page3DriverDetailState extends State<Page3DriverDetail> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _next() => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const Page4RequestOil()));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _next,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 270,
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
                            _locationRow(Icons.circle, Colors.black87, 'BMW ASTRA BSD'),
                            Divider(height: 1, indent: 32, color: Colors.grey.shade200),
                            _locationRow(Icons.circle, Colors.orange, "B'Residence BSD"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                color: const Color(0xFFF5C842),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    const Icon(Icons.arrow_circle_up_rounded, size: 28),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Driver will arrive in',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          Text('Stay safe and enjoy your ride',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(8)),
                      child: const Text('7 min',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                  ],
                ),
              ),

              Divider(height: 1, color: Colors.grey.shade200),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('B-2485-RWD',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Text('Putri Gunawan',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Row(
                                  children: [
                                    Icon(Icons.star_rounded, size: 14, color: Colors.amber),
                                    SizedBox(width: 2),
                                    Text('5.0',
                                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/fotodriver.png',
                        width: 70, height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
                  children: [
                    _TapFeedbackButton(
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5C842),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const Icon(Icons.phone, size: 20),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Send message to driver',
                          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(color: Color(0xFFF5C518), width: 1.5),
                          ),
                          suffixIcon: const Icon(Icons.send_rounded, size: 18, color: Color(0xFFF5C518)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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

  Widget _locationRow(IconData icon, Color color, String label) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Icon(icon, size: 12, color: color),
            const SizedBox(width: 10),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          ],
        ),
      );
}

class _TapFeedbackButton extends StatefulWidget {
  final Widget child;
  const _TapFeedbackButton({required this.child});

  @override
  State<_TapFeedbackButton> createState() => _TapFeedbackButtonState();
}

class _TapFeedbackButtonState extends State<_TapFeedbackButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.88 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: widget.child,
      ),
    );
  }
}
