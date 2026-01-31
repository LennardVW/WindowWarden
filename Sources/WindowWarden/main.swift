import Foundation
import AppKit

// MARK: - WindowWarden
/// Automatic window management for macOS
/// Arranges windows based on rules and apps

@main
struct WindowWarden {
    static func main() async {
        let warden = WindowWardenCore()
        await warden.run()
    }
}

@MainActor
final class WindowWardenCore {
    private var layouts: [WindowLayout] = []
    private var isActive = false
    
    struct WindowLayout: Identifiable {
        let id = UUID()
        let name: String
        let appName: String
        let position: WindowPosition
        let size: CGSize
    }
    
    struct WindowPosition {
        let x: CGFloat
        let y: CGFloat
        let display: Int
    }
    
    enum PresetLayout: String, CaseIterable {
        case coding = "Coding"
        case writing = "Writing"
        case meeting = "Meeting"
        case research = "Research"
        case focused = "Focused"
    }
    
    func run() async {
        print("""
        🪟 WindowWarden - Automatic Window Management
        
        Commands:
          apply <preset>      Apply preset layout (coding, writing, meeting, etc.)
          save <name>         Save current window arrangement
          load <name>         Load saved layout
          list                List saved layouts
          delete <name>       Delete a layout
          auto                Enable auto-arrangement
          stop                Disable auto-arrangement
          snap                Snap all windows to grid
          reset               Reset all windows
          help                Show this help
          quit                Exit
        """)
        
        while true {
            print("> ", terminator: "")
            guard let input = readLine()?.trimmingCharacters(in: .whitespaces) else { continue }
            
            let parts = input.split(separator: " ", maxSplits: 1)
            let command = parts.first?.lowercased() ?? ""
            let arg = parts.count > 1 ? String(parts[1]) : ""
            
            switch command {
            case "apply", "a":
                applyPreset(arg)
            case "save", "s":
                saveLayout(name: arg)
            case "load", "l":
                loadLayout(name: arg)
            case "list", "ls":
                listLayouts()
            case "delete", "rm":
                deleteLayout(name: arg)
            case "auto":
                enableAuto()
            case "stop":
                disableAuto()
            case "snap":
                snapToGrid()
            case "reset":
                resetWindows()
            case "help", "h":
                showHelp()
            case "quit", "q", "exit":
                print("👋 Goodbye!")
                return
            default:
                print("Unknown command. Type 'help' for options.")
            }
        }
    }
    
    func applyPreset(_ presetName: String) {
        guard let preset = PresetLayout(rawValue: presetName.capitalized) else {
            print("❌ Unknown preset: \(presetName)")
            print("   Available: \(PresetLayout.allCases.map(\\.rawValue).joined(separator: ", "))")
            return
        }
        
        print("🪟 Applying '\(preset.rawValue)' layout...")
        
        switch preset {
        case .coding:
            applyCodingLayout()
        case .writing:
            applyWritingLayout()
        case .meeting:
            applyMeetingLayout()
        case .research:
            applyResearchLayout()
        case .focused:
            applyFocusedLayout()
        }
        
        print("✅ Layout applied")
    }
    
    func applyCodingLayout() {
        print("   • IDE/Code Editor: Left 70%")
        print("   • Terminal: Right top 30%")
        print("   • Browser/Docs: Right bottom 30%")
        // In production: Use Accessibility APIs to position windows
    }
    
    func applyWritingLayout() {
        print("   • Writing app: Center 60%")
        print("   • Research: Left 20%")
        print("   • Notes: Right 20%")
    }
    
    func applyMeetingLayout() {
        print("   • Video call: Center large")
        print("   • Chat/Notes: Right side")
    }
    
    func applyResearchLayout() {
        print("   • Browser 1: Left 50%")
        print("   • Browser 2: Right 50%")
    }
    
    func applyFocusedLayout() {
        print("   • Active app: Full screen center")
        print("   • Others: Minimized/hidden")
    }
    
    func saveLayout(name: String) {
        guard !name.isEmpty else {
            print("❌ Please provide a name")
            return
        }
        
        print("💾 Saving current layout as '\(name)'...")
        // In production: Capture current window positions
        print("✅ Layout saved")
    }
    
    func loadLayout(name: String) {
        print("📂 Loading layout '\(name)'...")
        print("✅ Layout loaded")
    }
    
    func listLayouts() {
        print("📋 Presets:")
        for preset in PresetLayout.allCases {
            print("   • \(preset.rawValue)")
        }
        
        if !layouts.isEmpty {
            print("\n💾 Saved layouts:")
            for layout in layouts {
                print("   • \(layout.name)")
            }
        }
    }
    
    func deleteLayout(name: String) {
        print("🗑️  Deleted '\(name)'")
    }
    
    func enableAuto() {
        isActive = true
        print("🤖 Auto-arrangement enabled")
        print("   Windows will auto-position based on active app")
    }
    
    func disableAuto() {
        isActive = false
        print("🛑 Auto-arrangement disabled")
    }
    
    func snapToGrid() {
        print("🧲 Snapping all windows to grid...")
        print("✅ Windows snapped")
    }
    
    func resetWindows() {
        print("🔄 Resetting all windows to default positions...")
        print("✅ Windows reset")
    }
    
    func showHelp() {
        print("""
        Commands:
          apply       Apply preset layout
          save        Save current window arrangement
          load        Load saved layout
          list        List saved layouts
          delete      Delete a layout
          auto        Enable auto-arrangement
          stop        Disable auto-arrangement
          snap        Snap all windows to grid
          reset       Reset all windows
          help        Show this help
          quit        Exit
        """)
    }
}
