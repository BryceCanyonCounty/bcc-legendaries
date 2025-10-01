# BCC Legendaries 🏹

> **An immersive legendary animal hunting system for RedM featuring dynamic hunts, trust progression, and cross-resource integration with enterprise-grade security.**

## 📖 Overview

BCC Legendaries transforms the hunting experience by introducing a comprehensive system for tracking and hunting legendary animals. Each hunt is a unique adventure with challenging NPCs, strategic planning, and valuable rewards. The script features an advanced trust system with secure exports, professional database management, and enterprise-grade security features.

## 🆕 What's New in v3.0.0

### 🚀 **Major Architecture Improvements**

- **Keyed Hunt System**: Converted from array-based to keyed table format for O(1) lookup performance
- **Memory Leak Prevention**: Smart cleanup system prevents stale hunt data accumulation
- **Non-blocking Timers**: Replaced blocking threads with efficient timer-based cleanup
- **Precision Calculations**: Fixed floating-point issues in discount calculations

### 🔒 **Security Enhancements**

- **Secure Trust Exports**: Authorization-based access control for cross-resource integration
- **Rate Limiting**: Prevents abuse of trust system exports
- **Input Validation**: Comprehensive validation for all trust operations
- **Audit Logging**: Complete audit trail with Discord integration support

### ⚙️ **Configuration & Database**

- **Auto Schema Management**: Database tables and migrations handled automatically
- **Multi-DB Support**: Compatible with MySQL and OxMySQL with fallback handling

## ✨ Core Features

### 🦌 **Legendary Animals**

- **63 Unique Hunts**: Wide variety from Legendary Pronghorn to Legendary Golden Spirit Bear
- **Unique Models**: Each animal has distinct characteristics and behaviors
- **Varied Locations**: Hunts span across different regions and environments
- **Dynamic Health**: Balanced difficulty scaling for engaging combat

### 🎯 **Trust Progression System**

- **Database Integration**: Persistent trust levels stored securely
- **Level Requirements**: Hunts locked behind trust thresholds
- **Automatic Tracking**: Trust gained/lost through gameplay
- **Cross-Resource Compatible**: Secure export functions for other scripts
- **Rate Limited**: Protection against abuse with configurable limits

### 🛡️ **Challenge Elements**

- **Enemy NPCs**: Hostile entities defending legendary animals
- **Secondary Animals**: Additional creatures spawned during hunts
- **Hint System**: Progressive clues guide players to targets
- **Map Integration**: Blips and waypoints for navigation

### 💰 **Reward System**

- **Legendary Materials**: Unique pelts, antlers, and rare items
- **Crafting Components**: Materials for advanced recipes
- **Economic Integration**: Valuable items for trading/selling
- **Hunt-Specific Rewards**: Each animal drops unique loot

### ⏱️ **Strategic Elements**

- **Cooldown Periods**: Prevents hunt farming and adds planning
- **Currency Costs**: Economic investment required for hunts
- **Trust Gates**: Progressive unlocking of higher-tier hunts
- **Risk vs Reward**: Balanced challenge and reward scaling

### 🗄️ **Advanced Database**

- **Auto Schema Management**: Tables created and maintained automatically
- **Migration Support**: Version tracking for seamless updates
- **Multi-DB Compatible**: Works with MySQL and OxMySQL
- **Admin Tools**: Console commands for database management

## 🎮 How to Play

### 1. **Prepare for the Hunt**

- Visit a hunter shop or designated location
- Check your trust level with `/hunterLevel`
- Ensure you have sufficient currency for the hunt cost
- Select your target legendary animal from the menu

### 2. **Track Your Target**

- Follow initial hint boxes and map blips
- Defeat enemy NPCs to unlock additional clues
- Use the progressive hint system to locate your quarry
- Navigate through dynamic spawn locations

### 3. **Engage in Combat**

- Confront the legendary animal in epic battles
- Deal with secondary animals and environmental challenges
- Utilize strategic approaches for enhanced health enemies
- Manage resources and ammunition effectively

### 4. **Claim Your Rewards**

- Skin the legendary animal using the built-in system
- Receive unique pelts, antlers, and rare materials
- Gain trust points for successful completions
- Use rewards for crafting, trading, or selling

