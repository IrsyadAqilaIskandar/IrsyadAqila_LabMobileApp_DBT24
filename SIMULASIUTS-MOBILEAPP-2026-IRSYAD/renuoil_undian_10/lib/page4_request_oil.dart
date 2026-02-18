import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Page4RequestOil extends StatefulWidget {
  const Page4RequestOil({super.key});

  @override
  State<Page4RequestOil> createState() => _Page4RequestOilState();
}

class _Page4RequestOilState extends State<Page4RequestOil> {
  final _amountController = TextEditingController();
  final _searchController = TextEditingController();
  String _selectedCourier = '';
  String _selectedOil = '';

  final List<String> _couriers = ['JNE', 'GoSend', 'Grab Express', 'J&T'];
  final List<String> _oilTypes = ['Pertamina 10W-40', 'Shell Helix', 'Castrol GTX', 'Federal Oil'];

  @override
  void dispose() {
    _amountController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _pickCourier() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2))),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Pilih Kurir', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
          ..._couriers.map((c) => ListTile(
                title: Text(c),
                trailing: _selectedCourier == c
                    ? const Icon(Icons.check_circle_rounded, color: Color(0xFFF5C518))
                    : null,
                onTap: () {
                  setState(() => _selectedCourier = c);
                  Navigator.pop(context);
                },
              )),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void _pickOilType() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2))),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Pilih Jenis Oli', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
          ..._oilTypes.map((o) => ListTile(
                title: Text(o),
                trailing: _selectedOil == o
                    ? const Icon(Icons.check_circle_rounded, color: Color(0xFFF5C518))
                    : null,
                onTap: () {
                  setState(() => _selectedOil = o);
                  Navigator.pop(context);
                },
              )),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFF5C842),
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Start your search',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _NavIcon(icon: Icons.home_rounded, label: 'Home'),
                      _NavIcon(icon: Icons.account_balance_wallet_rounded, label: 'Balance'),
                      _NavIcon(icon: Icons.arrow_circle_up_rounded, label: 'Withdraw'),
                      _NavIcon(icon: Icons.location_on_rounded, label: 'Pick Up'),
                      _NavIcon(icon: Icons.qr_code_rounded, label: 'QR Code'),
                      _NavIcon(icon: Icons.history_rounded, label: 'History'),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 175,
              child: FlutterMap(
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
                    _dot(const LatLng(-6.3097, 106.6678), Colors.red, Colors.white),
                  ]),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FormField(
                      leading: const Icon(Icons.home_outlined),
                      label: 'BMW Astra Serpong',
                      trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),

                    _FormField(
                      leading: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.grey.shade200,
                          child: const Icon(Icons.local_gas_station, size: 13)),
                      label: 'Nearest ReNuOil (B Residence BSD City)',
                    ),
                    const SizedBox(height: 18),

                    Row(
                      children: [
                        const Text('Amount  : ', style: TextStyle(fontSize: 15)),
                        SizedBox(
                          width: 64,
                          height: 38,
                          child: TextField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.grey.shade400),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text('Liters', style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    const SizedBox(height: 14),

                    GestureDetector(
                      onTap: _pickOilType,
                      child: Row(
                        children: [
                          Text(
                            'Type of oil : ${_selectedOil.isEmpty ? '-' : _selectedOil}',
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(width: 6),
                          const Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.grey),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    Row(
                      children: [
                        const Text('Courier  : ', style: TextStyle(fontSize: 15)),
                        Expanded(
                          child: GestureDetector(
                            onTap: _pickCourier,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      _selectedCourier.isEmpty ? 'Pilih kurir' : _selectedCourier,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: _selectedCourier.isEmpty
                                              ? Colors.grey
                                              : Colors.black87),
                                    ),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF5C518),
                    foregroundColor: Colors.black87,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Request',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
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
}

class _FormField extends StatelessWidget {
  final Widget leading;
  final String label;
  final Widget? trailing;

  const _FormField({required this.leading, required this.label, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          leading,
          const SizedBox(width: 10),
          Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14))),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

class _NavIcon extends StatefulWidget {
  final IconData icon;
  final String label;

  const _NavIcon({required this.icon, required this.label});

  @override
  State<_NavIcon> createState() => _NavIconState();
}

class _NavIconState extends State<_NavIcon> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.85 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Column(
          children: [
            Icon(widget.icon, size: 22, color: _pressed ? Colors.black54 : Colors.black87),
            const SizedBox(height: 3),
            Text(widget.label,
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
