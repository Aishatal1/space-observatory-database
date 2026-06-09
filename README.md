# ESP32 Smart Home Control System

## Overview
IoT-based smart home system using ESP32 to control:
- 💡 Lights (relay-controlled)
- 🪟 Window blinds (servo-controlled)
- 🔔 Doorbell notification

## Hardware
- ESP32 D1 Mini
- 2-channel relay module
- 2x SG90 servo motors
- Push buttons
- External 5V power supply

## Features
- WiFi connectivity
- Serial command interface (15+ commands)
- Real-time status reporting
- Doorbell detection

## Commands
| Command | Action |
|---------|--------|
| 11 | Living light ON |
| 12 | Living light OFF |
| 21 | Bedroom light ON |
| 22 | Bedroom light OFF |
| 31 | Window 1 OPEN |
| 32 | Window 1 CLOSE |
| 41 | Window 2 OPEN |
| 42 | Window 2 CLOSE |
| 99 | Status |

## Setup
1. Update WiFi credentials in `src/main.cpp`
2. Connect hardware as per pin definitions
3. Upload using PlatformIO

## Author
Aisha Taleb — Computer Engineering student, Palestine Ahliya University