## 🔧 Commands

### Player Commands

| Command | Description |
|---------|-------------|
| `/hunterLevel` | Check your current trust level and hunting progress |

### Administrative Commands

| Command | Access | Description |
|---------|--------|-------------|
| `bcc-legendaries:init` | Console | Force database initialization and schema creation |
| `bcc-legendaries:verify` | Console | Verify database schema integrity and accessibility |

## 🔌 Developer API

### Trust System Exports

BCC Legendaries provides a comprehensive API for other resources to interact with the trust system:

| Function | Parameters | Returns | Description |
|----------|------------|---------|-------------|
| `GetPlayerTrust` | `identifier`, `charidentifier` | `number` | Retrieve player's current trust level |
| `SetPlayerTrust` | `identifier`, `charidentifier`, `trust` | `boolean` | Set player's trust to specific value |
| `AddPlayerTrust` | `identifier`, `charidentifier`, `trustToAdd` | `boolean` | Add trust points to player's total |
| `RemovePlayerTrust` | `identifier`, `charidentifier`, `trustToRemove` | `boolean` | Remove trust points (minimum 0) |

### Code Examples

**Basic Trust Operations:**

```lua
-- Get current trust level
local trust = exports['bcc-legendaries']:GetPlayerTrust(identifier, charidentifier)

-- Reward player with trust points
local success = exports['bcc-legendaries']:AddPlayerTrust(identifier, charidentifier, 15)

-- Check if player meets trust requirement
if trust >= 50 then
    -- Allow access to premium content
end
```

## 📋 Dependencies

| Resource | Version | Required | Description |
|----------|---------|----------|-------------|
| [vorp_core](https://github.com/VORPCORE/vorp-core-lua) | Latest | ✅ | Core framework for RedM |
| [vorp_inventory](https://github.com/VORPCORE/vorp_inventory-lua) | Latest | ✅ | Inventory system for item management |
| [bcc-utils](https://github.com/BryceCanyonCounty/bcc-utils) | Latest | ✅ | BCC utility functions and Discord integration |
| [feather-menu](https://github.com/FeatherFramework/feather-menu/releases) | Latest | ✅ | Menu system for hunt selection interface |

## 🚀 Installation

### Quick Setup

1. **Prerequisites**
   - Ensure all dependencies are installed and updated

2. **File Installation**

   ```bash
   # Add to your resources folder
   resources/
   └── bcc-legendaries/
   ```

3. **Database Setup**
   - Database tables will auto-create on first run

4. **Server Configuration**

   ```cfg
   # Add to server.cfg or resources.cfg
   ensure bcc-legendaries
   ```

5. **Restart Server**
   - Restart your server to load the resource
   - Check console for successful initialization

### Verification

Run these console commands to verify database installation:

- `bcc-legendaries:verify` - Check database connectivity
- `bcc-legendaries:init` - Force initialization if needed

## 📝 Important Notes

### ⚠️ **Critical Information**

- **Legendary Models Only**: Only use legendary animal models in hunt configurations to prevent duplication bugs
- **Hunting Script Conflicts**: Remove legendary animals from other hunting scripts to avoid conflicts
- **Built-in Skinning**: This script includes its own skinning system derived from vorp_hunting

### 🆕 **Recent Improvements**

- **Item Currency System**: Enhanced logic for item consumption and validation
- **Keyed Hunt System**: Performance-optimized hunt identification and tracking
- **Trust System API**: Full export support for cross-resource integration  
- **Auto Database Management**: Automatic schema creation and migration support
- **Enhanced Stability**: Improved error handling and resource management

### 🤝 **Community & Support**

- **Open Source**: Feel free to modify and improve the code
- **Community Sharing**: Please share improvements with the community
- **Pull Requests**: Contributions and optimizations are welcomed

### 📄 **Credits**

Special thanks to the VORP hunting system for skinning components that were adapted for this script.

---

## 🔗 Repository

**GitHub**: [BryceCanyonCounty/bcc-legendaries](https://github.com/BryceCanyonCounty/bcc-legendaries)

> **Enjoy the hunt! 🏹**
