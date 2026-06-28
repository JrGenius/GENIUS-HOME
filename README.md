# 🏡 GENIUS HOME™

> **Your AI-powered Home Energy Assistant.**
>
> Predict your electricity and gas consumption before you run out.

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue)
![Platform](https://img.shields.io/badge/Platform-Web%20%7C%20Android%20%7C%20iOS-success)
![License](https://img.shields.io/badge/License-Apache%202.0-green)
![Status](https://img.shields.io/badge/Status-Development-orange)
![PWA](https://img.shields.io/badge/PWA-Ready-blueviolet)
![Offline First](https://img.shields.io/badge/Offline-First-success)

---

## 🌍 About

**GENIUS HOME™** is an AI-powered Smart Home Assistant designed for emerging markets, helping households monitor, predict and optimize their energy consumption.

Unlike traditional smart home solutions that require expensive IoT devices, GENIUS HOME starts with **manual data collection** and progressively learns the household's energy habits using local AI algorithms.

The goal is simple:

> **Never run out of electricity or cooking gas unexpectedly again.**

---

## ✨ Vision

Millions of households use prepaid electricity meters and bottled gas every day.

Most families have no idea:

- How much electricity remains
- When the power will run out
- When to buy a new gas bottle
- Which appliances consume the most energy

GENIUS HOME changes that.

The application gradually learns your consumption patterns and predicts your remaining autonomy with increasing accuracy.

---

# 🚀 Features

## ⚡ Electricity Monitoring

- Manual meter balance input
- Daily consumption tracking
- Weekly statistics
- Monthly statistics
- Consumption history
- Estimated remaining autonomy
- Estimated power outage date
- AI prediction engine

---

## 🔥 Gas Monitoring

- Gas bottle management
- Multiple bottle sizes
- Remaining gas estimation
- Usage history
- Estimated replacement date
- AI learning model

---

## 🏠 House Management

Manage your home digitally.

Create:

- House
- Rooms
- Household members

---

## 🛋 Room Management

Unlimited rooms.

Examples:

- Living Room
- Kitchen
- Bedroom
- Office
- Garage
- Garden
- Bathroom

---

## 🔌 Appliance Inventory

Register every appliance in your home.

Examples:

- TV
- Smart TV
- Refrigerator
- Freezer
- Air Conditioner
- Fan
- Iron
- Microwave
- Oven
- Washing Machine
- WiFi Router
- NAS
- Desktop Computer
- Laptop
- PlayStation
- Xbox
- Water Pump
- LED Lights
- Printer
- Security Cameras

Each appliance stores:

- Category
- Brand
- Model
- Power Rating (Watts)
- Estimated daily usage
- Estimated consumption

---

## 📊 AI Predictions

The local prediction engine estimates:

- Remaining electricity
- Remaining gas
- Daily consumption
- Monthly trends
- Confidence score
- Future consumption

No cloud AI required.

Everything runs locally.

---

## 🔔 Smart Notifications

Examples:

> ⚠️ Your electricity may run out in 3 days.

> 🔥 Your gas bottle should be replaced this week.

> 📈 Your consumption increased by 18%.

> 🌱 Congratulations! You reduced your energy usage this month.

---

## 📱 Progressive Web App

Built as a Flutter Web PWA.

Benefits:

- Installable
- Offline First
- Fast
- Native-like experience
- Mobile Ready

The same codebase will later compile to:

- Android
- iOS
- Desktop

without rewriting the application.

---

# 🧠 AI First

Version 1 intentionally avoids heavy Machine Learning.

Instead it uses lightweight local algorithms:

- Moving Average
- Trend Analysis
- Linear Regression
- Confidence Scoring
- Seasonal Adjustments

Future versions will support:

- TensorFlow Lite
- Edge AI
- Behavioral Learning

---

# 🔌 IoT Ready

GENIUS HOME is designed from day one for Smart Home integration.

Future hardware includes:

- GENIUS PowerPlug™
- Smart Energy Meter
- Smart Gas Scale
- Temperature Sensors
- Water Monitoring
- Presence Detection

Supported protocols planned:

- MQTT
- Matter
- Zigbee
- Thread
- BLE
- Wi-Fi

---

# 🏗 Architecture

```
Flutter

        │

Clean Architecture

        │

Feature First

        │

Riverpod

        │

Repositories

        │

Prediction Engine

        │

Local Database

        │

Offline First
```

---

# 📦 Tech Stack

- Flutter
- Flutter Web (PWA)
- Material 3
- Riverpod
- GoRouter
- Drift (SQLite)
- Freezed
- JSON Serializable
- Local Notifications
- Shared Preferences
- fl_chart

---

# 📂 Project Structure

```
lib/

core/
shared/

features/
    dashboard/
    house/
    rooms/
    devices/
    electricity/
    gas/
    analytics/
    predictions/
    notifications/
    settings/

theme/
widgets/
services/
repositories/
models/
```

---

# 🌍 Offline First

GENIUS HOME works even without Internet.

All user data remains on the device.

Cloud synchronization will become optional in future releases.

---

# 🎯 Roadmap

## Version 1

- Manual electricity tracking
- Manual gas tracking
- Local AI predictions
- Notifications
- Offline database
- House management

---

## Version 2

- Cloud synchronization
- Family accounts
- Multiple houses
- Consumption analytics
- Data backup

---

## Version 3

- GENIUS PowerPlug™ integration
- Smart sensors
- Home Assistant integration
- MQTT
- Matter
- Zigbee

---

## Version 4

- Full AI Home Assistant
- Predictive automation
- Appliance optimization
- Energy-saving recommendations
- Complete Smart Home ecosystem

---

# ❤️ Open Source

GENIUS HOME is developed openly to encourage innovation around Smart Home technologies, especially for emerging markets.

We welcome:

- Bug reports
- Feature requests
- Documentation improvements
- Pull Requests

---

# 🤝 Contributing

Contributions are welcome.

1. Fork the repository
2. Create your feature branch

```
git checkout -b feature/my-feature
```

3. Commit your changes

```
git commit -m "Add new feature"
```

4. Push

```
git push origin feature/my-feature
```

5. Open a Pull Request

---

# 📜 License

Licensed under the **Apache License 2.0**.

See the LICENSE file for details.

---

# 🌍 About GENIUS GROUPS

GENIUS HOME™ is an initiative of **GENIUS GROUPS SAS**, an African technology company building innovative products in:

- Artificial Intelligence
- FinTech
- Smart Home
- IoT
- Cloud Platforms
- Digital Public Infrastructure

Our mission is to build technologies that solve everyday problems across Africa through intelligent, accessible, and scalable solutions.

---

# ⭐ Support the Project

If you like this project:

⭐ Star the repository

🐛 Report issues

💡 Suggest new ideas

🤝 Contribute

Together, let's build the future of Smart Homes in Africa.