# WindowWarden

🪟 Automatic window management for macOS. Arrange windows intelligently based on your activity.

## Features

- 🎯 **Smart Layouts** - Presets for coding, writing, meetings
- 📐 **Auto Arrange** - Windows snap to optimal positions
- 🔄 **App Profiles** - Different layouts per app combination
- ⌨️ **Hotkeys** - Quick layout switching
- 🖥️ **Multi-Display** - Optimized for multiple monitors
- 📏 **Grid System** - Snap to custom grids
- 💾 **Session Save** - Remember window arrangements
- 🤖 **Auto-Detect** - Switch layouts based on open apps

## Installation

```bash
git clone https://github.com/LennardVW/WindowWarden.git
cd WindowWarden
swift build -c release
cp .build/release/windowwarden /usr/local/bin/
```

## Usage

```bash
# Apply coding layout
windowwarden apply coding

# Apply writing layout  
windowwarden apply writing

# Save current layout
windowwarden save mylayout

# Load saved layout
windowwarden load mylayout

# Enable auto-mode
windowwarden auto
```

## Preset Layouts

### Coding
- IDE: Left 70%
- Terminal: Right top 30%
- Browser/Docs: Right bottom 30%

### Writing
- Writing app: Center 60%
- Research: Left 20%
- Notes: Right 20%

### Meeting
- Video call: Center large
- Chat: Right side
- Notes: Bottom

### Research
- Browser 1: Left 50%
- Browser 2: Right 50%

### Focused
- Active app: Full screen
- Others: Minimized

## Custom Layouts

```bash
# Create custom layout
windowwarden custom
# Interactive layout editor

# Define zones
windowwarden zone add left 0 0 0.5 1
windowwarden zone add right 0.5 0 0.5 1

# Assign apps to zones
windowwarden assign Safari left
windowwarden assign Xcode right
```

## Configuration

`~/.windowwarden/config.json`:
```json
{
  "defaultLayout": "coding",
  "autoSwitch": true,
  "animationDuration": 0.3,
  "margin": 10
}
```

## Requirements
- macOS 15.0+ (Tahoe)
- Swift 6.0+
- Accessibility permissions

## License
MIT
