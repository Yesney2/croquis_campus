
import 'package:flutter/material.dart';

void main() {
  runApp(const CroquisCampusApp());
}

class CroquisCampusApp extends StatelessWidget {
  const CroquisCampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Croquis Campus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FB),
        useMaterial3: true,
      ),
      home: const CampusMapScreen(),
    );
  }
}

class CampusMapScreen extends StatelessWidget {
  const CampusMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FB),
        title: const Text('Mapa del campus'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TecNM Campus Tlalpan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Explora los edificios e instalaciones',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // Visor del plano
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: InteractiveViewer(
                    constrained: false,
                    minScale: 0.5,
                    maxScale: 8.0,
                    boundaryMargin: const EdgeInsets.all(100),
                    
child: SizedBox(
  width: 700,
  height: 500,
  child: Stack(
    children: [
      // Imagen del campus
      Positioned.fill(
        child: Image.asset(
          'assets/planos/campus_general.png',
          fit: BoxFit.fill,
        ),
      ),

      
// EDIFICIO 1
Positioned(
  left: 270,
  top: 140,
  width: 210,
  height: 65,
  child: GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const EdificioDetalleScreen(),
        ),
      );
    },
    child:const SizedBox.expand (
    ),
  ),
),

      

      
// EDIFICIO 2
Positioned(
  left: 145,
  top: 245,
  width: 168,
  height: 75,
  child: GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Edificio2Screen(),
        ),
      );
    },
    child: const SizedBox.expand(),
  ),
),
], // Cierra la lista de elementos del Stack
), // Cierra Stack
), // Cierra SizedBox
), // Cierra InteractiveViewer
), // Cierra ClipRRect
), // Cierra Container
), // Cierra Expanded

            

            const SizedBox(height: 16),

            const Text(
              'Explorar edificios',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12),

            // Botón para seleccionar edificio
            Card(
              color: Colors.white,
              child: ListTile(
                leading: const Icon(Icons.apartment),
                title: const Text('Seleccionar edificio'),
                trailing: const Icon(Icons.chevron_right),
                
onTap: () {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    builder: (sheetContext) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Selecciona un edificio',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // EDIFICIO 1
            ListTile(
              leading: const Icon(Icons.apartment),
              title: const Text('Edificio 1'),
              subtitle: const Text('Consultar plantas'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(sheetContext);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const EdificioDetalleScreen(),
                  ),
                );
              },
            ),

            // EDIFICIO 2
            ListTile(
              leading: const Icon(Icons.apartment),
              title: const Text('Edificio 2'),
              subtitle: const Text('Consultar plantas'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(sheetContext);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Edificio2Screen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),
          ],
        ),
      );
    },
  );
},

                  
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class EdificioDetalleScreen extends StatefulWidget {
  const EdificioDetalleScreen({super.key});

  @override
  State<EdificioDetalleScreen> createState() =>
      _EdificioDetalleScreenState();
}

class _EdificioDetalleScreenState
    extends State<EdificioDetalleScreen> {
  int pisoSeleccionado = 0;

  final List<String> nombresPisos = [
    'Planta baja',
    'Piso 1',
    'Piso 2',
    'Piso 3',
  ];

  final List<String> imagenesPisos = [
    'assets/planos/planta_baja.png',
    'assets/planos/piso_1.png',
    'assets/planos/piso_2.png',
    'assets/planos/piso_3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edificio 1'),
        backgroundColor: const Color(0xFFF8F9FB),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),

          const Text(
            'Selecciona una planta',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonFormField<int>(
              initialValue: pisoSeleccionado,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Planta del edificio',
              ),
              items: List.generate(
                nombresPisos.length,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(nombresPisos[index]),
                ),
              ),
              onChanged: (valor) {
                if (valor != null) {
                  setState(() {
                    pisoSeleccionado = valor;
                  });
                }
              },
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: InteractiveViewer(
                key: ValueKey(pisoSeleccionado),
                constrained: false,
                minScale: 0.5,
                maxScale: 8.0,
                boundaryMargin: const EdgeInsets.all(100),
                child: SizedBox(
                  width: 700,
                  height: 500,
                  child: Image.asset(
                    imagenesPisos[pisoSeleccionado],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}


class Edificio2Screen extends StatefulWidget {
  const Edificio2Screen({super.key});

  @override
  State<Edificio2Screen> createState() =>
      _Edificio2ScreenState();
}

class _Edificio2ScreenState extends State<Edificio2Screen> {
  int pisoSeleccionado = 0;

  final List<String> nombresPisos = [
    'Planta baja',
    'Piso 1',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edificio 2'),
        backgroundColor: const Color(0xFFF8F9FB),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),

          const Text(
            'Selecciona una planta',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonFormField<int>(
              initialValue: pisoSeleccionado,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Planta del edificio',
              ),
              items: List.generate(
                nombresPisos.length,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(nombresPisos[index]),
                ),
              ),
              onChanged: (valor) {
                if (valor != null) {
                  setState(() {
                    pisoSeleccionado = valor;
                  });
                }
              },
            ),
          ),

          const SizedBox(height: 16),

        
Expanded(
  child: pisoSeleccionado == 0
      // PLANTA BAJA: mostrar el plano real
      ? ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: InteractiveViewer(
            key: const ValueKey('edificio2_planta_baja'),
            constrained: false,
            minScale: 0.5,
            maxScale: 8.0,
            boundaryMargin: const EdgeInsets.all(100),
            child: SizedBox(
              width: 700,
              height: 500,
              child: Image.asset(
                'assets/planos/plantab_edi2.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        )

      // PISO 1: aviso de próximamente
      : Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.architecture_outlined,
                    size: 72,
                    color: Color(0xFF9CA3AF),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Próximamente',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Estamos preparando el plano de esta planta.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
),

        ],
      ),
    );
  }
}


