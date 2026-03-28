import 'package:flutter/material.dart';
import 'dart:ui'; // Para el efecto de desenfoque (Glassmorphism)

void main() {
  runApp(const MiVisionApp());
}

class MiVisionApp extends StatelessWidget {
  const MiVisionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Byron Vision Portal',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan, 
          brightness: Brightness.dark,
        ),
      ),
      home: const PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. FONDO DEGRADADO PROFUNDO
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
              ),
            ),
          ),
          // 2. CONTENIDO PRINCIPAL CON SCROLL
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                  child: Column(
                    children: [
                      // Encabezado
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.code, color: Colors.cyanAccent),
                          const SizedBox(width: 10),
                          Text(
                            "BYRON'S DEV PORTAL",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      
                      // TARJETA DE VISIÓN (Efecto Glassmorphism)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white.withOpacity(0.1)),
                            ),
                            child: const Column(
                              children: [
                                Icon(Icons.rocket_launch, size: 80, color: Colors.cyanAccent),
                                SizedBox(height: 30),
                                Text(
                                  "MI VISIÓN",
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    letterSpacing: 4,
                                  ),
                                ),
                                Divider(color: Colors.cyanAccent, thickness: 2, indent: 50, endIndent: 50),
                                SizedBox(height: 20),
                                Text(
                                  "Convertirme en un Desarrollador Flutter Full-Stack, "
                                  "creando soluciones innovadoras que impacten el mundo.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white70,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 50),
                      
                      const Text(
                        "ÁREAS DE ENFOQUE",
                        style: TextStyle(color: Colors.cyanAccent, letterSpacing: 2, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      
                      // Botones táctiles interactivos
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
                        children: [
                          _buildFocusChip(context, Icons.phone_android, "Flutter"),
                          _buildFocusChip(context, Icons.storage, "Bases de Datos"),
                          _buildFocusChip(context, Icons.cloud, "Cloud Dev"),
                          _buildFocusChip(context, Icons.brush, "UI/UX Design"),
                        ],
                      ),
                      
                      const SizedBox(height: 60),
                      
                      // PROGRESO
                      Column(
                        children: [
                          const Text("PROGRESO DE LA VISIÓN", style: TextStyle(color: Colors.white60)),
                          const SizedBox(height: 10),
                          Container(
                            width: 300,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 180, // 60% de progreso
                                decoration: BoxDecoration(
                                  color: Colors.cyanAccent,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(color: Colors.cyanAccent, blurRadius: 10),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text("Fase 1: Dominio de Interfaz (60%)", style: TextStyle(color: Colors.cyanAccent, fontSize: 12)),
                        ],
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

  // FUNCIÓN PARA CREAR LOS CHIPS INTERACTIVOS
  Widget _buildFocusChip(BuildContext context, IconData icon, String label) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Enfoque en $label: ¡Activado para Byron! 🔥"),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.cyan[800],
            duration: const Duration(milliseconds: 800),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.cyanAccent.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.cyanAccent, size: 20),
            const SizedBox(width: 10),
            Text(label, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
} // <--- Esta es la llave que cerraba todo el código